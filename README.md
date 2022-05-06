# CPN (create project node)

basic Node ES6 API project creator

## Get Started

### Required programs

The cpn requires the following systems installed:

- [Node.JS LTS](https://nodejs.org/en/)
- [Yarn](https://yarnpkg.com/getting-started)

### Install

In the root directory `~/` execute:

```bash
$ wget https://raw.githubusercontent.com/vgeruso/cpn/2.0.0/install.sh
```

```bash
$ sudo chmod 733 install.sh
```

```bash
$ ./install.sh
```

or

```bash
$ bash install.sh
```

### Running CPN

Run in a required folder:

```bash
$ cpn init my-project
```

In 'my-project' means the name of your project

Grant during the process a series of questions will be asked for the configuration of eslint, follow the recommended answers for an API, however this varies depending on the project and the time it is developing:

1. To check the syntax, find problems and apply the code style
2. JavaScript modules (import / export)
3. None of these
4. Node => Use space to unmark browser and mark node then press enter
5. Use a popular style guide
6. Airbnb
7. JavaScript

After answering the questions answer `yes` to install some dependencies through NPM.

Completed all the settings of the script will show the following message:

To start your application:

```bash
$ cd my-project/
```

```bash
$ yarn dev
```

or

```bash
$ yarn start
```

will be running on: http://localhost:3333/api/

Created by Victor Geruso
