-- ============================================
-- Replicación de referencia
-- ============================================
-- Configurar Linked Server hacia Nodo C para Backup
-- Nodo A
USE MiniSistemaClinico;
GO

-- En Nodo_A crear linked server hacia la instancia Nodo_C para BackUp
EXEC sp_addlinkedserver 
   @server = 'Nodo_C',          -- Nombre con el que se identifica el servidor remoto
   @srvproduct = '',            -- Nombre del producto (puede dejarse vacío para SQL Server)
   @provider = 'MSOLEDBSQL',    -- Proveedor OLE DB que permite la conexión (SQL Native Client)
   @datasrc = 'nodo_c';         -- Dirección IP o nombre del servidor remoto

-- login mapping (usar autenticación SQL)
EXEC sp_addlinkedsrvlogin 
   @rmtsrvname = 'Nodo_C',
   @useself = 'false',
   @locallogin = NULL,
   @rmtuser = 'sa',
   @rmtpassword = '12345Aa!';

-----------------------------------------------

-- Copiar DATOS INICIALES de Ambato
-- CentrosMedicos
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.CentrosMedicos (CentroID, Nombre, Ciudad)
SELECT CentroID, Nombre, Ciudad
FROM Ambato.CentrosMedicos;

-- Medicos
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.Medicos (CedMedicoID, Nombre, Especialidad, CentroID)
SELECT CedMedicoID, Nombre, Especialidad, CentroID
FROM Ambato.Medicos;

-- Pacientes
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.Pacientes (CedPacienteID, Nombre, Email)
SELECT CedPacienteID, Nombre, Email
FROM Ambato.Pacientes;

-- Consultas
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.Consultas (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID)
SELECT ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID
FROM Ambato.Consultas;

-- Copiar DATOS INICIALES de Quito
-- CentrosMedicos
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Quito.CentrosMedicos (CentroID, Nombre, Ciudad)
SELECT CentroID, Nombre, Ciudad
FROM Quito.CentrosMedicos;

-- Medicos
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Quito.Medicos (CedMedicoID, Nombre, Especialidad, CentroID)
SELECT CedMedicoID, Nombre, Especialidad, CentroID
FROM Quito.Medicos;

-- Pacientes
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Quito.Pacientes (CedPacienteID, Nombre, Email)
SELECT CedPacienteID, Nombre, Email
FROM Quito.Pacientes;

-- Consultas
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Quito.Consultas (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID)
SELECT ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID
FROM Quito.Consultas;

-----------------------------------------------

-- Configurar Linked Server hacia Nodo C para Backup
-- Nodo B
USE MiniSistemaClinico;
GO

-- En Nodo_B crear linked server hacia la instancia Nodo_C para BackUp
EXEC sp_addlinkedserver 
   @server = 'Nodo_C',          -- Nombre con el que se identifica el servidor remoto
   @srvproduct = '',            -- Nombre del producto (puede dejarse vacío para SQL Server)
   @provider = 'MSOLEDBSQL',    -- Proveedor OLE DB que permite la conexión (SQL Native Client)
   @datasrc = 'nodo_c';         -- Dirección IP o nombre del servidor remoto

-- login mapping (usar autenticación SQL)
EXEC sp_addlinkedsrvlogin 
   @rmtsrvname = 'Nodo_C',
   @useself = 'false',
   @locallogin = NULL,
   @rmtuser = 'sa',
   @rmtpassword = '12345Aa!';

-----------------------------------------------

-- Copiar DATOS INICIALES de Cuenca
-- CentrosMedicos
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.CentrosMedicos (CentroID, Nombre, Ciudad)
SELECT CentroID, Nombre, Ciudad
FROM Cuenca.CentrosMedicos;

-- Medicos
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.Medicos (CedMedicoID, Nombre, Especialidad, CentroID)
SELECT CedMedicoID, Nombre, Especialidad, CentroID
FROM Cuenca.Medicos;

-- Pacientes
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.Pacientes (CedPacienteID, Nombre, Email)
SELECT CedPacienteID, Nombre, Email
FROM Cuenca.Pacientes;

