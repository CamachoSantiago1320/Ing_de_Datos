create database techcorp;
use techcorp;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------

drop database techcorp;
-- Tabla departamento
create table departamento (
    id_departamento varchar(30) primary key not null,
    nombre_departamento varchar(50) not null,
    ubicacion varchar(100)
);

-- Tabla empleado
create table empleado (
    id int auto_increment primary key,
    nombre varchar(50) not null,
    edad int not null,
    salario int not null,
    id_departamento varchar(30),
    id_cargo varchar(30),
    fecha_contratacion date not null,
    foreign key (id_departamento) references departamento(id_departamento),
    foreign key (id_cargo) references cargo(id_cargo)
);


-- Tabla cargo
create table cargo (
    id_cargo varchar(30) primary key not null,
    nombre_cargo varchar(30),
    rango_cargo varchar(30),
    descripcion_cargo varchar(50)
);



-- Insertar datos en la tabla departamento
insert into departamento (id_departamento, nombre_departamento, ubicacion) values
('dp001', 'Recursos Humanos', 'Piso 3, sedeA'),
('dp002', 'Marketing', 'Piso 2, sedeB'),
('dp003', 'Tecnología', 'Piso 1, sedeC'),
('dp004', 'Finanzas', 'Piso 4, sedeA'),
('dp005', 'Tintos', 'Piso 8, sedeZ'), 
('dp006', 'Ventas', 'Piso 2, sedeA');

-- Insertar datos en la tabla cargo
insert into cargo (id_cargo, nombre_cargo, rango_cargo, descripcion_cargo) values
('cg001', 'gerenteGeneral', 'nivel4', 'Toma de decisiones estratégicas y supervisión de la empresa.'),
('cg002', 'directorMarketing', 'nivel3', 'Encargado de las estrategias de marketing de la empresa.'),
('cg003', 'jefeRecursosHumanos', 'nivel2', 'Coordina procesos de selección y empleados.'),
('cg004', 'analistaFinanciero', 'nivel1', 'Encargado de analizar los estados financieros y reportes.'),
('cg005', 'elTintero', 'nivel1', 'Encargado de mantener al equipo activo mediante la hidratación.'),
('cg006', 'asistenteAdministrativo', 'nivel1', 'Apoya en tareas administrativas.');

drop table cargo;
drop table empleado;
select * from cargo;
-- Insertar datos en la tabla empleado
insert into empleado (nombre, edad, salario, id_departamento, id_cargo, fecha_contratacion) values
('Juan Pérez', 35, 55000, 'dp001', 'cg001', '2022-03-15'),
('Ana Gómez', 28, 45000, 'dp002', 'cg002', '2021-07-22'),
('Carlos Fernández', 42, 60000, 'dp003', 'cg003','2020-10-10'),
('Marta Sánchez', 30, 48000,'dp004', 'cg004','2023-01-05'),
('Luis Rodríguez', 38, 50000, 'dp006', 'cg006','2019-11-11');



-- 1) Mostrar los cargos que tengan un rango específico 

select cargo.nombre_cargo, cargo.rango_cargo
from cargo 
inner join empleado on cargo.id_cargo = empleado.id_cargo
where cargo.rango_cargo = 'nivel1';

-- 2) Mostrar en pantalla los empleados que tengan un cargo específico

select empleado.nombre, empleado.edad, empleado.salario, cargo.nombre_cargo
from empleado
inner join cargo on empleado.id_cargo = cargo.id_cargo
where cargo.nombre_cargo = 'jefeRecursosHumanos';

-- 3) Mostrar los empleados que tengan antigüedad de más de 3 años, qué departamento pertenecen, qué salario tienen y qué rango tienen en su cargo

select empleado.nombre, empleado.salario, empleado.id_departamento, departamento.nombre_departamento, cargo.nombre_cargo, cargo.rango_cargo, 
       datediff(current_date, empleado.fecha_contratacion) / 365 as antiguedad_anios
from empleado 
inner join departamento  on empleado.id_departamento = departamento.id_departamento
inner join cargo on empleado.id_cargo = cargo.id_cargo
where datediff(current_date, empleado.fecha_contratacion) / 365 > 3;

-- 4) Mostrar toda la información de un empleado (nombre, fecha de contratación, departamento, años de antigüedad en la empresa, cargo y rango del cargo)

select empleado.nombre, empleado.fecha_contratacion, departamento.nombre_departamento, 
       datediff(current_date, empleado.fecha_contratacion) / 365 as antiguedad_anios
from empleado
inner join departamento on empleado.id_departamento = departamento.id_departamento
inner join cargo on empleado.id_cargo = cargo.id_cargo;

-- 5) Mostrar todos los departamentos que no tengan empleados asignados

select departamento.nombre_departamento
from departamento
left join empleado on departamento.id_departamento = empleado.id_departamento
where empleado.id_departamento is null;

-- 6) Mostrar todos los cargos que no tengan empleados asignados

select cargo.nombre_cargo
from cargo
left join empleado on cargo.id_cargo = empleado.id_cargo
where empleado.id_cargo is null;

describe empleado;
select * from empleado;