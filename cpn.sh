#!/usr/bin/env bash
mkdir $1
cd $1/

yarn init -y
yarn add sucrase nodemon -D

sed -i '6i\  "scripts": {\' package.json
sed -i '7i\    "dev": "nodemon src/server.js",\' package.json
sed -i '8i\    "dev:debug": "nodemon --inspect src/server.js",\' package.json
sed -i '9i\    "start": "node -r sucrase/register src/server.js"\' package.json
sed -i '10i\  },\' package.json

touch nodemon.json
echo -e '{' >> nodemon.json
echo -e	' "execMap": {' >> nodemon.json
echo -e	'   "js": "node -r sucrase/register"' >> nodemon.json
echo -e	' }' >> nodemon.json
echo -e '}' >> nodemon.json

yarn add eslint -D
yarn add prettier eslint-config-prettier eslint-plugin-prettier -D

yarn eslint --init
rm package-lock.json
yarn

echo -n > .eslintrc.js

echo -e "module.exports = {" >> .eslintrc.js
echo -e "  env: {" >> .eslintrc.js
echo -e "    es6: true," >> .eslintrc.js
echo -e "    node: true," >> .eslintrc.js
echo -e "  }," >> .eslintrc.js
echo -e "  extends: ['airbnb-base', 'prettier']," >> .eslintrc.js
echo -e "  plugins: ['prettier']," >> .eslintrc.js
echo -e "  globals: {" >> .eslintrc.js
echo -e "    Atomics: 'readonly'," >> .eslintrc.js
echo -e "    SharedArrayBuffer: 'readonly'," >> .eslintrc.js
echo -e "  }," >> .eslintrc.js
echo -e "  parserOptions: {" >> .eslintrc.js
echo -e "    ecmaVersion: 2018," >> .eslintrc.js
echo -e "    sourceType: 'module'," >> .eslintrc.js
echo -e "  }," >> .eslintrc.js
echo -e "  rules: {" >> .eslintrc.js
echo -e "    'prettier/prettier': 'error'," >> .eslintrc.js
echo -e "    'class-methods-use-this': 'off'," >> .eslintrc.js
echo -e "    'no-param-reassign': 'off'," >> .eslintrc.js
echo -e "    camelcase: 'off'," >> .eslintrc.js
echo -e "    'no-unused-vars': ['error', { argsIgnorePattern: 'next' }]" >> .eslintrc.js
echo -e "  }," >> .eslintrc.js
echo -e "};">> .eslintrc.js

touch .prettierrc
echo -e '{' >> .prettierrc
echo -e '  "singleQuote": true,' >> .prettierrc
echo -e '  "trailingComma": "es5"' >> .prettierrc
echo -e '}' >> .prettierrc

touch .editorconfig
echo -e "root = true\n" >> .editorconfig
echo -e "[*]" >> .editorconfig
echo -e "indent_style = space" >> .editorconfig
echo -e "indent_size = 2" >> .editorconfig
echo -e "charset = utf-8" >> .editorconfig
echo -e "trim_trailing_whitespace = true" >> .editorconfig
echo -e "insert_final_newline = true" >> .editorconfig

yarn add express

mkdir src
cd src/

touch routes.js
echo -e "import express from 'express';\n" >> routes.js
echo -e "const routes = express.Router();\n" >> routes.js
echo -e "routes.get('/', (req, res) => {" >> routes.js
echo -e "  const object = {" >> routes.js
echo -e "    server: 'ok'," >> routes.js
echo -e "    status: 200," >> routes.js
echo -e "  };" >> routes.js
echo -e "  return res.status(object.status).json(object);" >> routes.js
echo -e "});\n" >> routes.js
echo -e "export default routes;" >> routes.js

touch app.js
echo -e "import express from 'express';\n" >> app.js
echo -e "import routes from './routes';\n" >> app.js
echo -e "class App {" >> app.js
echo -e "  constructor() {" >> app.js
echo -e "    this.express = express();\n" >> app.js
echo -e "    this.middleware();" >> app.js
echo -e "    this.route();" >> app.js
echo -e "  }\n" >> app.js
echo -e "  middleware() {" >> app.js
echo -e "    this.express.use(express.json());" >> app.js
echo -e "  }\n" >> app.js
echo -e "  route() {" >> app.js
echo -e "    this.express.use('/api', routes);" >> app.js
echo -e "  }" >> app.js
echo -e "}\n" >> app.js
echo -e "export default new App().express;" >> app.js

touch server.js
echo -e "import app from './app';\n" >> server.js
echo -e "const PORT = 3333;\n" >> server.js
echo -e "app.listen(PORT, () => {" >> server.js
echo -e "  console.log('Server on'); // eslint-disable-line" >> server.js
echo -e "});" >> server.js

cd ..

git init

touch .gitignore
echo -e "logs" >> .gitignore
echo -e "*.log" >> .gitignore
echo -e "npm-debug.log*" >> .gitignore
echo -e "yarn-debug.log*" >> .gitignore
echo -e "yarn-error.log*" >> .gitignore
echo -e "lerna-debug.log*\n" >> .gitignore
echo -e "report.[0-9]*.[0-9]*.[0-9]*.[0-9]*.json\n" >> .gitignore
echo -e "pids" >> .gitignore
echo -e "*.pid" >> .gitignore
echo -e "*.seed" >> .gitignore
echo -e "*.pid.lock\n" >> .gitignore
echo -e "lib-cov\n" >> .gitignore
echo -e "coverage" >> .gitignore
echo -e "*.lcov\n" >> .gitignore
echo -e ".nyc_output\n" >> .gitignore
echo -e ".grunt\n" >> .gitignore
echo -e "bower_components\n" >> .gitignore
echo -e ".lock-wscript\n" >> .gitignore
echo -e "build/Release\n" >> .gitignore
echo -e "node_modules/" >> .gitignore
echo -e "jspm_packages/\n" >> .gitignore
echo -e "typings/\n" >> .gitignore
echo -e "*.tsbuildinfo\n" >> .gitignore
echo -e ".npm\n" >> .gitignore
echo -e ".eslintcache\n" >> .gitignore
echo -e ".rpt2_cache/" >> .gitignore
echo -e ".rts2_cache_cjs/" >> .gitignore
echo -e ".rts2_cache_es/" >> .gitignore
echo -e ".rts2_cache_umd/\n" >> .gitignore
echo -e ".node_repl_history\n" >> .gitignore
echo -e "*.tgz\n" >> .gitignore
echo -e ".yarn-integrity\n" >> .gitignore
echo -e ".env" >> .gitignore
echo -e ".env.test" >> .gitignore
echo -e ".env*.local\n" >> .gitignore
echo -e ".cache" >> .gitignore
echo -e ".parcel-cache\n" >> .gitignore
echo -e ".next\n" >> .gitignore
echo -e ".nuxt" >> .gitignore
echo -e "dist\n" >> .gitignore
echo -e ".cache/\n" >> .gitignore
echo -e ".vuepress/dist\n" >> .gitignore
echo -e ".serverless/\n" >> .gitignore
echo -e ".fusebox/\n" >> .gitignore
echo -e ".dynamodb/\n" >> .gitignore
echo -e ".tern-port\n" >> .gitignore
echo -e ".vscode-test" >> .gitignore

clear
echo "To start your application:"
echo ""
echo "cd $1/"
echo ""
echo "yarn dev"
echo "or"
echo "yarn start"
echo ""
echo "will be running on: http://localhost:3333/api/"
echo ""
echo "Created by Victor Geruso"
