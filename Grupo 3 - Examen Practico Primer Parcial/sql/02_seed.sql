-- ============================================
-- Carga de Datos - Semilla Inicial
-- ============================================
-- DATOS Nodo A
USE MiniSistemaClinico;
GO

-- Centros en Ambato
INSERT INTO Ambato.CentrosMedicos (CentroID, Nombre, Ciudad) VALUES
(1, 'Centro Ambato', 'Ambato');

-- Médicos en Ambato
INSERT INTO Ambato.Medicos (CedMedicoID, Nombre, Especialidad, CentroID) VALUES
('1800000001', 'Dr. Juan Pérez', 'Cardiología', 1),
('1800000002', 'Dra. Ana Gómez', 'Pediatría', 1),
('1800000003', 'Dr. Luis Torres', 'Neurología', 1);

-- Pacientes (Ambato)
INSERT INTO Ambato.Pacientes (CedPacienteID, Nombre, Email) VALUES
('1900000001', 'José Martínez', 'jose@mail.com'),
('1900000002', 'Lucía Herrera', 'lucia@mail.com'),
('1900000003', 'Carlos Andrade', 'carlos@mail.com'),
('1900000004', 'María López', 'maria@mail.com'),
('1900000005', 'Pedro Sánchez', 'pedro@mail.com');

-- Consultas en Ambato
INSERT INTO Ambato.Consultas (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID) VALUES
('CAMB001','1900000001','2025-10-01',1,'1800000001'),
('CAMB002','1900000002','2025-10-02',1,'1800000001'),
('CAMB003','1900000003','2025-10-03',1,'1800000002'),
('CAMB004','1900000004','2025-10-07',1,'1800000002'),
('CAMB005','1900000005','2025-10-09',1,'1800000003');

-----------------------------------------------
-- Centros en Quito
INSERT INTO Quito.CentrosMedicos (CentroID, Nombre, Ciudad) VALUES
(2, 'Centro Quito', 'Quito');

-- Médicos en Quito
INSERT INTO Quito.Medicos (CedMedicoID, Nombre, Especialidad, CentroID) VALUES
('1800000004', 'Dra. Marta Ruiz', 'Dermatología', 2),
('1800000005', 'Dra. Ana Morales', 'Pediatría', 2),
('1800000006', 'Dr. Jose Torres', 'Neurología', 2);

-- Pacientes (Quito)
INSERT INTO Quito.Pacientes (CedPacienteID, Nombre, Email) VALUES
('1900000006', 'Andrea Navas', 'andrea@mail.com'),
('1900000007', 'Luis Mora', 'luis@mail.com'),
('1900000008', 'Fernanda Salas', 'fernanda@mail.com'),
('1900000009', 'Jorge Torres', 'jorge@mail.com'),
('1900000010', 'Carla Rojas', 'carla@mail.com');

-- Consultas en Quito
INSERT INTO Quito.Consultas (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID) VALUES
('CQUI001','1900000006','2025-10-04',2,'1800000004'),
('CQUI002','1900000007','2025-10-05',2,'1800000005'),
('CQUI003','1900000008','2025-10-06',2,'1800000004'),
('CQUI004','1900000009','2025-10-08',2,'1800000004'),
('CQUI005','1900000010','2025-10-10',2,'1800000006');

-----------------------------------------------

-- DATOS Nodo B
USE MiniSistemaClinico;
GO

-- Centros en Cuenca
INSERT INTO Cuenca.CentrosMedicos (CentroID, Nombre, Ciudad) VALUES
(3, 'Centro Cuenca', 'Cuenca');

-- Médicos en Cuenca
INSERT INTO Cuenca.Medicos (CedMedicoID, Nombre, Especialidad, CentroID) VALUES
('1800000007', 'Dr. Pedro Castro', 'Cardiología', 3),
('1800000008', 'Dra. Silvia Moreno', 'Pediatría', 3),
('1800000009', 'Dr. Carlos Vega', 'Neurología', 3);

-- Pacientes Cuenca
INSERT INTO Cuenca.Pacientes (CedPacienteID, Nombre, Email) VALUES
('1900000011', 'Marcos Pinto', 'marcos@mail.com'),
('1900000012', 'Sofía Ramírez', 'sofia@mail.com'),
('1900000013', 'Daniela Torres', 'daniela@mail.com'),
('1900000014', 'Raúl Mejía', 'raul@mail.com'),
('1900000015', 'Camila López', 'camila@mail.com');

-- Consultas en Cuenca
INSERT INTO Cuenca.Consultas (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID) VALUES
('CCUE001','1900000011','2025-10-01',3,'1800000007'),
('CCUE002','1900000012','2025-10-02',3,'1800000008'),
('CCUE003','1900000013','2025-10-03',3,'1800000009'),
('CCUE004','1900000014','2025-10-04',3,'1800000007'),
('CCUE005','1900000015','2025-10-05',3,'1800000008');

