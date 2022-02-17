import express, { json } from 'express';
import cors from 'cors';
import morgan from 'morgan';
import http from 'http';
import { Client } from 'pg';
const client = new Client(
  {
    user: 'postgres',
    host: '192.168.0.143',
    database: 'DNS',
    password: 'postgres',
    port: 5432,
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
app.post('/login', async (req, res) => {
  const email = req.body.email;
  const password = req.body.password;
  console.log("email: " + email);
  console.log("password: " + password);
  const response = await client.query(`select city from users where email = '${email}' and pasword = '${password}';`);
  console.log(response.rows);
  if (response.rows.length == 0) {
    return res.status(401).send("Incorrect email and password");
  }

  //Query for user and send city code if found or error if not
  return res.send({ "data": response.rows[0].city });


});
app.get('/disasters', async (req, res) => {
  const page = Number.parseInt(req.query.page as string);
  const city = Number.parseInt(req.query.city as string);
  console.log("page " + page);
  console.log("city " + city);
  const response = await client.query(`select * from disasters where city = '${city}';`);
  console.log(response.rows);
  return res.send(response.rows);
});
app.get('/downed-services', async (req, res) => {
  const page = Number.parseInt(req.query.page as string);
  let diasterIds = req.query.disasterIds as any;
  console.log(diasterIds.length);
  if(diasterIds.length==1){
    diasterIds=[...diasterIds];
  }
  console.log("page " + page);
  console.log("diasterIds " + diasterIds);
  const response = await client.query(`SELECT * FROM downed_services LEFT JOIN services on downed_services.service = services.id WHERE downed_services.disasterID IN (${diasterIds.join(',')})  `);
  res.send(response.rows);

});




export const server = http.createServer(app);
client.connect().then((_) => console.log("Connected to db")).catch(console.log);
server.listen(port, () => {
  return console.log(`Expresss is listening at http://localhost:${port}`);
});
