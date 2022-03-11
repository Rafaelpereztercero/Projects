DROP DATABASE IF EXISTS `clinica`;
CREATE DATABASE IF NOT EXISTS `clinica` ;
USE `clinica`;

DROP TABLE IF EXISTS `medicos`;
CREATE TABLE IF NOT EXISTS `medicos` (
  `Codigo_Medico` varchar(5) NOT NULL,
  `Nombre_Medico` varchar(15) NOT NULL,
  `Apellidos_Medico` varchar(30) NOT NULL,
  `Especialidad` varchar(30) NOT NULL,
  PRIMARY KEY (`Codigo_Medico`)
) ;

INSERT IGNORE INTO `medicos` (`Codigo_Medico`, `Nombre_Medico`, `Apellidos_Medico`, `Especialidad`) VALUES
	('AJH', 'Antonio', 'Jimenez Hernandez', 'Pediatria'),
	('CEM', 'Carmen', 'Esteban Muñoz', 'Psiquiatria'),
	('CSM', 'Carlos', 'Sanchez Martinez', 'General'),
	('ESMH', 'Eva', 'San Martin Hernandez', 'Pediatria'),
	('FHL', 'Fernanda', 'Herandez Lopez', 'Radiologia'),
	('FVP', 'Federico', 'Vidal Planella', 'Analisis'),
	('JMN', 'Juana', 'Moreno Navarro', 'Intensivos'),
	('OPA', 'Olga', 'Pons Alvarez', 'Intensivos'),
	('PAP', 'Pedro', 'Armengol Prats', 'Cirugia'),
	('SGM', 'Sebastian', 'Gutierrez Mellado', 'Oftalmologia'),
	('SVT', 'Santiago', 'Vazquez Torres', 'Ginecologia');

DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE IF NOT EXISTS `pacientes` (
  `Codigo_Paciente` int(11) NOT NULL,
  `Nombre_Paciente` varchar(15) NOT NULL,
  `Apellidos_Paciente` varchar(30) NOT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Poblacion` varchar(15) DEFAULT NULL,
  `Codigo_Postal` int(5) DEFAULT NULL,
  `Telefono_Paciente` varchar(10) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  PRIMARY KEY (`Codigo_Paciente`)
) ;

INSERT IGNORE INTO `pacientes` (`Codigo_Paciente`, `Nombre_Paciente`, `Apellidos_Paciente`, `Direccion`, `Poblacion`, `Codigo_Postal`, `Telefono_Paciente`, `Fecha_Nacimiento`) VALUES
	(100, 'José', 'Romerales Pinto', 'Azorin, 34', 'Móstoles', 28935, '912563256', '1975-03-21'),
	(102, 'Santiago', 'Gonález Sancho', 'Coslada, 12', 'Madrid', 28024, '914562587', '1947-10-30'),
	(103, 'Carmen', 'Rodriguez Santacana', 'Javier Poncela, 3', 'Getafe', 28902, '915478555', '1987-11-06'),
	(110, 'Alberto', 'Puig Monza', 'División Azul, 56', 'Getafe', 28902, '9145899666', '1936-07-18'),
	(120, 'Sergio', 'Perez Sanabria', 'Pizarro, 45', 'Alcorcón', 28223, '915584471', '1950-04-12'),
	(130, 'Jaime', 'Flors López', 'Alcatraz, 56', 'Madrid', 28001, '914526654', '1932-01-23'),
	(131, 'Enrique', 'Morales Miguel', 'Madrid, 45', 'Madrid', 28028, '914552203', '1990-08-12'),
	(140, 'Ana', 'Torrente Hermosilla', 'Barcelona, 35', 'Alcorcón', 28223, '914785236', '1958-03-25'),
	(142, 'Olga', 'Prats Hernandez', 'Versalles, \r\n2', 'Móstoles', 28935, '917458963', '1958-03-25'),
	(200, 'Carlos', 'Jimenez Blanco', 'Gran Via, 124', 'Madrid', 28003, '914589632', '1973-01-12'),
	(201, 'Maria', 'Tomas Caballo', 'Enrique Velasco, 3', 'Madrid', 28028, '914578559', '1955-05-05'),
	(207, 'Rogelia', 'Guerra Santa', 'Castellana, 12', 'Madrid', 28025, '914562258', '1990-07-12'),
	(220, 'Iván', 'Granadino Callejas', 'Doctor Más, 46\r\n', 'Madrid', 28015, '914522369', '1975-07-19'),
	(231, 'Luis', 'Navarrete Prats', 'Trujillo, 33', 'Alcorcón', 28223, '914512589', '1940-06-13'),
	(240, 'Monica', 'Armengol Prats', 'Doce de octubre, 1', 'Madrid', 28028, '914588963', '1985-07-02'),
	(300, 'Joaquin', 'Rodriguez Monzon', 'Barcelona, 111', 'Alcorcón', 28223, '91458521', '1977-05-05'),
	(302, 'Loreto', 'Martinez Lozano', 'Cipreses, 56', 'Alcorcón', 28223, '914589632', '1951-01-24'),
	(400, 'Luis', 'Martinez Garcia', 'Olmos, 54', 'Mostoles', 28935, '911235641', '1980-01-24'),
	(401, 'Luisa', 'Garcia Montoro', 'Olmos, 24', 'Mostoles', 28935, '911235652', '1975-01-10');

DROP TABLE IF EXISTS `ingresos`;
CREATE TABLE IF NOT EXISTS `ingresos` (
  `Numero_Ingreso` int(11) NOT NULL,
  `Habitacion` int(11) NOT NULL,
  `Cama` varchar(1) DEFAULT NULL,
  `Fecha_ingreso` date NOT NULL,
  `Codigo_paciente` int(11) NOT NULL,
  `Codigo_Medico` varchar(5) NOT NULL,
  PRIMARY KEY (`Numero_Ingreso`),
  KEY `capaciente` (`Codigo_paciente`),
  KEY `camedico` (`Codigo_Medico`),
  CONSTRAINT `camedico` FOREIGN KEY (`Codigo_Medico`) REFERENCES `medicos` (`Codigo_Medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `capaciente` FOREIGN KEY (`Codigo_paciente`) REFERENCES `pacientes` (`Codigo_Paciente`) ON DELETE CASCADE ON UPDATE CASCADE
) ;