-- Consultas
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.Consultas (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID)
SELECT ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID
FROM Cuenca.Consultas;

-- Copiar DATOS INICIALES de Guayaquil
-- CentrosMedicos
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.CentrosMedicos (CentroID, Nombre, Ciudad)
SELECT CentroID, Nombre, Ciudad
FROM Guayaquil.CentrosMedicos;

-- Medicos
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.Medicos (CedMedicoID, Nombre, Especialidad, CentroID)
SELECT CedMedicoID, Nombre, Especialidad, CentroID
FROM Guayaquil.Medicos;

-- Pacientes
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.Pacientes (CedPacienteID, Nombre, Email)
SELECT CedPacienteID, Nombre, Email
FROM Guayaquil.Pacientes;

-- Consultas
INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.Consultas (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID)
SELECT ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID
FROM Guayaquil.Consultas;



-- ============================================
-- Triggers de Sincronización
-- ============================================
-- Nodo A
USE MiniSistemaClinico;
GO
-- ============================================
-- Triggers para Ambato - CentrosMedicos 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_CentrosMedicos_Ambato
ON Ambato.CentrosMedicos
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.CentrosMedicos (CentroID, Nombre, Ciudad)
    SELECT CentroID, Nombre, Ciudad
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_CentrosMedicos_Ambato
ON Ambato.CentrosMedicos
AFTER UPDATE
AS
BEGIN
    UPDATE Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.CentrosMedicos
    SET Nombre = i.Nombre,
        Ciudad = i.Ciudad
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.CentrosMedicos b
    JOIN inserted i ON b.CentroID = i.CentroID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_CentrosMedicos_Ambato
ON Ambato.CentrosMedicos
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.CentrosMedicos b
    JOIN deleted d ON b.CentroID = d.CentroID;
END;
GO


-- ============================================
-- Triggers para Ambato - Medicos 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_Medicos_Ambato
ON Ambato.Medicos
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.Medicos (CedMedicoID, Nombre, Especialidad, CentroID)
    SELECT CedMedicoID, Nombre, Especialidad, CentroID
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_Medicos_Ambato
ON Ambato.Medicos
AFTER UPDATE
AS
BEGIN
    UPDATE b
    SET Nombre = i.Nombre,
        Especialidad = i.Especialidad,
        CentroID = i.CentroID
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.Medicos b
    JOIN inserted i ON b.CedMedicoID = i.CedMedicoID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_Medicos_Ambato
ON Ambato.Medicos
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.Medicos b
    JOIN deleted d ON b.CedMedicoID = d.CedMedicoID;
END;
GO


-- ============================================
-- Triggers para Ambato - Pacientes 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_Pacientes_Ambato
ON Ambato.Pacientes
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.Pacientes (CedPacienteID, Nombre, Email)
    SELECT CedPacienteID, Nombre, Email
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_Pacientes_Ambato
ON Ambato.Pacientes
AFTER UPDATE
AS
BEGIN
    UPDATE b
    SET Nombre = i.Nombre,
        Email = i.Email
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.Pacientes b
    JOIN inserted i ON b.CedPacienteID = i.CedPacienteID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_Pacientes_Ambato
ON Ambato.Pacientes
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.Pacientes b
    JOIN deleted d ON b.CedPacienteID = d.CedPacienteID;
END;
GO


-- ============================================
-- Triggers para Ambato - Consultas 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_Consultas_Ambato
ON Ambato.Consultas
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.Consultas (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID)
    SELECT ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_Consultas_Ambato
ON Ambato.Consultas
AFTER UPDATE
AS
BEGIN
    UPDATE b
    SET CedPacienteID = i.CedPacienteID,
        Fecha = i.Fecha,
        CentroID = i.CentroID,
        CedMedicoID = i.CedMedicoID
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.Consultas b
    JOIN inserted i ON b.ConsultaID = i.ConsultaID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_Consultas_Ambato
ON Ambato.Consultas
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Ambato.Consultas b
    JOIN deleted d ON b.ConsultaID = d.ConsultaID;
END;
GO


-----------------------------------------------