-----------------------------------------------

-- Centros en Guayaquil
INSERT INTO Guayaquil.CentrosMedicos (CentroID, Nombre, Ciudad) VALUES
(4, 'Centro Guayaquil', 'Guayaquil');

-- Médicos en Guayaquil
INSERT INTO Guayaquil.Medicos (CedMedicoID, Nombre, Especialidad, CentroID) VALUES
('1800000010', 'Dr. Miguel Ramírez', 'Cardiología', 4),
('1800000011', 'Dra. Laura Pérez', 'Pediatría', 4),
('1800000012', 'Dr. Jorge Morales', 'Neurología', 4);

-- Pacientes Guayaquil
INSERT INTO Guayaquil.Pacientes (CedPacienteID, Nombre, Email) VALUES
('1900000016', 'Valeria Torres', 'valeria@mail.com'),
('1900000017', 'Andrés Gómez', 'andres@mail.com'),
('1900000018', 'Natalia Cruz', 'natalia@mail.com'),
('1900000019', 'Javier Paredes', 'javier@mail.com'),
('1900000020', 'Daniel Flores', 'daniel@mail.com');

-- Consultas en Guayaquil
INSERT INTO Guayaquil.Consultas (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID) VALUES
('CGYE001','1900000016','2025-10-01',4,'1800000010'),
('CGYE002','1900000017','2025-10-02',4,'1800000011'),
('CGYE003','1900000018','2025-10-03',4,'1800000012'),
('CGYE004','1900000019','2025-10-04',4,'1800000010'),
('CGYE005','1900000020','2025-10-05',4,'1800000011');



-- ============================================
-- Pruebas CRUD locales 
-- ============================================
-- Nodo A
USE MiniSistemaClinico;
GO

-- CREATE (INSERT):
INSERT INTO Ambato.Pacientes (CedPacienteID, Nombre, Email)
VALUES ('1900000011', 'Mario Zamora', 'mario@mail.com');

-- READ (SELECT):
SELECT * FROM Ambato.Pacientes;

-- UPDATE:
UPDATE Ambato.Pacientes
SET Email = 'mario.zamora@mail.com'
WHERE CedPacienteID = '1900000011';

-- DELETE:
DELETE FROM Ambato.Pacientes
WHERE CedPacienteID = '1900000011';

-- Consulta analítica 1 por rango de fechas:
-- Mostrar todas las consultas médicas realizadas entre dos fechas específicas:
SELECT C.ConsultaID, P.Nombre AS Paciente, M.Nombre AS Medico, C.Fecha
FROM Ambato.Consultas C
JOIN Ambato.Pacientes P ON C.CedPacienteID = P.CedPacienteID
JOIN Ambato.Medicos M ON C.CedMedicoID = M.CedMedicoID
WHERE C.Fecha BETWEEN '2025-10-01' AND '2025-10-07';

-- Consulta analítica 2 top de especialidades más registradas:
-- Contar cuántas consultas se realizaron por especialidad, y mostrar el top 3:
SELECT M.Especialidad, COUNT(*) AS TotalConsultas
FROM Ambato.Consultas C
JOIN Ambato.Medicos M ON C.CedMedicoID = M.CedMedicoID
GROUP BY M.Especialidad
ORDER BY TotalConsultas DESC;

-----------------------------------------------

-- Nodo B
USE MiniSistemaClinico;
GO
-- CREATE (INSERT):
INSERT INTO Cuenca.Pacientes (CedPacienteID, Nombre, Email)
VALUES ('1900000021', 'Patricio Vega', 'patricio@mail.com');

-- READ (SELECT):
SELECT * FROM Cuenca.Pacientes;

-- UPDATE:
UPDATE Cuenca.Pacientes
SET Email = 'patricio.vega@mail.com'
WHERE CedPacienteID = '1900000021';

-- DELETE:
DELETE FROM Cuenca.Pacientes
WHERE CedPacienteID = '1900000021';

-- Consulta analítica 1 - Rango de fechas:
-- Consultas médicas entre fechas específicas
SELECT C.ConsultaID, P.Nombre AS Paciente, M.Nombre AS Medico, C.Fecha
FROM Cuenca.Consultas C
JOIN Cuenca.Pacientes P ON C.CedPacienteID = P.CedPacienteID
JOIN Cuenca.Medicos M ON C.CedMedicoID = M.CedMedicoID
WHERE C.Fecha BETWEEN '2025-10-01' AND '2025-10-07';

-- Consulta analítica 2 - Top especialidades más registradas:
SELECT M.Especialidad, COUNT(*) AS TotalConsultas
FROM Cuenca.Consultas C
JOIN Cuenca.Medicos M ON C.CedMedicoID = M.CedMedicoID
GROUP BY M.Especialidad
ORDER BY TotalConsultas DESC;
GO
