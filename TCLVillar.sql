#SENTENCIAS DEL SUBLENGUAJE TCL
use lifegame;
SELECT * FROM usuario;
SELECT @@autocommit;
#Para trabajar con transacciones, debemos desactivar esta variable, por eso la igualamos a 0
set @@autocommit = 0;
SELECT @@autocommit;
#Inserto valor que despues vamos a eliminar
INSERT INTO usuario (id_usuario, nombre, documento, birthdate, id_pais, direccion, mail, telefono) VALUES (4,'Cristina',28689544,'1969-08-15',1,'Zapican 435','crislescanocaceres@hotmail.com',098983468);

#Transaccion para eliminar un usuario
START TRANSACTION;
delete from usuario
where 
	id_usuario = 4;
SELECT * FROM usuario;
#rollback;
#commit;

#Transaccion donde agregamos valores, y separamos por Savepoint, para posteriormente eliminar el segundo savepoint 
select * from pais;
start transaction;
INSERT INTO pais (id_pais, nombre) 
values  (17,'Canada'),
		(18,'El Salvador'),
		(19,'Paraguay'),
		(20,'Peru');
savepoint America;
Insert into pais 
values	(21,'Dinamarca'),
		(22,'Inglaterra'),
        (23,'Alemania'),
        (24,'España');
savepoint Europa;
#release savepoint America;
#commit