-- ============================================
-- Triggers para Quito - CentrosMedicos 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_CentrosMedicos_Quito
ON Quito.CentrosMedicos
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Quito.CentrosMedicos (CentroID, Nombre, Ciudad)
    SELECT CentroID, Nombre, Ciudad
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_CentrosMedicos_Quito
ON Quito.CentrosMedicos
AFTER UPDATE
AS
BEGIN
    UPDATE Nodo_C.MiniSistemaClinicoBK.Backup_Quito.CentrosMedicos
    SET Nombre = i.Nombre,
        Ciudad = i.Ciudad
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Quito.CentrosMedicos b
    JOIN inserted i ON b.CentroID = i.CentroID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_CentrosMedicos_Quito
ON Quito.CentrosMedicos
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Quito.CentrosMedicos b
    JOIN deleted d ON b.CentroID = d.CentroID;
END;
GO


-- ============================================
-- Triggers para Quito - Medicos 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_Medicos_Quito
ON Quito.Medicos
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Quito.Medicos (CedMedicoID, Nombre, Especialidad, CentroID)
    SELECT CedMedicoID, Nombre, Especialidad, CentroID
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_Medicos_Quito
ON Quito.Medicos
AFTER UPDATE
AS
BEGIN
    UPDATE b
    SET Nombre = i.Nombre,
        Especialidad = i.Especialidad,
        CentroID = i.CentroID
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Quito.Medicos b
    JOIN inserted i ON b.CedMedicoID = i.CedMedicoID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_Medicos_Quito
ON Quito.Medicos
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Quito.Medicos b
    JOIN deleted d ON b.CedMedicoID = d.CedMedicoID;
END;
GO


-- ============================================
-- Triggers para Quito - Pacientes 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_Pacientes_Quito
ON Quito.Pacientes
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Quito.Pacientes (CedPacienteID, Nombre, Email)
    SELECT CedPacienteID, Nombre, Email
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_Pacientes_Quito
ON Quito.Pacientes
AFTER UPDATE
AS
BEGIN
    UPDATE b
    SET Nombre = i.Nombre,
        Email = i.Email
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Quito.Pacientes b
    JOIN inserted i ON b.CedPacienteID = i.CedPacienteID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_Pacientes_Quito
ON Quito.Pacientes
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Quito.Pacientes b
    JOIN deleted d ON b.CedPacienteID = d.CedPacienteID;
END;
GO


-- ============================================
-- Triggers para Quito - Consultas 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_Consultas_Quito
ON Quito.Consultas
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Quito.Consultas (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID)
    SELECT ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_Consultas_Quito
ON Quito.Consultas
AFTER UPDATE
AS
BEGIN
    UPDATE b
    SET CedPacienteID = i.CedPacienteID,
        Fecha = i.Fecha,
        CentroID = i.CentroID,
        CedMedicoID = i.CedMedicoID
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Quito.Consultas b
    JOIN inserted i ON b.ConsultaID = i.ConsultaID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_Consultas_Quito
ON Quito.Consultas
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Quito.Consultas b
    JOIN deleted d ON b.ConsultaID = d.ConsultaID;
END;
GO


-- ======================================================
-- Pruebas TRIGGERS 
-- ======================================================
-- INSERT
INSERT INTO Ambato.CentrosMedicos (CentroID, Nombre, Ciudad) 
VALUES (101, 'Hospital Regional Ambato', 'Ambato');
-- UPDATE
UPDATE Ambato.CentrosMedicos 
SET Nombre = 'Hospital Regional Ambato Actualizado' 
WHERE CentroID = 101;
-- DELETE
DELETE FROM Ambato.CentrosMedicos 
WHERE CentroID = 101;


-- INSERT
INSERT INTO Ambato.Medicos (CedMedicoID, Nombre, Especialidad, CentroID) 
VALUES ('1712345678', 'Dr. Carlos López', 'Cardiología', 1);
-- UPDATE
UPDATE Ambato.Medicos 
SET Especialidad = 'Cardiología Intervencionista' 
WHERE CedMedicoID = '1712345678';
-- DELETE
DELETE FROM Ambato.Medicos 
WHERE CedMedicoID = '1712345678';


