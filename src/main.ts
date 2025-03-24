import express, { type Application } from 'express';

const app: Application = express();

const port = 5000;

app.listen(port, () => {
  console.log(`Server running is on ${port} port`);
});
