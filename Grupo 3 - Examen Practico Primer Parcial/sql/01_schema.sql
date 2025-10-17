-- ============================================
-- Modelo y DDL - Esquemas Base
-- ============================================
-- Crear Base de datos (Nodo A)
CREATE DATABASE MiniSistemaClinico;
GO

USE MiniSistemaClinico;
GO

-- Crear esquemas para Quito y Ambato (Nodo A)
CREATE SCHEMA Quito;
GO
CREATE SCHEMA Ambato;
GO

-- Tablas en esquema Quito
CREATE TABLE Quito.CentrosMedicos (
    CentroID INT PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Ciudad NVARCHAR(50) NOT NULL
);

CREATE TABLE Quito.Medicos (
    CedMedicoID NVARCHAR(10) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Especialidad NVARCHAR(50) NOT NULL,
    CentroID INT NOT NULL FOREIGN KEY REFERENCES Quito.CentrosMedicos(CentroID)
);

CREATE TABLE Quito.Pacientes (
    CedPacienteID NVARCHAR(50) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100)
);

CREATE TABLE Quito.Consultas (
    ConsultaID NVARCHAR(50) PRIMARY KEY,
    CedPacienteID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Quito.Pacientes(CedPacienteID),
    Fecha DATE NOT NULL,
    CentroID INT NOT NULL FOREIGN KEY REFERENCES Quito.CentrosMedicos(CentroID),
    CedMedicoID NVARCHAR(10) NOT NULL FOREIGN KEY REFERENCES Quito.Medicos(CedMedicoID)
);

--  Índices Quito
CREATE INDEX idx_Consultas_CentroID_Quito ON Quito.Consultas(CentroID);
CREATE INDEX idx_Consultas_Fecha_Quito ON Quito.Consultas(Fecha);
CREATE INDEX idx_Consultas_PacienteID_Quito ON Quito.Consultas(CedPacienteID);
CREATE INDEX idx_Consultas_MedicoID_Quito ON Quito.Consultas(CedMedicoID);

-----------------------------------------------

-- Tablas en esquema Ambato
CREATE TABLE Ambato.CentrosMedicos (
    CentroID INT PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Ciudad NVARCHAR(50) NOT NULL
);

CREATE TABLE Ambato.Medicos (
    CedMedicoID NVARCHAR(10) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Especialidad NVARCHAR(50) NOT NULL,
    CentroID INT NOT NULL FOREIGN KEY REFERENCES Ambato.CentrosMedicos(CentroID)
);

CREATE TABLE Ambato.Pacientes (
    CedPacienteID NVARCHAR(50) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100)
);

CREATE TABLE Ambato.Consultas (
    ConsultaID NVARCHAR(50) PRIMARY KEY,
    CedPacienteID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Ambato.Pacientes(CedPacienteID),
    Fecha DATE NOT NULL,
    CentroID INT NOT NULL FOREIGN KEY REFERENCES Ambato.CentrosMedicos(CentroID),
    CedMedicoID NVARCHAR(10) NOT NULL FOREIGN KEY REFERENCES Ambato.Medicos(CedMedicoID)
);

--  Índices Ambato
CREATE INDEX idx_Consultas_CentroID_Ambato ON Ambato.Consultas(CentroID);
CREATE INDEX idx_Consultas_Fecha_Ambato ON Ambato.Consultas(Fecha);
CREATE INDEX idx_Consultas_PacienteID_Ambato ON Ambato.Consultas(CedPacienteID);
CREATE INDEX idx_Consultas_MedicoID_Ambato ON Ambato.Consultas(CedMedicoID);

-----------------------------------------------

-- Crear Base de datos (Nodo B)
CREATE DATABASE MiniSistemaClinico;
GO

USE MiniSistemaClinico;
GO

-- Crear esquemas para Cuenca y Guayaquil (Nodo B)
CREATE SCHEMA Cuenca;
GO
CREATE SCHEMA Guayaquil;
GO

-- Tablas en esquema Cuenca
CREATE TABLE Cuenca.CentrosMedicos (
    CentroID INT PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Ciudad NVARCHAR(50) NOT NULL
);

CREATE TABLE Cuenca.Medicos (
    CedMedicoID NVARCHAR(10) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Especialidad NVARCHAR(50) NOT NULL,
    CentroID INT NOT NULL FOREIGN KEY REFERENCES Cuenca.CentrosMedicos(CentroID)
);

