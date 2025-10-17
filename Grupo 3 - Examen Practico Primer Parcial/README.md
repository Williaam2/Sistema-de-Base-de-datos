# SBDD_PruebaPracticaPrimerParcial
Aplicación de fragmentación horizontal, replicación, consulta distribuida con transparencia y una breve prueba de tolerancia a fallos. 
## Arquitectura

<img width="698" height="589" alt="image" src="https://github.com/user-attachments/assets/006dff2d-b0ae-42e9-b889-c40daf673c35" />

# Preparación para el entorno

Se define el archivo de configuración docker-compose.yml para levantar múltiples servicios de bases de datos

<img width="554" height="780" alt="image" src="https://github.com/user-attachments/assets/cc7d19f0-2004-4df3-8729-e8bfbb993935" />

Se establecen volúmenes locales de persistencia para asegurar que los datos de las bases de datos no se pierdan al detener o reiniciar los contenedores

<img width="634" height="134" alt="image" src="https://github.com/user-attachments/assets/91835d5d-bb98-41b7-bc24-aa7ce0a47c09" />

Se ejecuta el comando docker-compose up para construir y levantar las instancias de los nodos

<img width="921" height="158" alt="image" src="https://github.com/user-attachments/assets/4d0ccb68-6a0a-4ccc-8d7c-c92ef5da0384" />

Se verifica el estado de los servicios para confirmar que todos los nodos lógicos estén operativos y escuchando en los puertos definidos.

<img width="921" height="118" alt="image" src="https://github.com/user-attachments/assets/f6dc2e9b-c10a-4a51-ba7f-88f46cdd3ce3" />

Se establece la conexión con las herramientas de administración a cada una de las instancias/nodos.

<img width="437" height="189" alt="image" src="https://github.com/user-attachments/assets/bbb7babc-ce1d-4f56-89aa-c919f36a6265" />

# Scripts 

[01_schema.sql](sql/01_schema.sql)

[02_seed.sql](sql/02_seed.sql)

[03_fragmentacion.sql](sql/03_fragmentacion.sql)

[04_vista_global.sql](sql/04_vista_global.sql)

[05_replicacion.sql](sql/05_replicacion.sql)

# Fragmentos por Nodos


**Nodo A**

<img width="1280" height="605" alt="image" src="https://github.com/user-attachments/assets/2d4c7d22-14ff-448c-a464-4b419a256c58" />

**Nodo B**

<img width="1280" height="620" alt="image" src="https://github.com/user-attachments/assets/3abe1fa7-1f1e-4741-acde-69ac4659f590" />



# Vista Global

<img width="456" height="522" alt="image" src="https://github.com/user-attachments/assets/8133257a-5e66-4983-b1b3-ade629ab1d14" />

Transparencia de locaización y fragmentación

<img width="658" height="333" alt="image" src="https://github.com/user-attachments/assets/eda47481-b25e-4a29-be46-8996559309d7" />

# Consulta Distribuida

<img width="767" height="378" alt="image" src="https://github.com/user-attachments/assets/e9488d0c-9862-4273-b482-c164829a0ce3" />

Consulta Global con datos distribuidos

<img width="817" height="296" alt="image" src="https://github.com/user-attachments/assets/386e6fce-e1ff-4ab8-a4fc-1122c31eff84" />

# Replicación de Referencia 
Se realiza una Réplica Simple de todas las tablas hacia otro nodo (Nodo_C) para copiar todos los datos que están en el Nodo_A y Nodo_B y garantizar la disponibilidad de los datos.

**Preparación de Nodos**

Se realiza la configuración para tener un Servidor Enlazado Nodo_C al Nodo_A, lo cual permite que la instancia local (Nodo_A) de SQL Server pueda consultar y manipular datos que residen en una instancia remota (Nodo_C).

<img width="772" height="327" alt="image" src="https://github.com/user-attachments/assets/3c1f2f90-1b10-4063-954b-6939e75a3db2" />

De igual forma se configura un Servidor Enlazado Nodo_C al Nodo_B:

<img width="807" height="328" alt="image" src="https://github.com/user-attachments/assets/15ca6b6d-fa56-4405-b102-72a244740f77" />

**Creación de Base de datos que contendrá la replicación de datos en Nodo_C:**

El Nodo_C contendrá los datos de ambas instancias por lo que el modelado de la base que replicara los datos serán una unión de todos los nodos y esquemas:

<img width="610" height="577" alt="image" src="https://github.com/user-attachments/assets/cf0cb905-b495-4a8f-bb76-f5413674eb90" />

## Replicación Inicial

