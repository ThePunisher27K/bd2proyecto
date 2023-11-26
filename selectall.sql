select * from TipoUsuarios ;
SELECT * from TipoDatActor ;
SELECT * from Usuarios;
SELECT * from DatosActores;



CREATE USER bd2user IDENTIFIED BY 123456 DEFAULT TABLESPACE BD2 TEMPORARY TABLESPACE TEMP QUOTA UNLIMITED ON BD2;
create tablespace BD2 datafile 'C:\app\Inventario\product\21c\oradata\XE\XEPDB1\BD201.DBF' size 100M autoextend on;
GRANT ALL PRIVILEGES TO bd2user;

drop table Pro_Sele;