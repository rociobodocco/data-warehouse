# DATA WAREHOUSE

# Pasos para instalación

1- Descargar desde el repositorio de GitHub detallado abajo.
		https://github.com/deisbalm/DataWarehouse
	
2- Es necesario tener un servidor de base de datos MySQL, como puede ser XAMPP.

3- El archivo "dwh.sql" contiene todo lo necesario para crear la base de datos, tablas, relaciones y algunos datos precargados necesarios para su uso.Se encuentra localizado dentro de la carpeta Back.

4- Ejecutar el comando npm install - con el se instalan las siguientes dependencias,en "package.json":
  - express
  - jsonwebtoken
  - mysql2
  - nodemon
  - sequilize

5- El archivo "server.js" posee la confifiguracion del servidor el cual correra por el puerto 3500. El archivo "connection.js" posee la configuracion de sequelize y la ruta a donde se alojara la BD que se genere con la informacion del archivo SQL

6- Ejecutar el comando nodemon back/server.js

7- Verificar que el servidor indique en la consola que se ha inicializado en el puerto 3500 y se ha conectado en la base de datos.

8- El servidor ya se encuentra disponible para ser utilizado!

9- El archivo raiz del proyecto es index.html desde alli se debe comenzar las pruebas. 

10- Para loguearse se proveen 2 usuarios para utilizar el sistema:

 * Perfil: Administrador
	* email: rocio.bodocco@gmail.com
 	* password: roxbf1234
 
 
 * Perfil: Usuario normal
 	* usuario: Anon@user.com
 	* password: 1234

