import express from 'express';

import home from './home';

const routes = express().use('/', [home]);

export default routes;
