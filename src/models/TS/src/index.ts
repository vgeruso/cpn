import { App } from './app';
import dotenv from 'dotenv';

dotenv.config();

new App().server.listen(process.env.PORT, () => {
  console.log(`Server on in http://localhost:${process.env.PORT}/api/`);
});