-- INSERT
INSERT INTO Ambato.Pacientes (CedPacienteID, Nombre, Email) 
VALUES ('1723456789', 'María González', 'maria.gonzalez@email.com');
-- UPDATE
UPDATE Ambato.Pacientes 
SET Email = 'maria.gonzalez.nuevo@email.com' 
WHERE CedPacienteID = '1723456789';
-- DELETE
DELETE FROM Ambato.Pacientes 
WHERE CedPacienteID = '1723456789';


-- INSERT
INSERT INTO Ambato.Consultas (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID) 
VALUES ('CAMB006', '1900000005', '2024-01-15', 1, '1800000003');
-- UPDATE
UPDATE Ambato.Consultas 
SET Fecha = '2024-01-20' 
WHERE ConsultaID = 'CAMB006';
-- DELETE
DELETE FROM Ambato.Consultas 
WHERE ConsultaID = 'CAMB006';

-----------------------------------------------

-- Ver triggers
SELECT 
    name AS NombreDelTrigger,
    OBJECT_SCHEMA_NAME(parent_id) AS EsquemaDeLaTabla,
    OBJECT_NAME(parent_id) AS NombreDeLaTabla
FROM 
    sys.triggers
WHERE 
    is_ms_shipped = 0; -- Excluye triggers internos del sistema
GO


-----------------------------------------------


-- Nodo B
USE MiniSistemaClinico;
GO

-- ============================================
-- Triggers para Cuenca - CentrosMedicos 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_CentrosMedicos_Cuenca
ON Cuenca.CentrosMedicos
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.CentrosMedicos (CentroID, Nombre, Ciudad)
    SELECT CentroID, Nombre, Ciudad
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_CentrosMedicos_Cuenca
ON Cuenca.CentrosMedicos
AFTER UPDATE
AS
BEGIN
    UPDATE Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.CentrosMedicos
    SET Nombre = i.Nombre,
        Ciudad = i.Ciudad
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.CentrosMedicos b
    JOIN inserted i ON b.CentroID = i.CentroID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_CentrosMedicos_Cuenca
ON Cuenca.CentrosMedicos
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.CentrosMedicos b
    JOIN deleted d ON b.CentroID = d.CentroID;
END;
GO


-- ============================================
-- Triggers para Cuenca - Medicos 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_Medicos_Cuenca
ON Cuenca.Medicos
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.Medicos (CedMedicoID, Nombre, Especialidad, CentroID)
    SELECT CedMedicoID, Nombre, Especialidad, CentroID
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_Medicos_Cuenca
ON Cuenca.Medicos
AFTER UPDATE
AS
BEGIN
    UPDATE b
    SET Nombre = i.Nombre,
        Especialidad = i.Especialidad,
        CentroID = i.CentroID
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.Medicos b
    JOIN inserted i ON b.CedMedicoID = i.CedMedicoID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_Medicos_Cuenca
ON Cuenca.Medicos
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.Medicos b
    JOIN deleted d ON b.CedMedicoID = d.CedMedicoID;
END;
GO


-- ============================================
-- Triggers para Cuenca - Pacientes 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_Pacientes_Cuenca
ON Cuenca.Pacientes
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.Pacientes (CedPacienteID, Nombre, Email)
    SELECT CedPacienteID, Nombre, Email
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_Pacientes_Cuenca
ON Cuenca.Pacientes
AFTER UPDATE
AS
BEGIN
    UPDATE b
    SET Nombre = i.Nombre,
        Email = i.Email
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.Pacientes b
    JOIN inserted i ON b.CedPacienteID = i.CedPacienteID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_Pacientes_Cuenca
ON Cuenca.Pacientes
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.Pacientes b
    JOIN deleted d ON b.CedPacienteID = d.CedPacienteID;
END;
GO


-- ============================================
-- Triggers para Cuenca - Consultas 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_Consultas_Cuenca
ON Cuenca.Consultas
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.Consultas (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID)
    SELECT ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_Consultas_Cuenca
