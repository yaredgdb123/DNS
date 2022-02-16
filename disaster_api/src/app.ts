import express, { json } from 'express';
import cors from 'cors';
import morgan from 'morgan';
import http from 'http';
import { Client } from 'pg';
const client = new Client(
  {
    user: 'root',
    host: 'https://3868-196-188-240-144.eu.ngrok.io',
    database: 'DNS',
    password: 'postgres',
    port: 3211,
  }
)

const app = express();
const port = 3000;
app.use(cors());

app.use(json());
app.use(morgan('tiny'));

app.get('/', (req, res) => {
  res.send('Hello World!');
});
app.post('/login', (req, res) => {
  const email = req.body.email;
  const password = req.body.email;
  console.log("email: " + email);
  console.log("password: " + password);
  //Query for user and send city code if found or error if not
  res.send({ "data": 1 });


});
app.get('/disasters', (req, res) => {
  const page = Number.parseInt(req.query.page as string);
  const city = Number.parseInt(req.query.city as string);
  console.log("page " + page);
  console.log("city " + city);
  res.send('Hello World!');
});
app.get('/downed-services', (req, res) => {
  const page = Number.parseInt(req.query.page as string);
  const diasterIds = req.query.disasterIds;
  console.log("page " + page);
  console.log("diasterIds " + diasterIds[0]);

  res.send('Hello World!');

});




export const server = http.createServer(app);
client.connect().then((_) => "Connected to db").catch(console.log);
server.listen(port, () => {
  return console.log(`Expresss is listening at http://localhost:${port}`);
});
