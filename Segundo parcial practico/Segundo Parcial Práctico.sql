-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Definición de Datos (DML)
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1) SE CREA LA BASE DE DATOS
CREATE DATABASE BDDataVerse;
USE BDDataVerse;
DROP DATABASE BDDataVerse;


-- 2) SE CREAN LAS TABLAS
CREATE TABLE Sensores (
    id_sensor INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255) NOT NULL,
    fecha_instalacion DATE NOT NULL
);

CREATE TABLE Registros_Sensores (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    id_sensor INT,
    valor DECIMAL(10,2) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_sensor) REFERENCES Sensores(id_sensor)
);

CREATE TABLE Transporte (
    id_transporte INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL
);

CREATE TABLE Consumo_Energetico (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    zona VARCHAR(100) NOT NULL,
    consumo_kw DECIMAL(10,2) NOT NULL,
    fecha DATE NOT NULL
);

CREATE TABLE Seguridad (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    tipo_evento VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ubicacion VARCHAR(255) NOT NULL,
    id_sensor INT,
    FOREIGN KEY (id_sensor) REFERENCES Sensores(id_sensor)
);

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    id_transporte INT,
    id_registro INT,
    id_evento INT,
    FOREIGN KEY (id_transporte) REFERENCES Transporte(id_transporte),
    FOREIGN KEY (id_registro) REFERENCES Consumo_Energetico(id_registro),
    FOREIGN KEY (id_evento) REFERENCES Seguridad(id_evento)
);


-- 4)Modifique la tabla Usuario y cree un campo teléfono.
ALTER TABLE Usuarios
ADD COLUMN telefono VARCHAR(15);


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserción Y Manipulación de datos (DML)
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 1)SE REALIZAN LAS INSERCIONES
INSERT INTO Sensores (tipo, ubicacion, fecha_instalacion)
VALUES ('temperatura', 'Zona Soacha', '2025-01-10'),
       ('humedad', 'Zona Sur', '2025-02-15'),
       ('temperatura', 'Zona Patio', '2025-03-20'),
       ('co2', 'Zona Tunal', '2025-04-01'),
       ('humedad', 'Zona Suba', '2025-04-05');
       
       
INSERT INTO Registros_Sensores (id_sensor, valor, timestamp)
VALUES (1, 25, '2025-04-05 10:00:00'),
       (2, 45, '2025-04-05 10:05:00'),
       (3, 22, '2025-04-05 10:10:00'),
       (4, 150, '2025-04-05 10:15:00'),
       (5, 55, '2025-04-05 10:20:00');

INSERT INTO Transporte (tipo, capacidad)
VALUES ('autobús', 40),
       ('metro', 100),
       ('tranvía', 30);

INSERT INTO Usuarios (nombre, email, id_transporte, telefono)
VALUES ('Juan Perez', 'juan@gmail.com', 1, '123456789'),
       ('Ana Garcia', 'ana@gmail.com', 2, '987654321'),
       ('Carlos Lopez', 'carlos@gmail.com', 3, '555666777'),
       ('Laura Dias', 'laura@gmail.com', 1, '222333444'),
       ('Luis Fernandez', 'luis@gmail.com', 2, '666777888');

INSERT INTO Consumo_Energetico (zona, consumo_kw, fecha)
VALUES ('Zona Soacha', 2500, '2025-04-05'),
       ('Zona Sur', 3500, '2025-04-05'),
       ('Zona Patio', 1800, '2025-04-05'),
       ('Zona Tunal', 2100, '2025-04-05'),
       ('Zona Suba', 5000, '2025-04-05');

INSERT INTO Seguridad (tipo_evento, descripcion, fecha_hora, ubicacion)
VALUES ('Robo', 'Robo tiendita', '2025-04-05 12:00:00', 'Zona Soacha'),
       ('Accidente', 'Accidente de trafico', '2025-04-05 2:00:00', 'Zona Sur'),
       ('Fuego', 'Incendio a casa', '2025-04-05  4:00:00', 'Zona Patio'),
       ('Accidente', 'Accidente de tráfico', '2025-04-05 6:00:00', 'Zona Tunal '),
       ('Robo', 'Robo en oficina', '2025-04-05 20:00:00', 'Zona Suba');


-- 2)Actualiza los registros de Consumo_Energetico para incrementar en un 10% el consumo en una zona específica.


UPDATE Consumo_Energetico
SET consumo_kw = consumo_kw * 10 /100
WHERE zona = 'Zona Soacha';


-- 3)Elimina registros de Seguridad que sean más antiguos a un año
DELETE FROM Seguridad
WHERE fecha_hora < NOW() - INTERVAL 1 YEAR;


-- 4)Encuentra todos los registros de sensores donde el valor sea mayor a 50 y el tipo de sensor sea 'temperatura'. Excluye valores NULL en valor.
SELECT * FROM Registros_Sensores
WHERE valor > 50 AND id_sensor IN (SELECT id_sensor FROM Sensores WHERE tipo = 'temperatura') AND valor IS NOT NULL;


-- 5). Muestra el consumo energético diario promedio por zona, redondeado a 2 decimales y con alias Promedio_Consumo
SELECT zona, AVG(consumo_kw), 2 AS Promedio_Consumo
FROM Consumo_Energetico
GROUP BY zona;


-- 6). Muestra el consumo energético diario promedio por zona, redondeado a 2 decimales y con alias Promedio_Consumo
SELECT tipo_evento, COUNT(*) AS cantidad
FROM Seguridad
GROUP BY tipo_evento
HAVING COUNT(*) > 5;
