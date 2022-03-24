#!/usr/bin/env node

const app = require('commander');
const shell = require('shelljs');
const chalk = require('chalk');
const package = require('./package.json');
const dotenv = require('dotenv');

dotenv.config();

app.version(package.version);

app
  .command('init [projectName]')
  .description('Create an project')
  .option('-js, --javascript', 'Indicates that the API will be in JavaScript')
  .option('-ts, --typescript', 'Indicates that the API will be in TypeScript')
  .action(async (projectName, options) => {
    if (!projectName) {
      console.log('[ERROR]:: Enter tho project name');
      return;
    }
    
    const folder = shell.exec(`mkdir ${projectName}`, { silent: true });
    if(folder.code) {
      console.log(chalk.red('[ERROR]:: creating folder'));
      console.log(folder.stderr);
      return;
    }
    
    shell.cd(projectName);
    
    const dirProject = shell.pwd().stdout;

    shell.exec(`yarn init -y`, { silent: true });
    
    // Dependencies
    shell.exec(`yarn add express`, { silent: true });
    shell.exec(`yarn add cors`, { silent: true });
    shell.exec(`yarn add dotenv`, { silent: true });
    
    if(options.javascript) {
      // Dev Dependencies
      shell.exec(`yarn add sucrase nodemon eslint prettier -D`, { silent: true });
      shell.exec(`yarn add eslint-config-prettier eslint-plugin-prettier -D`, { silent: true });

      shell.exec(`sed -i '6i\  "scripts": {\' package.json`);
      shell.exec(`sed -i '7i\    "dev": "nodemon src/server.js",\' package.json`);
      shell.exec(`sed -i '8i\    "dev:debug": "nodemon --inspect src/server.js",\' package.json`);
      shell.exec(`sed -i '9i\    "start": "node -r sucrase/register src/server.js"\' package.json`);
      shell.exec(`sed -i '10i\  },\' package.json`);

      if (process.env.NODE_ENV === "DEV") {
        shell.exec(`cp -r $CPN_DIR_DEV/src/models/JS/* ${dirProject}`);
        shell.exec(`cp $CPN_DIR_DEV/src/models/JS/.* ${dirProject}`);
        shell.exec(`cp $CPN_DIR_DEV/src/models/JS/n* ${dirProject}`);
      } else {
        shell.exec(`cp -r $CPN_DIR/src/models/JS/* ${dirProject}`);
        shell.exec(`cp $CPN_DIR/src/models/JS/.* ${dirProject}`);
        shell.exec(`cp $CPN_DIR/src/models/JS/n* ${dirProject}`);
      }
    } else {
      // Dev Dependencies
      shell.exec(`yarn add nodemon ts-node typescript -D`, { silent: true });
      shell.exec(`yarn add @types/node @types/express -D`, { silent: true });

      shell.exec(`sed -i '6i\  "scripts": {\' package.json`);
      shell.exec(`sed -i '7i\    "dev": "nodemon",\' package.json`);
      shell.exec(`sed -i '8i\    "build": "npx tsc"\' package.json`);
      shell.exec(`sed -i '9i\  },\' package.json`);

      if (process.env.NODE_ENV === "DEV") {
        shell.exec(`cp -r $CPN_DIR_DEV/src/models/TS/* ${dirProject}`);
        shell.exec(`cp $CPN_DIR_DEV/src/models/TS/.* ${dirProject}`);
        shell.exec(`cp $CPN_DIR_DEV/src/models/TS/n* ${dirProject}`);
        shell.exec(`cp $CPN_DIR_DEV/src/models/TS/t* ${dirProject}`);
      } else {
        shell.exec(`cp -r $CPN_DIR/src/models/TS/* ${dirProject}`);
        shell.exec(`cp $CPN_DIR/src/models/TS/.* ${dirProject}`);
        shell.exec(`cp $CPN_DIR/src/models/TS/n* ${dirProject}`);
        shell.exec(`cp $CPN_DIR/src/models/TS/t* ${dirProject}`);
      }
    }

    shell.touch('README.md');
    shell.exec(`echo "# ${projectName}" >> README.md`);

    // git
    shell.exec(`git init`, { silent: true });
    shell.exec(`git add .`, { silent: true });
    shell.exec(`git commit -m "initial commit"`, { silent: true });
    shell.exec(`git branch -m master main`, { silent: true });

    shell.exec(`clear`);

    console.log("To start your application:\n");
    console.log(`cd ${projectName}\n`);
    console.log("Create the file .dotenv with the content of .env.example and set variable 'PORT'\n");
    console.log("Run Your project:");
    console.log("yarn dev");
    console.log("or");
    console.log("yarn start\n");
    console.log("will be running on: http://localhost:PORT/api/\n");
    console.log("Created by Victor Geruso");
});

app.parse(process.argv);