ON Cuenca.Consultas
AFTER UPDATE
AS
BEGIN
    UPDATE b
    SET CedPacienteID = i.CedPacienteID,
        Fecha = i.Fecha,
        CentroID = i.CentroID,
        CedMedicoID = i.CedMedicoID
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.Consultas b
    JOIN inserted i ON b.ConsultaID = i.ConsultaID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_Consultas_Cuenca
ON Cuenca.Consultas
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Cuenca.Consultas b
    JOIN deleted d ON b.ConsultaID = d.ConsultaID;
END;
GO


-----------------------------------------------


-- ============================================
-- Triggers para Guayaquil - CentrosMedicos 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_CentrosMedicos_Guayaquil
ON Guayaquil.CentrosMedicos
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.CentrosMedicos (CentroID, Nombre, Ciudad)
    SELECT CentroID, Nombre, Ciudad
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_CentrosMedicos_Guayaquil
ON Guayaquil.CentrosMedicos
AFTER UPDATE
AS
BEGIN
    UPDATE Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.CentrosMedicos
    SET Nombre = i.Nombre,
        Ciudad = i.Ciudad
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.CentrosMedicos b
    JOIN inserted i ON b.CentroID = i.CentroID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_CentrosMedicos_Guayaquil
ON Guayaquil.CentrosMedicos
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.CentrosMedicos b
    JOIN deleted d ON b.CentroID = d.CentroID;
END;
GO


-- ============================================
-- Triggers para Guayaquil - Medicos 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_Medicos_Guayaquil
ON Guayaquil.Medicos
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.Medicos (CedMedicoID, Nombre, Especialidad, CentroID)
    SELECT CedMedicoID, Nombre, Especialidad, CentroID
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_Medicos_Guayaquil
ON Guayaquil.Medicos
AFTER UPDATE
AS
BEGIN
    UPDATE b
    SET Nombre = i.Nombre,
        Especialidad = i.Especialidad,
        CentroID = i.CentroID
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.Medicos b
    JOIN inserted i ON b.CedMedicoID = i.CedMedicoID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_Medicos_Guayaquil
ON Guayaquil.Medicos
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.Medicos b
    JOIN deleted d ON b.CedMedicoID = d.CedMedicoID;
END;
GO


-- ============================================
-- Triggers para Guayaquil - Pacientes 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_Pacientes_Guayaquil
ON Guayaquil.Pacientes
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.Pacientes (CedPacienteID, Nombre, Email)
    SELECT CedPacienteID, Nombre, Email
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_Pacientes_Guayaquil
ON Guayaquil.Pacientes
AFTER UPDATE
AS
BEGIN
    UPDATE b
    SET Nombre = i.Nombre,
        Email = i.Email
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.Pacientes b
    JOIN inserted i ON b.CedPacienteID = i.CedPacienteID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_Pacientes_Guayaquil
ON Guayaquil.Pacientes
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.Pacientes b
    JOIN deleted d ON b.CedPacienteID = d.CedPacienteID;
END;
GO


-- ============================================
-- Triggers para Guayaquil - Consultas 
-- ============================================
-- INSERT
CREATE TRIGGER trg_Insert_Consultas_Guayaquil
ON Guayaquil.Consultas
AFTER INSERT
AS
BEGIN
    INSERT INTO Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.Consultas (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID)
    SELECT ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID
    FROM inserted;
END;
GO

-- UPDATE
CREATE TRIGGER trg_Update_Consultas_Guayaquil
ON Guayaquil.Consultas
AFTER UPDATE
AS
BEGIN
    UPDATE b
    SET CedPacienteID = i.CedPacienteID,
        Fecha = i.Fecha,
        CentroID = i.CentroID,
        CedMedicoID = i.CedMedicoID
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.Consultas b
    JOIN inserted i ON b.ConsultaID = i.ConsultaID;
END;
GO

-- DELETE
CREATE TRIGGER trg_Delete_Consultas_Guayaquil
ON Guayaquil.Consultas
AFTER DELETE
AS
BEGIN
    DELETE b
    FROM Nodo_C.MiniSistemaClinicoBK.Backup_Guayaquil.Consultas b
    JOIN deleted d ON b.ConsultaID = d.ConsultaID;
END;
GO


