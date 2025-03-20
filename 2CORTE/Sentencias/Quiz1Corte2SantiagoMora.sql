create database TechCorp;
use TechCorp;

CREATE TABLE empleados (
    idEmpleado INT PRIMARY KEY AUTO_INCREMENT not null,
    nombreEmpleado VARCHAR(100) not null,
    edadEmpleado INT not null,
    ingresosEmpleado DECIMAL(10,2)not null,
    fContratacion DATE not null,
    departamento varchar(20) not null
);
CREATE TABLE departamento (
    idDepartamento INT PRIMARY KEY AUTO_INCREMENT not null,
    nombreDepartamento VARCHAR(100) not null
);

insert into empleados values (' ','Santiago Mora', 20, 3500.50, '2024-03-17', 'Analítica'),
(' ', 'Gabriel Álvarez', 35, 4200.00, '2018-03-22', 'Programación'),
(' ', 'Paola Rodríguez', 24, 5000.75, '2024-11-10', 'Ventas'),
(' ','Linaza Peña', 23, 3800.00, '2022-09-05', 'RRHH'),
(' ','Tata Carvajal', 33, 3100.25, '2020-01-20', 'Finanzas'),
(' ','David Moreno', 45, 6000.00, '2010-07-01', 'Marketing'),
(' ','Paula Garzón', 26, 2700.00, '2023-02-12', 'Analítica'),
(' ','Beatriz Pinzón', 40, 4800.50, '2023-05-30', 'Finanzas'),
(' ','Patricia Fernández', 33, 4100.00, '2017-08-25', 'Ventas'),
(' ','Hugo Lombardi', 42, 5500.00, '2014-04-18', 'Ventas');
select * from empleados;

insert into departamento values (' ', 'Programación'),(' ', 'Ventas'),(' ','RRHH'),(' ', 'Finanzas'),(' ','Marketing'),
(' ', 'Analítica');
select * from departamento;

/*RETO 1: Lista de empleados: Obtén los nombres, edades y salarios de todos los empleados de TechCorp.*/
select nombreEmpleado as 'nombres', edadEmpleado as 'edades', ingresosEmpleado as 'salarios' from empleados;

/*RETO 2: Altos ingresos: ¿Quiénes son los empleados que ganan más de $4,000?*/
select idEmpleado, nombreEmpleado as 'nombres', ingresosEmpleado as 'salarios' from empleados where ingresosEmpleado >4000.00;

/*RETO 3: Fuerza de ventas: Extrae la lista de empleados que trabajan en el departamento de Ventas.*/
select*from empleados where departamento='Ventas';

/*RETO 4: Rango de edad: Encuentra a los empleados que tienen entre 30 y 40 años.*/
select*from empleados where edadEmpleado>=30 and edadEmpleado<=40;

/*RETO 5: Nuevas contrataciones: ¿Quiénes han sido contratados después del año 2020?*/
select * from empleados where year(fContratacion) > 2020;

/*RETO 6: Distribución de empleados: ¿Cuántos empleados hay en cada departamento?*/
/* Para unsar Count: Agrupa los datos por la columna especificada y cuenta los elementos en cada grupo.*/
select departamento, COUNT(*) as tOTAL from empleados group by departamento;

/*RETO 7: Análisis salarial: ¿Cuál es el salario promedio en la empresa?
Devuelve la media (promedio) de todos los registros según el campo indicado.*/
select Avg(ingresosEmpleado) AS promedioSalario  FROM empleados;

/*RETO 8: Nombres selectivos: Muestra los empleados cuyos nombres comienzan con "A" o "C".*/
/*Insertaré otros dos clientes porque antes no tenía nombres que tuvieran esas condiciones*/
insert into empleados values (' ','Camila Hernández', 20, 3500.50, '2024-03-17', 'Analítica'),
(' ','Ana Gómez', 20, 3500.50, '2024-03-17', 'Programación');
select*from empleados where nombreEmpleado like 'A%' or nombreEmpleado like 'C%' ; 

/*RETO 9: Departamentos específicos: Encuentra a los empleados que no pertenecen al departamento de IT.
Asumiré IT como Programación:*/
select * from empleados where departamento<>'Programación';

-- RETO 10: El mejor pagado: ¿Quién es el empleado con el salario más alto?
select nombreEmpleado as 'El Más pagado', ingresosEmpleado as 'salario' from empleados where ingresosEmpleado = (select MAX(ingresosEmpleado) from empleados);

-- Funciones agregadas: Permiten hacer procesos sin tener que modificiarlos
 -- consultar rangos between
 select*from empleados where idEmpleado  between 1 and 4;
 
-- Consultar un valor que esté dentro de una lista de valores: in*/
 select*from empleados where idEmpleado in (1,6);
 
 -- Si un campo es nulo is null
 select*from empleados where nombreEmpleado is null;


select*from empleados where departamento is null;
select*from empleados order by ingresosEmpleado desc;
select*, (2025-year(fContratacion)) as 'Años trabajados' from empleados;
select*from empleados order by ingresosEmpleado desc limit 3;


update empleados set nombreEmpleado = 'Gabriel' where idEmpleado=1;

-- QUIZ1 SEGUNDO CORTE -------------------------------------------------------------------------------------------------------------------------------

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
