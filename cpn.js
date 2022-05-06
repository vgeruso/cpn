#!/usr/bin/env node
const app = require('commander');
const shell = require('shelljs');
const chalk = require('chalk');
const package = require('./package.json');
const dotenv = require('dotenv');
const cliProgress = require('cli-progress');
const colors = require('ansi-colors');

dotenv.config();

const progressBar = new cliProgress.SingleBar({
  format: 'Creation progress |' + colors.cyan('{bar}') + '| {percentage}%',
  barCompleteChar: '\u2588',
  barIncompleteChar: '\u2591',
  hideCursor: true
}, cliProgress.Presets.shades_classic);

app.version(package.version);

app
  .command('init [projectName]')
  .description('Create an project')
  .option('-js, --javascript', 'Indicates that the API will be in JavaScript')
  .option('-ts, --typescript', 'Indicates that the API will be in TypeScript')
  .action(async (projectName, options) => {
    progressBar.start(100, 0);
    if (!projectName) {
      shell.exec(`clear`);
      app.error('[ERROR]:: Enter the project name');
      return;
    }
    
    const folder = shell.exec(`mkdir ${projectName}`, { silent: true });
    if(folder.code) {
      shell.exec(`clear`);
      app.error(chalk.red('[ERROR]:: the folder with the same name already exists in the location'));
      return;
    }
    progressBar.update(5);
    
    shell.cd(projectName);
    progressBar.update(15);
    
    const dirProject = shell.pwd().stdout;
    progressBar.update(20);

    shell.exec(`yarn init -y`, { silent: true });
    progressBar.update(25);
    
    // Dependencies
    shell.exec(`yarn add express`, { silent: true });
    progressBar.update(30);
    shell.exec(`yarn add cors`, { silent: true });
    progressBar.update(35);
    shell.exec(`yarn add dotenv`, { silent: true });
    progressBar.update(40);

    if(options.javascript) {
      // Dev Dependencies
      shell.exec(`yarn add sucrase nodemon eslint prettier -D`, { silent: true });
      progressBar.update(45);
      shell.exec(`yarn add eslint-config-prettier eslint-plugin-prettier -D`, { silent: true });
      progressBar.update(50);

      shell.exec(`sed -i '6i\  "scripts": {\' package.json`);
      progressBar.update(55);
      shell.exec(`sed -i '7i\    "dev": "nodemon src/server.js",\' package.json`);
      progressBar.update(60);
      shell.exec(`sed -i '8i\    "dev:debug": "nodemon --inspect src/server.js",\' package.json`);
      progressBar.update(65);
      shell.exec(`sed -i '9i\    "start": "node -r sucrase/register src/server.js"\' package.json`);
      progressBar.update(70);
      shell.exec(`sed -i '10i\  },\' package.json`);
      progressBar.update(75);

      if (process.env.NODE_ENV === "DEV") {
        shell.exec(`cp -r $CPN_DIR_DEV/src/models/JS/* ${dirProject}`);
        progressBar.update(80);
        shell.exec(`cp $CPN_DIR_DEV/src/models/JS/.editorconfig ${dirProject}`);
        progressBar.update(81);
        shell.exec(`cp $CPN_DIR_DEV/src/models/JS/.env.example ${dirProject}`);
        progressBar.update(82);
        shell.exec(`cp $CPN_DIR_DEV/src/models/JS/.eslintrc.js ${dirProject}`);
        progressBar.update(83);
        shell.exec(`cp $CPN_DIR_DEV/src/models/JS/.gitignore ${dirProject}`);
        progressBar.update(84);
        shell.exec(`cp $CPN_DIR_DEV/src/models/JS/.prettierrc ${dirProject}`);
        progressBar.update(85);
        shell.exec(`cp $CPN_DIR_DEV/src/models/JS/nodemon.json ${dirProject}`);
        progressBar.update(90);
      } else {
        shell.exec(`cp -r $CPN_DIR/src/models/JS/* ${dirProject}`);
        progressBar.update(80);
        shell.exec(`cp $CPN_DIR_DEV/src/models/JS/.editorconfig ${dirProject}`);
        progressBar.update(81);
        shell.exec(`cp $CPN_DIR_DEV/src/models/JS/.env.example ${dirProject}`);
        progressBar.update(82);
        shell.exec(`cp $CPN_DIR_DEV/src/models/JS/.eslintrc.js ${dirProject}`);
        progressBar.update(83);
        shell.exec(`cp $CPN_DIR_DEV/src/models/JS/.gitignore ${dirProject}`);
        progressBar.update(84);
        shell.exec(`cp $CPN_DIR_DEV/src/models/JS/.prettierrc ${dirProject}`);
        progressBar.update(85);
        shell.exec(`cp $CPN_DIR/src/models/JS/nodemon.json ${dirProject}`);
        progressBar.update(90);
      }
    } else {
      // Dev Dependencies
      shell.exec(`yarn add nodemon ts-node typescript -D`, { silent: true });
      progressBar.update(45);
      shell.exec(`yarn add @types/node @types/express -D`, { silent: true });
      progressBar.update(50);

      shell.exec(`sed -i '6i\  "scripts": {\' package.json`);
      progressBar.update(55);
      shell.exec(`sed -i '7i\    "dev": "nodemon",\' package.json`);
      progressBar.update(60);
      shell.exec(`sed -i '8i\    "build": "npx tsc"\' package.json`);
      progressBar.update(65);
      shell.exec(`sed -i '9i\  },\' package.json`);
      progressBar.update(70);
      
      if (process.env.NODE_ENV === "DEV") {
        shell.exec(`cp -r $CPN_DIR_DEV/src/models/TS/* ${dirProject}`);
        progressBar.update(75);
        shell.exec(`cp $CPN_DIR_DEV/src/models/TS/.editorconfig ${dirProject}`);
        progressBar.update(80);
        shell.exec(`cp $CPN_DIR_DEV/src/models/TS/.env.example ${dirProject}`);
        progressBar.update(82);
        shell.exec(`cp $CPN_DIR_DEV/src/models/TS/.gitignore ${dirProject}`);
        progressBar.update(84);
        shell.exec(`cp $CPN_DIR_DEV/src/models/TS/nodemon.json ${dirProject}`);
        progressBar.update(85);
        shell.exec(`cp $CPN_DIR_DEV/src/models/TS/tsconfig.json ${dirProject}`);
        progressBar.update(90);
      } else {
        shell.exec(`cp -r $CPN_DIR/src/models/TS/* ${dirProject}`);
        progressBar.update(75);
        shell.exec(`cp $CPN_DIR_DEV/src/models/TS/.editorconfig ${dirProject}`);
        progressBar.update(80);
        shell.exec(`cp $CPN_DIR_DEV/src/models/TS/.env.example ${dirProject}`);
        progressBar.update(82);
        shell.exec(`cp $CPN_DIR_DEV/src/models/TS/.gitignore ${dirProject}`);
        progressBar.update(84);
        shell.exec(`cp $CPN_DIR/src/models/TS/nodemon.json ${dirProject}`);
        progressBar.update(85);
        shell.exec(`cp $CPN_DIR/src/models/TS/tsconfig.json ${dirProject}`);
        progressBar.update(90);
      }
    }

    shell.touch('README.md');
    progressBar.update(91);
    shell.exec(`echo "# ${projectName}" >> README.md`);
    progressBar.update(92);

    // git
    shell.exec(`git init`, { silent: true });
    progressBar.update(93);
    shell.exec(`git add .`, { silent: true });
    progressBar.update(94);
    shell.exec(`git commit -m "initial commit"`, { silent: true });
    progressBar.update(95);
    shell.exec(`git branch -m master main`, { silent: true });
    progressBar.update(100);
    progressBar.stop();

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

app
  .command('update')
  .description('Update the cpn')
  .action(async () => {
    if (process.env.NODE_ENV === "DEV") {
      shell.exec('$CPN_DIR_DEV/src/update.sh');
    } else {
      shell.exec('$CPN_DIR/src/update.sh');
    }
  });

app
  .command('uninstall')
  .description('uninstall the cpn')
  .action(async () => {
    if (process.env.NODE_ENV === "DEV") {
      shell.exec('$CPN_DIR_DEV/src/uninstall.sh');
    } else {
      shell.exec('$CPN_DIR/src/uninstall.sh');
    }
  });

app.parse(process.argv);