INSERT IGNORE INTO `ingresos` (`Numero_Ingreso`, `Habitacion`, `Cama`, `Fecha_ingreso`, `Codigo_paciente`, `Codigo_Medico`) VALUES
	(1, 101, 'A', '2013-04-23', 302, 'SVT'),
	(2, 105, 'A', '2013-05-24', 103, 'CSM'),
	(3, 125, 'B', '2013-06-15', 300, 'PAP'),
	(4, 204, 'B', '2013-09-12', 120, 'SGM'),
	(5, 205, 'B', '2013-10-12', 100, 'JMN'),
	(6, 204, 'A', '2014-01-04', 200, 'CEM'),
	(7, 201, 'A', '2014-02-01', 240, 'FHL'),
	(8, 201, 'A', '2015-04-02', 110, 'OPA'),
	(9, 305, 'A', '2015-05-03', 220, 'FVP'),
	(10, 304, 'B', '2015-05-10', 201, 'ESMH'),
	(11, 306, 'A', '2015-05-13', 207, 'OPA'),
	(12, 303, 'B', '2015-06-15', 220, 'CSM'),
	(13, 302, 'A', '2015-06-16', 131, 'AJH'),
	(14, 504, 'B', '2015-06-30', 131, 'SGM'),
	(15, 504, 'B', '2015-07-02', 231, 'ESMH'),
	(16, 405, 'B', '2015-07-05', 200, 'FVP'),
	(17, 401, 'A', '2015-08-08', 140, 'PAP'),
	(18, 408, 'B', '2015-08-10', 142, 'SGM'),
	(19, 504, 'A', '2015-08-12', 120, 'SGM'),
	(20, 509, 'B', '2015-08-20', 240, 'FHL');

-- CONSULTAS BASE DE DATOS MEDICOS
-- 26 Ver apellidos telefono fecha nacimiento, pacientes nacidos antes de 1960 y cp 28028
select Apellidos_Paciente,Telefono_Paciente,Fecha_Nacimiento
    from pacientes
        where Fecha_Nacimiento < '1960-01-01' and Codigo_Postal like 28028;

-- 27 Crear una consulta para ver las distintas especialidades de los médicos
select distinct Especialidad, count(Nombre_Medico)
    from medicos
        group by Especialidad;

-- 28 Muestra los datos de los pacientes ordenados por población y dentro de cada
-- población por apellidos y luego por nombre
select *
    from pacientes
        order by Poblacion asc, Apellidos_Paciente asc, Nombre_Paciente asc;

