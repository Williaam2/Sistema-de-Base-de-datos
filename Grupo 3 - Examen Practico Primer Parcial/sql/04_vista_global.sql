-- ============================================
-- Vista Global con Transparencia
-- ============================================

-- Nodo A
USE MiniSistemaClinico;
GO

-- Vista global para Consultas
CREATE VIEW vw_ConsultasGlobal AS
-- Nodo_A local
SELECT ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID
FROM Ambato.Consultas
UNION ALL
SELECT ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID
FROM Quito.Consultas
-- Nodo_B via linked server
UNION ALL
SELECT ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID
FROM Nodo_B.MiniSistemaClinico.Cuenca.Consultas
UNION ALL
SELECT ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID
FROM Nodo_B.MiniSistemaClinico.Guayaquil.Consultas;

-----------------------------------------------

-- Probar la vista global
SELECT * FROM vw_ConsultasGlobal;

-----------------------------------------------

-- Consulta que demuestra transparencia de localizacion - Filtrar por rango de fechas
SELECT * 
FROM vw_ConsultasGlobal
WHERE Fecha BETWEEN '2025-10-01' AND '2025-10-05';



-- ============================================
-- Consulta distribuida optimizada
-- ============================================
-- Ejemplo de consulta: Se desea conocer las consultas entre el 1 y el 5 de octubre de 2025 solo para Quito o Cuenca.
SELECT ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID
FROM Quito.Consultas
WHERE Fecha BETWEEN '2025-10-01' AND '2025-10-05'  -- Nodo_A: Quito
  AND CentroID = 2  -- Quito CentroID

UNION ALL

SELECT ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID
FROM Nodo_B.MiniSistemaClinico.Cuenca.Consultas
WHERE Fecha BETWEEN '2025-10-01' AND '2025-10-05'  -- Nodo_B: Cuenca
  AND CentroID = 3;
-- Nota: No incluimos Guayaquil porque no nos interesa según el filtro de ciudad

-----------------------------------------------

-- Misma consulta aplicando filtro a vw_ConsultasGlobal
SELECT ConsultaID, CedPacienteID, Fecha, CentroID, CedMedicoID
FROM vw_ConsultasGlobal
WHERE Fecha BETWEEN '2025-10-01' AND '2025-10-05'
  AND CentroID IN (2, 3);  -- Quito y Cuenca

 -----------------------------------------------