-- ======================================================
-- Pruebas TRIGGERS
-- ======================================================
-- INSERT
INSERT INTO Guayaquil.CentrosMedicos (CentroID, Nombre, Ciudad) 
VALUES (40, 'Hospital Regional Guayaquil', 'Guayaquil');
-- UPDATE
UPDATE Guayaquil.CentrosMedicos 
SET Nombre = 'Hospital Regional Guayaquil Actualizado' 
WHERE CentroID = 40;
-- DELETE
DELETE FROM Guayaquil.CentrosMedicos 
WHERE CentroID = 40;


-- INSERT
INSERT INTO Guayaquil.Medicos (CedMedicoID, Nombre, Especialidad, CentroID) 
VALUES ('1712345678', 'Dr. Carlos López', 'Cardiología', 4);
-- UPDATE
UPDATE Guayaquil.Medicos 
SET Especialidad = 'Cardiología Intervencionista' 
WHERE CedMedicoID = '1712345678';
-- DELETE
DELETE FROM Guayaquil.Medicos 
WHERE CedMedicoID = '1712345678';


-- INSERT
INSERT INTO Guayaquil.Pacientes (CedPacienteID, Nombre, Email) 
VALUES ('1723456789', 'María González', 'maria.gonzalez@email.com');
-- UPDATE
UPDATE Guayaquil.Pacientes 
SET Email = 'maria.gonzalez.nuevo@email.com' 
WHERE CedPacienteID = '1723456789';
-- DELETE
DELETE FROM Guayaquil.Pacientes 
WHERE CedPacienteID = '1723456789';


-- INSERT
INSERT INTO Guayaquil.Consultas (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID) 
VALUES ('CGYE007', '1900000016', '2024-01-15', 4, '1800000011');
-- UPDATE
UPDATE Guayaquil.Consultas 
SET Fecha = '2024-01-20' 
WHERE ConsultaID = 'CGYE007';
-- DELETE
DELETE FROM Guayaquil.Consultas 
WHERE ConsultaID = 'CGYE007';

-----------------------------------------------

-- Ver triggers
SELECT 
    name AS NombreDelTrigger,
    OBJECT_SCHEMA_NAME(parent_id) AS EsquemaDeLaTabla,
    OBJECT_NAME(parent_id) AS NombreDeLaTabla
FROM 
    sys.triggers
WHERE 
    is_ms_shipped = 0; -- Excluye triggers internos del sistema
GO


-- ============================================
-- Prueba de fallo y recuperación
-- ============================================
-- Insercion de un dato en Ambato del Nodo C con Nodo A apagado
-- Nodo C
USE MiniSistemaClinicoBK;
GO
INSERT INTO Backup_Ambato.Consultas (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID) VALUES
('CAMB007','1900000001','2025-10-15',1,'1800000001');


-----------------------------------------------


-- Nodo A
USE MiniSistemaClinico;
GO

-- Proceso de recuperacion de datos ingresados en Nodo C mientras Nodo A esta inactivo