CREATE TABLE Cuenca.Pacientes (
    CedPacienteID NVARCHAR(50) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100)
);

CREATE TABLE Cuenca.Consultas (
    ConsultaID NVARCHAR(50) PRIMARY KEY,
    CedPacienteID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Cuenca.Pacientes(CedPacienteID),
    Fecha DATE NOT NULL,
    CentroID INT NOT NULL FOREIGN KEY REFERENCES Cuenca.CentrosMedicos(CentroID),
    CedMedicoID NVARCHAR(10) NOT NULL FOREIGN KEY REFERENCES Cuenca.Medicos(CedMedicoID)
);

-- Índices Cuenca
CREATE INDEX idx_Consultas_CentroID_Cuenca ON Cuenca.Consultas(CentroID);
CREATE INDEX idx_Consultas_Fecha_Cuenca ON Cuenca.Consultas(Fecha);
CREATE INDEX idx_Consultas_PacienteID_Cuenca ON Cuenca.Consultas(CedPacienteID);
CREATE INDEX idx_Consultas_MedicoID_Cuenca ON Cuenca.Consultas(CedMedicoID);

-----------------------------------------------

-- Tablas en esquema Guayaquil
CREATE TABLE Guayaquil.CentrosMedicos (
    CentroID INT PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Ciudad NVARCHAR(50) NOT NULL
);

CREATE TABLE Guayaquil.Medicos (
    CedMedicoID NVARCHAR(10) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Especialidad NVARCHAR(50) NOT NULL,
    CentroID INT NOT NULL FOREIGN KEY REFERENCES Guayaquil.CentrosMedicos(CentroID)
);

CREATE TABLE Guayaquil.Pacientes (
    CedPacienteID NVARCHAR(50) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100)
);

CREATE TABLE Guayaquil.Consultas (
    ConsultaID NVARCHAR(50) PRIMARY KEY,
    CedPacienteID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Guayaquil.Pacientes(CedPacienteID),
    Fecha DATE NOT NULL,
    CentroID INT NOT NULL FOREIGN KEY REFERENCES Guayaquil.CentrosMedicos(CentroID),
    CedMedicoID NVARCHAR(10) NOT NULL FOREIGN KEY REFERENCES Guayaquil.Medicos(CedMedicoID)
);

-- Índices Guayaquil
CREATE INDEX idx_Consultas_CentroID_Guayaquil ON Guayaquil.Consultas(CentroID);
CREATE INDEX idx_Consultas_Fecha_Guayaquil ON Guayaquil.Consultas(Fecha);
CREATE INDEX idx_Consultas_PacienteID_Guayaquil ON Guayaquil.Consultas(CedPacienteID);
CREATE INDEX idx_Consultas_MedicoID_Guayaquil ON Guayaquil.Consultas(CedMedicoID);

-----------------------------------------------

-- Crear Base de datos BACKUP (Nodo C)
CREATE DATABASE MiniSistemaClinicoBK;
GO

USE MiniSistemaClinicoBK;
GO

-- Esquemas de backup para cada ciudad
CREATE SCHEMA Backup_Ambato;
GO
CREATE SCHEMA Backup_Quito;
GO
CREATE SCHEMA Backup_Cuenca;
GO
CREATE SCHEMA Backup_Guayaquil;
GO

-- Crear tablas en Nodo_C replicando todas las tablas
-- Ambato
CREATE TABLE Backup_Ambato.CentrosMedicos (
    CentroID INT PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Ciudad NVARCHAR(50) NOT NULL
);

CREATE TABLE Backup_Ambato.Medicos (
    CedMedicoID NVARCHAR(10) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Especialidad NVARCHAR(50) NOT NULL,
    CentroID INT NOT NULL
);

CREATE TABLE Backup_Ambato.Pacientes (
    CedPacienteID NVARCHAR(50) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100)
);

CREATE TABLE Backup_Ambato.Consultas (
    ConsultaID NVARCHAR(50) PRIMARY KEY,
    CedPacienteID NVARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    CentroID INT NOT NULL,
    CedMedicoID NVARCHAR(10) NOT NULL
);

-- Quito
CREATE TABLE Backup_Quito.CentrosMedicos (
    CentroID INT PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Ciudad NVARCHAR(50) NOT NULL
);

