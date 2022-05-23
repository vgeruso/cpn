import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';

import routes from './routes';

dotenv.config();

const { PORT } = process.env;

const app = express();

app.use(cors());
app.use(express.json());
app.use('/api', routes);

app.listen(PORT, () => {
  console.log(`Server on in http://localhost:${PORT}/api/`); // eslint-disable-line
});
