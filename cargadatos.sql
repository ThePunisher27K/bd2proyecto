INSERT INTO v1_TipoUsuarios (tipu_uid, tipu_nombre) VALUES (1, 'Actor');
INSERT INTO v1_TipoUsuarios (tipu_uid, tipu_nombre) VALUES (2, 'Caster');


INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (1, 'Cedula');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (2, 'Nombre Artistico');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (3, 'Nacionalidad');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (4, 'Genero');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (5, 'Fecha de Nacimiento');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (6, 'Etnia');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (7, 'Pais');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (8, 'Telefono 1');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (9, 'Telefono 2');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (10, 'Telefono 3');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (11, 'Whatsapp');

INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (12, 'Discapacidad');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (13, 'Permiso de trabajo');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (14, 'Altura');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (15, 'Peso');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (16, 'Cintura');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (17, 'Talla de camisa');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (18, 'Talla de Pantalon');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (19, 'Talla de zapatos');

INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (20, 'Formacion');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (21, 'Profesion');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (22, 'Idiomas');
INSERT INTO v1_TipoDatActor (tp_did, tp_nombre) VALUES (23, 'Pdf');

-- Llamar al procedimiento con valores de ejemplo
BEGIN
  InsertarUsuario('NuevoUsuario','nuevo@correo.com','Contraseña123','Activo',1);
    InsertarUsuario('Fernando777','fer@correo.com','Contraseña123','Activo',1);
      InsertarUsuario('Ivanb124','ivan@correo.com','Contraseña123','Activo',1);
        InsertarUsuario('Susan2511','susa@correo.com','Contraseña123','Activo',1);
          InsertarUsuario('AnuelAA','anuelaa@correo.com','Contraseña123','Activo',1);
END;
/
BEGIN
  InsertarUsuario('CAS11','CAS4311@correo.com','Conña123','Activo',2);
    InsertarUsuario('FerCAST777','feCASTr@correo.com','ContSAS455','Activo',2);
      InsertarUsuario('LUISAICAST124','LUISA@correo.com','ContSS67S','Activo',2);

END;
/


BEGIN
  --INSERTARPROY(6,'Comercial Cocacola','comercial navideno de cocacola en el salvador',TO_DATE('2023-01-19', 'YYYY-MM-DD'),TO_DATE('2023-01-27', 'YYYY-MM-DD'));
  --INSERTARPROY(7,'Telenovela','telenovela , comedia romantica ',TO_DATE('2023-04-19', 'YYYY-MM-DD'),TO_DATE('2023-10-27', 'YYYY-MM-DD'));
  --INSERTARPROY(8,'Comercial Pepsi','comercial navideno de pepsi en panama',TO_DATE('2023-01-19', 'YYYY-MM-DD'),TO_DATE('2023-01-27', 'YYYY-MM-DD'));
  INSERTARPROY(8,'Comercial Samsun','comercial navideno de samsung en panama',TO_DATE('2023-01-19', 'YYYY-MM-DD'),TO_DATE('2023-01-27', 'YYYY-MM-DD'));
END;
/

BEGIN
  InoAcDatAct(1, 1,'8-999-9999');
  InoAcDatAct(1, 2,'Anonimous');
  InoAcDatAct(1, 3,'Chiricano');
  InoAcDatAct(1, 4,'No-Binario');
  InoAcDatAct(1, 5,'25-11-2000');
  InoAcDatAct(1, 6,'Afro-americano');
  InoAcDatAct(1, 7,'Panama');
  InoAcDatAct(1, 5,'25-11-2000');
END;
/


BEGIN

  InoAcDatAct(1, 3,'Chiricano');

END;
/


BEGIN
  IniciarSesion('Ivanb124', 'Contraseña123');
END;
/
BEGIN
  InoAcDatAct(1, 23,'No generado');
  InoAcDatAct(2, 23,'No generado');
  InoAcDatAct(3, 23,'No generado');
  InoAcDatAct(4, 23,'No generado');
  InoAcDatAct(5, 23,'No generado');

END;
/


BEGIN
  ASIGNARPROYECTO(4, 2); 
END;
/

BEGIN
  Mod_Pro(5,'GRABACIONES');
END;
/



BEGIN
  GenerarPDF();
END;
/

SET SERVEROUTPUT ON;


