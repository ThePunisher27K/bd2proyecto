select * from v1_TipoUsuarios;
SELECT * from v1_TipoDatActor;
SELECT * from v1_Aud_DatoActor;
SELECT * from V1_AUD_PROYE;
SELECT * from v1_Usuarios;
SELECT * from v1_DatActores;
SELECT * from V1_PROY;
SELECT * FROM V1_PRO_SELE;



CREATE USER bd2user IDENTIFIED BY 123456 DEFAULT TABLESPACE BD2 TEMPORARY TABLESPACE TEMP QUOTA UNLIMITED ON BD2;
create tablespace BD2 datafile 'C:\app\Inventario\product\21c\oradata\XE\XEPDB1\BD201.DBF' size 100M autoextend on;
GRANT ALL PRIVILEGES TO bd2user;

drop table Pro_Sele;