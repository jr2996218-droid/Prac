const express = require('express');
const mysql = require('mysql2/promise');
const app = express();

const PORT = Number(process.env.PORT || 8137);

const dbConfig = {
  host: process.env.DB_HOST || 'boveda',
  port: Number(process.env.DB_PORT || 3306),
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
};

app.get('/', (req, res) => {
  res.json({ servicio: 'nucleo', estado: 'activo' });
});

app.get('/reclamos', async (req, res) => {
  try {
    const conn = await mysql.createConnection(dbConfig);
    const [rows] = await conn.query(
      'SELECT r.id, r.titulo, c.nombre AS categoria, r.estado, r.creado_en FROM reclamos r JOIN categorias c ON r.categoria_id = c.id'
    );
    await conn.end();
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.listen(PORT, () => {
  console.log(`Servicio escuchando en puerto ${PORT}`);
});
