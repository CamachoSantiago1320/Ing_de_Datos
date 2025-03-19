CREATE DATABASE TiendaMascota;
USE TiendaMascota;

/*TABLAS -------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE mascota(
idMc INT PRIMARY KEY NOT NULL,
nombreMc VARCHAR(15),
generoMc VARCHAR(15),
razaMc VARCHAR(15),
cantidad INT(10)
);

CREATE TABLE cliente(
cedulaCliente INT PRIMARY KEY NOT NULL,
nombreCliente VARCHAR(15),
apellidoCliente VARCHAR(15),
direccionCliente VARCHAR(10),
telefono INT(10),
idMascotaFK INT
);
CREATE TABLE producto(
codigoProducto INT PRIMARY KEY NOT NULL,
nombreProducto VARCHAR(15),
marca VARCHAR(15),
precio FLOAT,
cedulaClienteFK INT
);
CREATE TABLE vacuna(
codigoVacuna INT PRIMARY KEY NOT NULL,
nombreVacuna VARCHAR(15),
dosisVacuna INT(10),
enfermedad VARCHAR(15)
);
CREATE TABLE mascotaVacuna(
codigoVacunaFK INT,
idMcFK INT,
enfermedad VARCHAR(15)
);

/*RELACIONES----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
ALTER TABLE cliente
ADD CONSTRAINT FKclienteMascota
FOREIGN KEY (idMcFK)
REFERENCES mascota(idMc);

ALTER  TABLE producto
ADD CONSTRAINT FKproductoCliente
FOREIGN KEY (cedulaClienteFK)
REFERENCES cliente(cedulaCliente);

ALTER TABLE mascotaVacuna
ADD CONSTRAINT FKMSVC
FOREIGN KEY (idMcFK)
REFERENCES mascota(idMc );

ALTER TABLE mascotaVacuna
ADD CONSTRAINT FKVCMS
FOREIGN KEY (codigoVacunaFK)
REFERENCES vacuna(codigoVacuna);

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO mascota
VALUES(1,'Tuga','F','Criollo',1),
(2,'Tita','F','Criollo',1), 
(3,'Tota','M','Criollo',1), 
(4,'Tata','M','Criollo',2),
(5,'Tuta','F','Criollo',1);


INSERT INTO vacuna
VALUES (8,'Ronronea','3','moquillo'),
(7,'Todolopuede','1','adenovirus 1'),
(9,'Vive100','3','contra todo'),
(10,'Speedmax','1','papiloma animal'),
(2,'Garro','3',' fiebre');


INSERT INTO cliente 
VALUES (46789,'Enel','Maquiavel','carrera 10',32551118000,1),
(47845,'Sebastian', 'Alvarado','carrera 9',3105151503,2),
(67896,'Camilo','Castillos','calle 8',312315251151594,1),
(74716,'Andrea','Azarado','carrera 7',312552525036,2),
(01234,'Samuel','Restrepo','calle 6',31295884885824,1);


INSERT INTO producto 
VALUES (1,'cuerdita','juguetote',1000,7205),
(2,'bozalote','juguetito',20000,2487),
(3,'Pelotita','juguetote',3500,5075),
(4,'Placota','juguetito',18000,607235),
(5,'Cepillito','juguetote',21000,15018);


/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT * FROM Mascota;
DESCRIBE Mascota;
DESCRIBE Producto;
DESCRIBE Vacuna;
DESCRIBE Cliente;
DESCRIBE Producto;
SELECT * FROM mascota WHERE generoMc = 'F';




