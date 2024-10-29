CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    contrasena_hash VARCHAR(255) NOT NULL,
);

CREATE TABLE Curso (
    id_curso INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
);

CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY,
    id_usuario INT,
    nombre VARCHAR(100) NOT NULL,
    id_curso INT, -- Relación con el curso
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso) ON DELETE SET NULL
);

CREATE TABLE Apoderado (
    id_apoderado INT PRIMARY KEY,
    id_usuario INT,
    nombre VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE
);

CREATE TABLE Alumno (
    id_alumno INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_apoderado INT,
    id_curso INT, -- Relación con el curso
    FOREIGN KEY (id_apoderado) REFERENCES Apoderado(id_apoderado) ON DELETE SET NULL,
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso) ON DELETE SET NULL
);

CREATE TABLE Observaciones (
    id_observacion INT PRIMARY KEY,
    id_alumno INT,
    id_empleado INT, -- Relación con el empleado
    detalle VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES Alumno(id_alumno) ON DELETE CASCADE,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado) ON DELETE SET NULL
);

CREATE TABLE Actividad (
    id_actividad INT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado) ON DELETE SET NULL
);
