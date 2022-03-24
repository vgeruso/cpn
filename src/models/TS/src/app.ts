import express from 'express';
import dotenv from 'dotenv';

import { router } from './router';
export class App {
  public server: express.Application;

  constructor() {
    dotenv.config();
    this.server = express();
    this.middleware();
    this.router();
  }

  private middleware(): void {
    this.server.use(express.json());
  }

  private router(): void {
    this.server.use('/api', router);
  }
}