-- Creacion de procedimiento
CREATE OR ALTER PROCEDURE sp_resincronizar_nodoA
AS
BEGIN
    SET NOCOUNT ON;

    PRINT '--- Iniciando resincronización del Nodo A desde Nodo C (MiniSistemaClinicoBK.Backup_Ambato) ---';

    ---------------------------------------------------------
    -- 1? Copiar datos de CentrosMedicos
    ---------------------------------------------------------
    MERGE Ambato.CentrosMedicos AS T
    USING [Nodo_C].MiniSistemaClinicoBK.Backup_Ambato.CentrosMedicos AS S
    ON T.CentroID = S.CentroID
    WHEN MATCHED THEN
        UPDATE SET 
            T.Nombre = S.Nombre,
            T.Ciudad = S.Ciudad
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (CentroID, Nombre, Ciudad)
        VALUES (S.CentroID, S.Nombre, S.Ciudad)
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    ---------------------------------------------------------
    -- 2? Copiar datos de Médicos
    ---------------------------------------------------------
    MERGE Ambato.Medicos AS T
    USING [Nodo_C].MiniSistemaClinicoBK.Backup_Ambato.Medicos AS S
    ON T.CedMedicoID = S.CedMedicoID
    WHEN MATCHED THEN
        UPDATE SET 
            T.Nombre = S.Nombre,
            T.Especialidad = S.Especialidad,
            T.CentroID = S.CentroID
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (CedMedicoID, Nombre, Especialidad, CentroID)
        VALUES (S.CedMedicoID, S.Nombre, S.Especialidad, S.CentroID)
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    ---------------------------------------------------------
    -- 3? Copiar datos de Pacientes
    ---------------------------------------------------------
    MERGE Ambato.Pacientes AS T
    USING [Nodo_C].MiniSistemaClinicoBK.Backup_Ambato.Pacientes AS S
    ON T.CedPacienteID = S.CedPacienteID
    WHEN MATCHED THEN
        UPDATE SET 
            T.Nombre = S.Nombre,
            T.Email = S.Email
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (CedPacienteID, Nombre, Email)
        VALUES (S.CedPacienteID, S.Nombre, S.Email)
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    ---------------------------------------------------------
    -- 4? Copiar datos de Consultas
    ---------------------------------------------------------
    MERGE Ambato.Consultas AS T
    USING [Nodo_C].MiniSistemaClinicoBK.Backup_Ambato.Consultas AS S
    ON T.ConsultaID = S.ConsultaID
    WHEN MATCHED THEN
        UPDATE SET 
            T.CedPacienteID = S.CedPacienteID,
            T.Fecha = S.Fecha,
            T.CentroID = S.CentroID,
            T.CedMedicoID = S.CedMedicoID
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID)
        VALUES (S.ConsultaID, S.CedPacienteID, S.Fecha, S.CentroID, S.CedMedicoID)
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    PRINT '--- Resincronización completada exitosamente. ---';
END;
GO



-- ANTES de caida de nodo A
USE MiniSistemaClinico;
GO
SELECT * FROM Ambato.CentrosMedicos;
SELECT * FROM Ambato.Medicos;
SELECT * FROM Ambato.Pacientes;
SELECT * FROM Ambato.Consultas;


-- =============================================
-- DESHABILITAR TRIGGERS DE SINCRONIZACIÓN
-- =============================================
ALTER TABLE Quito.CentrosMedicos DISABLE TRIGGER ALL;
ALTER TABLE Quito.Medicos DISABLE TRIGGER ALL;
ALTER TABLE Quito.Pacientes DISABLE TRIGGER ALL;
ALTER TABLE Quito.Consultas DISABLE TRIGGER ALL;

ALTER TABLE Ambato.CentrosMedicos DISABLE TRIGGER ALL;
ALTER TABLE Ambato.Medicos DISABLE TRIGGER ALL;
ALTER TABLE Ambato.Pacientes DISABLE TRIGGER ALL;
ALTER TABLE Ambato.Consultas DISABLE TRIGGER ALL;

PRINT '--- Triggers deshabilitados temporalmente ---';

-- Recuperar tras caida haciendo uso del procedimiento creado
EXEC sp_resincronizar_nodoA;

-- =============================================
-- HABILITAR TRIGGERS NUEVAMENTE
-- =============================================
ALTER TABLE Quito.CentrosMedicos ENABLE TRIGGER ALL;
ALTER TABLE Quito.Medicos ENABLE TRIGGER ALL;
ALTER TABLE Quito.Pacientes ENABLE TRIGGER ALL;
ALTER TABLE Quito.Consultas ENABLE TRIGGER ALL;

ALTER TABLE Ambato.CentrosMedicos ENABLE TRIGGER ALL;
ALTER TABLE Ambato.Medicos ENABLE TRIGGER ALL;
ALTER TABLE Ambato.Pacientes ENABLE TRIGGER ALL;
ALTER TABLE Ambato.Consultas ENABLE TRIGGER ALL;

PRINT '--- Triggers reactivados correctamente ---';


-- DESPUES de caida de nodo A
USE MiniSistemaClinico;
GO
SELECT * FROM Ambato.CentrosMedicos;
SELECT * FROM Ambato.Medicos;
SELECT * FROM Ambato.Pacientes;
SELECT * FROM Ambato.Consultas;