CREATE TABLE Backup_Quito.Medicos (
    CedMedicoID NVARCHAR(10) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Especialidad NVARCHAR(50) NOT NULL,
    CentroID INT NOT NULL
);

CREATE TABLE Backup_Quito.Pacientes (
    CedPacienteID NVARCHAR(50) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100)
);

CREATE TABLE Backup_Quito.Consultas (
    ConsultaID NVARCHAR(50) PRIMARY KEY,
    CedPacienteID NVARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    CentroID INT NOT NULL,
    CedMedicoID NVARCHAR(10) NOT NULL
);

-- Cuenca
CREATE TABLE Backup_Cuenca.CentrosMedicos (
    CentroID INT PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Ciudad NVARCHAR(50) NOT NULL
);

CREATE TABLE Backup_Cuenca.Medicos (
    CedMedicoID NVARCHAR(10) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Especialidad NVARCHAR(50) NOT NULL,
    CentroID INT NOT NULL
);

CREATE TABLE Backup_Cuenca.Pacientes (
    CedPacienteID NVARCHAR(50) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100)
);

CREATE TABLE Backup_Cuenca.Consultas (
    ConsultaID NVARCHAR(50) PRIMARY KEY,
    CedPacienteID NVARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    CentroID INT NOT NULL,
    CedMedicoID NVARCHAR(10) NOT NULL
);

-- Guayaquil
CREATE TABLE Backup_Guayaquil.CentrosMedicos (
    CentroID INT PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Ciudad NVARCHAR(50) NOT NULL
);

CREATE TABLE Backup_Guayaquil.Medicos (
    CedMedicoID NVARCHAR(10) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Especialidad NVARCHAR(50) NOT NULL,
    CentroID INT NOT NULL
);

CREATE TABLE Backup_Guayaquil.Pacientes (
    CedPacienteID NVARCHAR(50) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100)
);

CREATE TABLE Backup_Guayaquil.Consultas (
    ConsultaID NVARCHAR(50) PRIMARY KEY,
    CedPacienteID NVARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    CentroID INT NOT NULL,
    CedMedicoID NVARCHAR(10) NOT NULL
);

-----------------------------------------------
-- Nodo A
USE MiniSistemaClinico;
GO
SELECT * FROM Ambato.CentrosMedicos;
SELECT * FROM Ambato.Medicos;
SELECT * FROM Ambato.Pacientes;
SELECT * FROM Ambato.Consultas;

SELECT * FROM Quito.CentrosMedicos;
SELECT * FROM Quito.Medicos;
SELECT * FROM Quito.Pacientes;
SELECT * FROM Quito.Consultas;

-----------------------------------------------
-- Nodo B
USE MiniSistemaClinico;
GO
SELECT * FROM Cuenca.CentrosMedicos;
SELECT * FROM Cuenca.Medicos;
SELECT * FROM Cuenca.Pacientes;
SELECT * FROM Cuenca.Consultas;

SELECT * FROM Guayaquil.CentrosMedicos;
SELECT * FROM Guayaquil.Medicos;
SELECT * FROM Guayaquil.Pacientes;
SELECT * FROM Guayaquil.Consultas;


-----------------------------------------------
-- Nodo C
-- Datos de respaldo de Nodo_A (Ambato y Quito) y de Nodo_B (Cuenca y Guayaquil) en Nodo_C
USE MiniSistemaClinicoBK;
GO
-- Ambato
SELECT * FROM Backup_Ambato.CentrosMedicos;
SELECT * FROM Backup_Ambato.Medicos;
SELECT * FROM Backup_Ambato.Pacientes;
SELECT * FROM Backup_Ambato.Consultas;

-- Quito
SELECT * FROM Backup_Quito.CentrosMedicos;
SELECT * FROM Backup_Quito.Medicos;
SELECT * FROM Backup_Quito.Pacientes;
SELECT * FROM Backup_Quito.Consultas;

-- Cuenca
SELECT * FROM Backup_Cuenca.CentrosMedicos;
SELECT * FROM Backup_Cuenca.Medicos;
SELECT * FROM Backup_Cuenca.Pacientes;
SELECT * FROM Backup_Cuenca.Consultas;

-- Guayaquil
SELECT * FROM Backup_Guayaquil.CentrosMedicos;
SELECT * FROM Backup_Guayaquil.Medicos;
SELECT * FROM Backup_Guayaquil.Pacientes;
SELECT * FROM Backup_Guayaquil.Consultas;