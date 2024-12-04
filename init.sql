CREATE DATABASE p4q;

-- Create Estado (State) table
CREATE TABLE Estado (
    id_estado SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Create Evento (Event) table
CREATE TABLE Evento (
    id_evento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Create Rol (Role) table
CREATE TABLE Rol (
    id_rol SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Create Departamento (Department) table
CREATE TABLE Departamento (
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Create Usuario (User) table with foreign key to Rol
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    id_rol INTEGER NOT NULL,
    FOREIGN KEY (id_rol) REFERENCES Rol(id_rol)
);

-- Create Ticket table with foreign key to Estado
CREATE TABLE Ticket (
    id_ticket SERIAL PRIMARY KEY,
    descripcion TEXT,
    prioridad VARCHAR(50) NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    id_estado INTEGER NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES Estado(id_estado)
);

-- Create Registro (Record) table with multiple foreign keys
CREATE TABLE Registro (
    id_registro SERIAL PRIMARY KEY,
    id_ticket INTEGER NOT NULL,
    id_evento INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL,
    id_departamento INTEGER NOT NULL,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    comentario TEXT,
    FOREIGN KEY (id_ticket) REFERENCES Ticket(id_ticket),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

-- Insert data into Estado
INSERT INTO Estado (nombre) VALUES 
('Pendiente'),
('Asignado'), 
('Resuelto'), 
('Cerrado');

-- Insert data into Evento
INSERT INTO Evento (nombre) VALUES 
('Creación'), 
('Asignación'), 
('Actualización'), 
('Cierre'),
('Confirmación');

-- Insert data into Rol
INSERT INTO Rol (nombre) VALUES 
('Administrador'), 
('Técnico'), 
('Usuario');

-- Insert data into Departamento
INSERT INTO Departamento (nombre) VALUES 
('TI'), 
('Recursos Humanos'), 
('Finanzas'), 
('Ventas');

-- Insert data into Usuario
INSERT INTO Usuario (nombre, email, id_rol) VALUES 
('Juan Pérez', 'juan.perez@empresa.com', 1),
('María García', 'maria.garcia@empresa.com', 2),
('Carlos Rodríguez', 'carlos.rodriguez@empresa.com', 3);

-- Insert data into Ticket
INSERT INTO Ticket (descripcion, prioridad, titulo, id_estado) VALUES 
('Problema con acceso al sistema', 'Urgente', 'Error de Inicio de Sesión', 1),
('Solicitud de nuevo equipo', 'Normal', 'Reemplazo de Computadora', 2),
('Configuración de correo electrónico', 'Urgente', 'Setup de Email Corporativo', 3);

-- Insert data into Registro
INSERT INTO Registro (id_ticket, id_evento, id_usuario, id_departamento, comentario) VALUES 
(1, 1, 1, 1, 'Ticket inicial creado'),
(1, 2, 2, 1, 'Ticket asignado al soporte técnico'),
(2, 1, 3, 2, 'Solicitud de nuevo equipo enviada'),
(3, 1, 2, 3, 'Configuración de correo iniciada');
