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

'my-project' means the name of your project

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
