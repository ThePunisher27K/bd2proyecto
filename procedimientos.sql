CREATE OR REPLACE PROCEDURE InsertarUsuario(
  p_usuario v1_Usuarios.us_usuario%TYPE,
  p_correo v1_Usuarios.us_correo%TYPE,
  p_contra v1_Usuarios.us_contra%TYPE,
  p_estado v1_Usuarios.us_estado%TYPE,
  p_tipous v1_Usuarios.us_tipous%TYPE
) AS
  v_desicion NUMBER;
  v_sigid v1_Usuarios.us_id%TYPE;
BEGIN

  -- Verificar si el usuario o el correo ya existen
  SELECT COUNT(*)
  INTO v_desicion
  FROM v1_Usuarios
  WHERE us_usuario = p_usuario OR us_correo = p_correo;

  IF v_desicion > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Error: Usuario o correo ya existen.');
  ELSE
    -- Inserción si no hay duplicados
    v_sigid := seq_usuario.NEXTVAL;
    INSERT INTO v1_Usuarios (us_id, us_usuario, us_correo, us_contra, us_freg, us_estado, us_tipous)
    VALUES (v_sigid, p_usuario, p_correo, p_contra, SYSDATE, p_estado, p_tipous);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Usuario insertado correctamente.');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLCODE || ' - ' || SQLERRM);
    ROLLBACK;
END InsertarUsuario;
/


CREATE OR REPLACE PROCEDURE InoAcDatAct(
    p_usid IN v1_Usuarios.us_id%TYPE,
    p_tipid IN v1_TipoDatActor.tp_did%TYPE,
    p_vdato IN v1_DatActores.das_vdato%TYPE
)
AS
v_desicion NUMBER;
v_exisu NUMBER;
v_existd NUMBER;
  v_sigid v1_DatActores.das_did%TYPE;
BEGIN
SELECT COUNT(*)
  INTO v_exisu
  FROM v1_Usuarios
  WHERE us_id = p_usid and us_tipous = 1;

IF v_exisu > 0 THEN
SELECT COUNT(*)
  INTO v_existd
  FROM v1_TipoDatActor
  WHERE tp_did = p_tipid;

IF v_existd > 0 THEN
-- Verificar si el dato ya existe para el actor y el tipo de dato
SELECT COUNT(*)
  INTO v_desicion
  FROM v1_DatActores
  WHERE das_uid = p_usid AND das_tpdid = p_tipid;

    -- Si el dato existe, actualizar
   IF v_desicion > 0 THEN
        UPDATE v1_DatActores
        SET das_vdato = p_vdato
        WHERE das_uid = p_usid and das_tpdid = p_tipid;
            DBMS_OUTPUT.PUT_LINE('Dato actualizado correctamente');
    ELSE
    v_sigid := seq_dactores.NEXTVAL;
        -- Si el dato no existe, insertar
        INSERT INTO v1_DatActores (das_did,das_uid, das_tpdid, das_vdato)
        VALUES (v_sigid,p_usid,p_tipid,p_vdato);
            DBMS_OUTPUT.PUT_LINE('Dato insertado correctamente');
    END IF;
    ELSE
    DBMS_OUTPUT.PUT_LINE('El tipo de dato es invalido.');
    END IF;
    ELSE
    DBMS_OUTPUT.PUT_LINE('El usuario no existe o tipo de usuario incorrecto');
    END IF;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        -- Manejar errores aquí (puedes personalizar según tus necesidades)
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK;
END InoAcDatAct;
/



CREATE OR REPLACE PROCEDURE InsertarProy(
    p_usid v1_Proy.pro_caid%TYPE,
  p_titulo v1_Proy.pro_titulo%TYPE,
  p_cantActores v1_Proy.pro_cantActores%TYPE,
  p_desc v1_Proy.pro_desc%TYPE,
  p_fechain v1_Proy.pro_fechain%TYPE,
  p_fechafi v1_Proy.pro_fechafi%TYPE
  
) AS
v_exisu NUMBER;
  v_sigid v1_Proy.pro_id%TYPE;
BEGIN

SELECT COUNT(*)
  INTO v_exisu
  FROM v1_Usuarios
  WHERE us_id = p_usid and us_tipous = 2;

IF v_exisu > 0 THEN

  -- Obtener el siguiente valor de la secuencia para pro_id
 v_sigid := seq_proyecto.NEXTVAL;

  -- Insertar datos en la tabla Proyectos
  INSERT INTO v1_Proy (pro_id, pro_caid, pro_titulo, pro_cantActores, pro_desc, pro_fechacr, pro_fechain, pro_fechafi)
  VALUES (v_sigid, p_usid, p_titulo, p_cantActores, p_desc, SYSDATE, p_fechain, p_fechafi);

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Datos del proyecto insertados correctamente.');
  ELSE
      DBMS_OUTPUT.PUT_LINE('El usuario no existe O tipo de usuario incorrecto');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    -- Manejar errores aquí (puedes personalizar según tus necesidades)
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLCODE || ' - ' || SQLERRM);
    ROLLBACK;
END InsertarProy;
/


