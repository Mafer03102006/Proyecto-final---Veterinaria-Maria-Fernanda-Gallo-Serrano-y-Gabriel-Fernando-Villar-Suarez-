-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS veterinaria_uts;
USE veterinaria_uts;

-- 1. Tabla de Roles (Seguridad y permisos)
CREATE TABLE roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(50) NOT NULL -- Ej: 'ROLE_ADMIN', 'ROLE_VET'
);

-- 2. Tabla de Usuarios (Credenciales de acceso)
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL, 
    id_rol INT,
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);

-- 3. Tabla de Dueños (Clientes)
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion VARCHAR(150)
);

-- 4. Tabla de Mascotas
CREATE TABLE mascotas (
    id_mascota INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raza VARCHAR(50),
    edad INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);

-- 5. Tabla de Directorio Médico (Antes Veterinarios)
CREATE TABLE directorio_medico (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    tarjeta_profesional VARCHAR(50), -- Dato extra para realismo
    id_usuario INT, 
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- 6. Tabla de Citas (Conexión con el médico del directorio)
CREATE TABLE citas (
    id_cita INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    motivo VARCHAR(200),
    id_mascota INT,
    id_medico INT, -- Referencia al directorio médico
    FOREIGN KEY (id_mascota) REFERENCES mascotas(id_mascota) ON DELETE CASCADE,
    FOREIGN KEY (id_medico) REFERENCES directorio_medico (id_medico)
);

-- 7. Tabla de Historial Médico
CREATE TABLE historial_medico (
    id_historial INT PRIMARY KEY AUTO_INCREMENT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    diagnostico TEXT NOT NULL,
    tratamiento TEXT,
    id_mascota INT,
    FOREIGN KEY (id_mascota) REFERENCES mascotas(id_mascota) ON DELETE CASCADE
);

-- ==========================================
-- REGISTROS DE PRUEBA (DATA INICIAL)
-- ==========================================

INSERT INTO roles (nombre_rol) VALUES ('ROLE_ADMIN'), ('ROLE_VET');

-- Usuarios iniciales
INSERT INTO usuarios (username, password, id_rol) VALUES 
('admin_uts', '12345', 1),
('pablo_vet', 'pablo2026', 2);

-- Cliente y Mascota
INSERT INTO clientes(nombre, telefono, email, direccion) VALUES
('Carlos Perez', '3001234567', 'carlos@mail.com', 'Calle 10 #20-30');

INSERT INTO mascotas(nombre, especie, raza, edad, id_cliente) VALUES
('Max', 'Perro', 'Labrador', 5, 1);

-- Registro en Directorio Médico vinculado a usuario
INSERT INTO directorio_medico(nombre, especialidad, tarjeta_profesional, id_usuario) VALUES
('Andres Lopez', 'Cirugía', 'TP-98765-VET', 2);

-- Ejemplo de una cita programada
INSERT INTO citas(fecha, hora, motivo, id_mascota, id_medico) VALUES
('2026-05-15', '10:30:00', 'Control post-operatorio', 1, 1);