const { Pool } = require('pg');
const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD, // NUNCA poner la clave en texto plano como '1234'
  port: process.env.DB_PORT,
});