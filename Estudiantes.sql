CREATE DATABASE universidad;
USE universidad;
CREATE TABLE Estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    correo VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15)
);

CREATE TABLE Cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    id_profesor INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (id_profesor) REFERENCES Profesores(id_profesor) ON DELETE SET NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Profesores (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Estudiantes_Cursos (
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_estudiante, id_curso),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante) ON DELETE CASCADE,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso) ON DELETE CASCADE
);

SHOW TABLES;

INSERT INTO Estudiantes (nombre, apellido, correo, telefono, fecha_nacimiento) 
VALUES 
('Juan', 'Pérez', 'juan.perez@universidad.com', '1234567890', '2000-05-10'),
('Ana', 'Gómez', 'ana.gomez@universidad.com', '0987654321', '1999-07-15'),
('Pedro', 'López', 'pedro.lopez@universidad.com', '1122334455', '2001-03-20'),
('María', 'Torres', 'maria.torres@universidad.com', '5566778899', '2000-11-11'),
('Luis', 'Martínez', 'luis.martinez@universidad.com', '9988776655', '1998-09-05');

Select * from Estudiantes;

INSERT INTO Profesores (nombre, apellido, email, telefono, especialidad)
VALUES 
('Carlos', 'Martínez', 'carlos.martinez@universidad.com', '1122334455', 'Matemáticas'),
('Laura', 'Sánchez', 'laura.sanchez@universidad.com', '2233445566', 'Física'),
('Fernando', 'Ramírez', 'fernando.ramirez@universidad.com', '3344556677', 'Química'),
('Elena', 'González', 'elena.gonzalez@universidad.com', '4455667788', 'Programación'),
('Roberto', 'Díaz', 'roberto.diaz@universidad.com', '5566778899', 'Historia');

INSERT INTO Cursos (nombre, descripcion, id_profesor, fecha_inicio, fecha_fin)
VALUES 
('Cálculo I', 'Introducción al cálculo diferencial e integral.', 1, '2024-02-01', '2024-06-30'),
('Física General', 'Estudio de los principios básicos de la física.', 2, '2024-02-01', '2024-06-30'),
('Química Orgánica', 'Estudio de compuestos orgánicos y sus reacciones.', 3, '2024-03-01', '2024-07-01'),
('Programación en Python', 'Introducción a la programación utilizando Python.', 4, '2024-04-01', '2024-08-01'),
('Historia Universal', 'Estudio de los principales eventos históricos globales.', 5, '2024-02-15', '2024-06-15');

INSERT INTO Estudiantes_Cursos (id_estudiante, id_curso)
VALUES
(1, 1),  -- Juan Pérez inscrito en Cálculo I
(1, 2),  -- Juan Pérez inscrito en Física General
(2, 1),  -- Ana Gómez inscrita en Cálculo I
(2, 4),  -- Ana Gómez inscrita en Programación en Python
(3, 2),  -- Pedro López inscrito en Física General
(3, 3),  -- Pedro López inscrito en Química Orgánica
(4, 4),  -- María Torres inscrita en Programación en Python
(4, 5),  -- María Torres inscrita en Historia Universal
(5, 3);  -- Luis Martínez inscrito en Química Orgánica

select * from Estudiantes_Cursos;