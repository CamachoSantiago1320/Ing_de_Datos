create database techcorp;

use techcorp;

create table empleado (
    id int auto_increment primary key,
    nombre varchar(50) not null,
    edad int not null,
    salario int not null,
    departamento varchar(50) not null,
    fecha_contratacion date not null    
);

insert into empleado (id, nombre, edad, salario, departamento, fecha_contratacion) values
('', 'maría pérez', 40, 4800, 'finanzas', '2018-02-10'),
('', 'juan martínez', 27, 3900, 'ventas', '2020-07-01'),
('', 'sofia ruiz', 35, 5100, 'rrhh', '2016-04-20'),
('', 'luis gonzález', 29, 4300, 'marketing', '2022-05-18'),
('', 'marta lópez', 38, 5500, 'finanzas', '2019-11-12'),
('', 'josephina cabrera', 31, 4100, 'ventas', '2021-09-06'),
('', 'roberto garcía', 33, 4700, 'it', '2020-08-17'),
('', 'patricia díaz', 41, 5000, 'marketing', '2017-03-23'),
('', 'daniel ramírez', 36, 4600, 'it', '2015-10-30'),
('', 'martín álvarez', 28, 3800, 'ventas', '2023-01-04');

/* Obtener los nombres, edades y salarios dde todos los empleados de TechCorp----------------------------------------------------------------------- */
select * from empleado;
select nombre from empleado;
select edad from empleado;
select salario from empleado;

/* Quienes son los  empleados que ganan más de $4000 -----------------------------------------------------------------------------------------------*/
select nombre, salario from empleado where salario > 4000;

/* Extrae la lista de empleados que trabajan en el departamento de ventas --------------------------------------------------------------------------*/
select * from empleado where departamento = 'ventas';

/* Encuentra a los empleados que tienen entre 30 y 40 años----------------------------------------------------------------------------------------- */
select * from empleado where edad >= 30 and edad <= 40;

/* Listar los empleados que fueron contratados después de 2020-------------------------------------------------------------------------------------- */
select * from empleado where year(fecha_contratacion) > 2020;

/* Contar cuántos empleados hay por departamento ----------------------------------------------------------------------------------------------------*/
select departamento, count(*) as cantidad_empleados from empleado group by departamento;

/* Calcular el salario promedio de los empleados ----------------------------------------------------------------------------------------------------*/
select avg(salario) as salario_promedio from empleado;

/* Filtrar empleados cuyo nombre comienza con la letra 'A' o 'C' ------------------------------------------------------------------------------------*/
select * from empleado where nombre like 'A%' or nombre like 'C%';

/* Listar empleados que no pertenecen al departamento de IT----------------------------------------------------------------------------------------- */
select * from empleado where departamento != 'it';

/* Mostrar el empleado con el salario más alto ------------------------------------------------------------------------------------------------------*/
select nombre, salario from empleados where salario =max(salario);