-- 29 Obtener toda la información de los ingresos se han realizado entre el 1 de junio
-- y el 31 de diciembre de 2015
select *
    from ingresos
        where Fecha_ingreso between '2015-06-01' and '2015-12-31';

-- 30 Crea una consulta para saber el nombre y apellidos de los pacientes que han
-- sido atendidos por algún pediatra, ordenados por apellidos en orden descendente
select Nombre_Paciente, Apellidos_Paciente
    from pacientes
        where Codigo_Paciente in (select Codigo_paciente
                                    from ingresos
                                        where Codigo_Medico = any (select Codigo_Medico
                                                                    from medicos
                                                                        where Especialidad = 'Pediatria'))
    order by Apellidos_Paciente desc;

-- Crea una consulta para saber cuál es la fecha más antigua de la tabla ingresos.
select min(Fecha_ingreso)
    from ingresos;

-- Obtener todos los pacientes que viven en el código postal de 28... (Madrid)
select *
    from pacientes
        where Codigo_Postal like '28%%%' and Poblacion = 'Madrid';

-- Obtener el código de los pacientes que han sido ingresados 2 o más veces
select Codigo_Paciente
    from ingresos
        group by Codigo_Paciente
            having count(*) >=2;

-- Obtener el número de pacientes que viven en Mostoles
select count(Poblacion)
    from pacientes
        where Poblacion = 'Mostoles';

-- Obtener el nombre y los apellidos del paciente más joven de cada población.
select max(Fecha_Nacimiento) Nombre_Paciente,Apellidos_Paciente,Poblacion
    from pacientes
        group by Poblacion;

-- Obtener el número de médicos que tenemos en cada especialidad
SELECT DISTINCT COUNT(Nombre_Medico),Especialidad
    FROM medicos
        GROUP BY Especialidad;

-- Obtener toda la información de los pacientes que no están ingresados
SELECT *
    FROM pacientes
        WHERE Codigo_Paciente NOT IN (SELECT Codigo_Paciente
                                         FROM INGRESOS);

-- Numero de Ingresos por habitación y Cama
select  distinct Codigo_paciente,Habitacion,Cama
    from ingresos;

-- Crea una consulta para saber el nombre y apellidos de los pacientes que han
-- sido atendidos para algún pediatra, ordenados por apellidos en orden descendente:
select Nombre_Paciente, Apellidos_Paciente
    from ingresos, medicos, pacientes
        where Especialidad = 'Pediatria'
            order by Apellidos_Paciente;

SELECT pacientes.Nombre_Paciente,pacientes.Apellidos_Paciente
    from ingresos,medicos,pacientes
        where medicos.Codigo_Medico = ingresos.Codigo_Medico
            and medicos.especialidad = 'Pediatria'
            and ingresos.Codigo_Paciente = pacientes.Codigo_Paciente
order by pacientes.Apellidos_Paciente DESC;

select *
    from pacientes
        where Codigo_Paciente not in (select Codigo_Paciente
                                        from ingresos);

-- paciente que tenga fecha de ingreso mas alta
select Fecha_ingreso, Nombre_Paciente, Apellidos_Paciente
    from ingresos,pacientes
        where pacientes.Codigo_paciente = ingresos.Codigo_paciente
            order by Fecha_ingreso desc;

-- busquemos los pacientes que sean atendidos por un medico intensivo
SELECT  Nombre_Paciente
    FROM ingresos,pacientes,medicos
        where pacientes.Codigo_paciente = ingresos.Codigo_paciente
                and medicos.Especialidad = 'Intensivos'
                and medicos.Codigo_Medico  = ingresos.Codigo_Medico;

-- numero de identificacion de ingreso de todos los pacientes de Mostoles atendidos por un medico de Cirugia
select distinct pacientes.Codigo_paciente, Nombre_Paciente
    from pacientes,ingresos,medicos
        where Poblacion = 'Madrid' and
              ingresos.Codigo_paciente = pacientes.Codigo_paciente
                and medicos.Codigo_Medico = ingresos.Codigo_Medico
                    and medicos.especialidad = 'Radiologia';

-- todos los pacientes de madrid que hayan sido atendidos por oftalmologia donde su año de nacimiento sea antes de 1970 y su codigo postal termine en 28
select *
    from ingresos,pacientes,medicos
        where ingresos.Codigo_paciente = pacientes.Codigo_paciente
          and ingresos.Codigo_Medico = medicos.Codigo_Medico and pacientes.Poblacion = 'Madrid'
          and medicos.Especialidad = 'Oftalmologia' and pacientes.Codigo_Postal like '%28';