Se copia los datos iniciales del Nodo_A y Nodo_B hacia el Nodo_C para mantener la replicación consistente de todos los datos iniciales mediante la sentencia INSERT hacia el nodo remoto Nodo_C desde las tablas y esquemas locales.

<img width="652" height="453" alt="image" src="https://github.com/user-attachments/assets/e0a9cace-1a18-4e8f-a6a6-de91cbd11c22" />

Se ejecutó la misma lógica de inserción para trasladar los datos del Nodo_B hacia el Nodo_C. Esto asegura que el Nodo_C contenga una copia completa y consistente de todos los fragmentos del sistema distribuido antes de implementar los mecanismos de sincronización en tiempo real.

<img width="661" height="441" alt="image" src="https://github.com/user-attachments/assets/9be67625-fa9a-476f-af41-8e95c520d3c7" />

## Replicación de datos mediante gatillos

Se implementó un esquema de Replicación de Datos utilizando Triggers en las tablas. Esta estrategia asegura la sincronización inmediata de las operaciones de INSERT, UPDATE y DELETE entre el nodo primario Nodo_A o Nodo_B y el Nodo_C, mejorando la disponibilidad de los datos y permitiendo la distribución de la carga de lectura.

<img width="624" height="515" alt="image" src="https://github.com/user-attachments/assets/88fb0568-d5fc-4d04-8b94-ac1efa5521f9" />

<img width="777" height="635" alt="image" src="https://github.com/user-attachments/assets/fb06cf1d-6eb8-4676-b7ad-4d8c2cf0dd5b" />

## Verificación de replicación inmediata

Para la verificación se realizará una inserción de una Consulta en el Nodo_A

<img width="730" height="409" alt="image" src="https://github.com/user-attachments/assets/73550f28-dbb6-406e-a1de-06f4bb2d9705" />

Y se realiza una consulta en el Nodo_C para verificar la sincronización de datos:

<img width="485" height="209" alt="image" src="https://github.com/user-attachments/assets/0e96d6b5-4f86-4e0b-b7f0-949b0f335347" />

## Prueba de Fallo
Para probar la tolerancia a fallos y la transparencia de replicación/disponibilidad, se simuló la caída de uno de los nodos, ya que gracias a utilizar docker es fácil la Simulación de la caída de un NODO.

**Detener el servicio SQL del Nodo_A:**

<img width="792" height="423" alt="image" src="https://github.com/user-attachments/assets/ad069bf4-3d4c-4cde-9ad1-1e3a2b785d14" />

Las consultas globales usando el Nodo_C muestran los datos de los nodos que aún están activos y ya replicados:

<img width="754" height="446" alt="image" src="https://github.com/user-attachments/assets/ef995b89-5f9a-422b-8d00-d85a27d6ff13" />

Esto demuestra tolerancia a fallos ya que, aunque Nodo_A no esté disponible, los datos replicados en Nodo_C permiten continuar con lecturas.

## Procedimiento de recuperación

Como se puede ver antes de caída de Nodo_A se observa 15 registros de todos los datos del esquema Ambato:

<img width="756" height="357" alt="image" src="https://github.com/user-attachments/assets/abaa4e2d-ba74-4295-ae87-cccdcb7260e7" />

Luego de una inserción al esquema Backup_Ambato del Nodo_C:

<img width="649" height="195" alt="image" src="https://github.com/user-attachments/assets/5ff43086-cbcc-49a5-bf8b-ad18389cd7d0" />

Cuando el nodo a vuelva estar disponible ejecutamos el procedimiento de recuperación de datos que fueron modificados en el Nodo_C y mantenemos la sincronización de replicas cuando falla un Nodo o se pierde la conexión.

<img width="564" height="246" alt="image" src="https://github.com/user-attachments/assets/886723d0-de9d-456e-b2cd-cfe4324cf06e" />

Y como podemos observar los datos vuelven a estar disponibles en el Nodo_A:

<img width="886" height="426" alt="image" src="https://github.com/user-attachments/assets/3a154386-ea98-48cd-89dd-e924370ca94a" />

# Breve Reflexión 

El sistema logró una transparencia notable para el usuario final, quien consulta una vista global sin percibir la fragmentación por ciudad ni la localización en nodos físicos distintos. Sin embargo, esta transparencia se sustentó en una abstracción manual mediante vistas y servidores enlazados, lo que significa que el optimizador de consultas no gestiona autónomamente el movimiento de datos. Para mejorar, se implementaría un middleware especializado o clusters nativos de bases de datos distribuidas, que automatice el enrutamiento y optimización de consultas. Además, reemplazar los triggers por mecanismos de réplica nativos mejoraría la escalabilidad y consistencia, logrando una transparencia real a nivel del motor de base de datos.

