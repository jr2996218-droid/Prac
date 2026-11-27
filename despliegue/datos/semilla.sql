CREATE TABLE categorias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE reclamos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  categoria_id INT NOT NULL,
  estado ENUM('abierto', 'en_proceso', 'cerrado') NOT NULL DEFAULT 'abierto',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

INSERT INTO categorias (nombre) VALUES
  ('alumbrado'),
  ('aseo'),
  ('vialidad');

INSERT INTO reclamos (titulo, categoria_id, estado) VALUES
  ('Luminaria apagada en pasaje 3', 1, 'abierto'),
  ('Basura acumulada en la plaza', 2, 'en_proceso'),
  ('Bache en avenida principal', 3, 'cerrado'),
  ('Poste sin luz frente al colegio', 1, 'en_proceso'),
  ('Contenedor dañado', 2, 'abierto');
