import { Router, Response } from "express";

const router: Router = Router();

// Routes
// Home
router.get('/', (_, res: Response) => {
  const obj: any = {
    row: 'Hello Welcome to cpn API',
    status: 200
  }

  return res.status(obj.status).json(obj);
});

export { router };
