-- ============================================
-- Fragmentaci�n Horizontal y Linked Servers
-- ============================================

-- NODO A: Configurar Linked Server hacia Nodo B
USE MiniSistemaClinico;
GO

-- En Nodo_A crear linked server hacia la instancia Nodo_B
EXEC sp_addlinkedserver 
   @server = 'Nodo_B',          -- Nombre con el que se identifica el servidor remoto
   @srvproduct = '',            -- Nombre del producto (puede dejarse vac�o para SQL Server)
   @provider = 'MSOLEDBSQL',    -- Proveedor OLE DB que permite la conexi�n (SQL Native Client)
   @datasrc = 'nodo_b';         -- Direcci�n IP o nombre del servidor remoto

-- login mapping (usar autenticaci�n SQL)
EXEC sp_addlinkedsrvlogin 
   @rmtsrvname = 'Nodo_B',
   @useself = 'false',
   @locallogin = NULL,
   @rmtuser = 'sa',       -- o el usuario SQL del otro servidor
   @rmtpassword = '12345Aa!';

-----------------------------------------------

-- Verificar fragmentaci�n por ciudad
-- Nodo A
USE MiniSistemaClinico;
GO
SELECT 'NODO A - Ambato' as Fragmento, * FROM Ambato.CentrosMedicos
UNION ALL
SELECT 'NODO A - Quito', * FROM Quito.CentrosMedicos
UNION ALL
SELECT 'NODO B - Cuenca', * FROM Nodo_B.MiniSistemaClinico.Cuenca.CentrosMedicos
UNION ALL
SELECT 'NODO B - Guayaquil', * FROM Nodo_B.MiniSistemaClinico.Guayaquil.CentrosMedicos;
GO
