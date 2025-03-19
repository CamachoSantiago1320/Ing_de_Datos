
Create database seguros;

/*HABILITAR BASE DE DATOS | USE nombreBD */
use seguros;

create table compañia (
idCompañiaPK INT PRIMARY KEY,
nit INT NOT NULL,
nombre VARCHAR(20),
fechaFundacion DATE,
representanteLegal VARCHAR(20)
);

create table asegura (
fechaInicio DATE NOT NULL,
fechaExpiracion DATE NOT NULL,
estado VARCHAR(20),
valorAsegurado INT,
costo INT
);


create table automovil (
idAutomovilPK INT NOT NULL PRIMARY KEY,
marca VARCHAR(20),
modelo VARCHAR(20),
placa VARCHAR(20),
tipos VARCHAR(20),
añoFabricacion int,
serialChasis INT NOT NULL,
pasajeros INT,
cilindraje VARCHAR(20)
);


create table involucracion (
codigoPK INT NOT NULL PRIMARY KEY,
serialChasis INT NOT NULL,
idAutomovilFK INT KEY,
idAccidenteFK INT NOT NULL KEY
);

create table accidente (
idAccidente INT NOT NULL PRIMARY KEY,
automotores VARCHAR(20),
fatalidades VARCHAR(20),
heridos int,
lugar VARCHAR(20),
fechaAccidente DATE
);