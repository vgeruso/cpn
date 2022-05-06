import express from 'express';

const routes = express.Router();

routes.get('/', (_, res) => {
  const object = {
    msg: 'Welcome to cpn API',
    status: 200,
  };
  return res.status(object.status).json(object);
});

const home = express().use(routes);

export default home;
