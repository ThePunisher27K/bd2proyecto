CREATE OR REPLACE PROCEDURE INSERTARUSUARIO(
  P_USUARIO V1_USUARIOS.US_USUARIO%TYPE,
  P_CORREO V1_USUARIOS.US_CORREO%TYPE,
  P_CONTRA V1_USUARIOS.US_CONTRA%TYPE,
  P_ESTADO V1_USUARIOS.US_ESTADO%TYPE,
  P_TIPOUS V1_USUARIOS.US_TIPOUS%TYPE
) AS
  V_DESICION NUMBER;
  V_SIGID    V1_USUARIOS.US_ID%TYPE;
BEGIN
 -- Verificar si el usuario o el correo ya existen
  SELECT
    COUNT(*) INTO V_DESICION
  FROM
    V1_USUARIOS
  WHERE
    US_USUARIO = P_USUARIO
    OR US_CORREO = P_CORREO;
  IF V_DESICION > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Error: Usuario o correo ya existen.');
  ELSE
 -- Inserción si no hay duplicados
    V_SIGID := SEQ_USUARIO.NEXTVAL;
    INSERT INTO V1_USUARIOS (
      US_ID,
      US_USUARIO,
      US_CORREO,
      US_CONTRA,
      US_FREG,
      US_ESTADO,
      US_TIPOUS
    ) VALUES (
      V_SIGID,
      P_USUARIO,
      P_CORREO,
      P_CONTRA,
      SYSDATE,
      P_ESTADO,
      P_TIPOUS
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Usuario insertado correctamente.');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: '
                         || SQLCODE
                         || ' - '
                         || SQLERRM);
    ROLLBACK;
END INSERTARUSUARIO;
/

CREATE OR REPLACE PROCEDURE INOACDATACT(
  P_USID IN V1_USUARIOS.US_ID%TYPE,
  P_TIPID IN V1_TIPODATACTOR.TP_DID%TYPE,
  P_VDATO IN V1_DATACTORES.DAS_VDATO%TYPE
) AS
  V_DESICION NUMBER;
  V_EXISU    NUMBER;
  V_EXISTD   NUMBER;
  V_SIGID    V1_DATACTORES.DAS_DID%TYPE;
BEGIN
  SELECT
    COUNT(*) INTO V_EXISU
  FROM
    V1_USUARIOS
  WHERE
    US_ID = P_USID
    AND US_TIPOUS = 1;
  IF V_EXISU > 0 THEN
    SELECT
      COUNT(*) INTO V_EXISTD
    FROM
      V1_TIPODATACTOR
    WHERE
      TP_DID = P_TIPID;
    IF V_EXISTD > 0 THEN
 -- Verificar si el dato ya existe para el actor y el tipo de dato
      SELECT
        COUNT(*) INTO V_DESICION
      FROM
        V1_DATACTORES
      WHERE
        DAS_UID = P_USID
        AND DAS_TPDID = P_TIPID;
 -- Si el dato existe, actualizar
      IF V_DESICION > 0 THEN
        UPDATE V1_DATACTORES
        SET
          DAS_VDATO = P_VDATO
        WHERE
          DAS_UID = P_USID
          AND DAS_TPDID = P_TIPID;
        DBMS_OUTPUT.PUT_LINE('Dato actualizado correctamente');
      ELSE
        V_SIGID := SEQ_DACTORES.NEXTVAL;
 -- Si el dato no existe, insertar
        INSERT INTO V1_DATACTORES (
          DAS_DID,
          DAS_UID,
          DAS_TPDID,
          DAS_VDATO
        ) VALUES (
          V_SIGID,
          P_USID,
          P_TIPID,
          P_VDATO
        );
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
    DBMS_OUTPUT.PUT_LINE('Error: '
                         || SQLCODE
                         || ' - '
                         || SQLERRM);
    ROLLBACK;
END INOACDATACT;
/

CREATE OR REPLACE PROCEDURE INSERTARPROY(
  P_USID V1_PROY.PRO_CAID%TYPE,
  P_TITULO V1_PROY.PRO_TITULO%TYPE,
  P_CANTACTORES V1_PROY.PRO_CANTACTORES%TYPE,
  P_DESC V1_PROY.PRO_DESC%TYPE,
  P_FECHAIN V1_PROY.PRO_FECHAIN%TYPE,
  P_FECHAFI V1_PROY.PRO_FECHAFI%TYPE
) AS
  V_EXISU NUMBER;
  V_SIGID V1_PROY.PRO_ID%TYPE;
BEGIN
  SELECT
    COUNT(*) INTO V_EXISU
  FROM
    V1_USUARIOS
  WHERE
    US_ID = P_USID
    AND US_TIPOUS = 2;
  IF V_EXISU > 0 THEN
 -- Obtener el siguiente valor de la secuencia para pro_id
    V_SIGID := SEQ_PROYECTO.NEXTVAL;
 -- Insertar datos en la tabla Proyectos
    INSERT INTO V1_PROY (
      PRO_ID,
      PRO_CAID,
      PRO_TITULO,
      PRO_CANTACTORES,
      PRO_DESC,
      PRO_FECHACR,
      PRO_FECHAIN,
      PRO_FECHAFI
    ) VALUES (
      V_SIGID,
      P_USID,
      P_TITULO,
      P_CANTACTORES,
      P_DESC,
      SYSDATE,
      P_FECHAIN,
      P_FECHAFI
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Datos del proyecto insertados correctamente.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('El usuario no existe O tipo de usuario incorrecto');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: '
                         || SQLCODE
                         || ' - '
                         || SQLERRM);
    ROLLBACK;
END INSERTARPROY;
/

CREATE OR REPLACE PROCEDURE INICIARSESION(
  P_USUARIO V1_USUARIOS.US_CORREO%TYPE,
  P_CONTRA V1_USUARIOS.US_CONTRA%TYPE
) AS
  V_DESICION NUMBER;
BEGIN
 -- Verificar si el usuario y la contraseña coinciden
  SELECT
    COUNT(*) INTO V_DESICION
  FROM
    V1_USUARIOS
  WHERE
    (US_USUARIO = P_USUARIO
    OR US_CORREO = P_USUARIO)
    AND US_CONTRA = P_CONTRA;
  IF V_DESICION > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Inicio de sesión exitoso. Bienvenido');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Error: Usuario o contraseña incorrectos.');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: '
                         || SQLCODE
                         || ' - '
                         || SQLERRM);
END INICIARSESION;
/

CREATE OR REPLACE PROCEDURE GENERARPDF AS
  CURSOR USUARIOS_CURSOR IS
  SELECT
    U.US_ID      USC_ID,
    U.US_USUARIO USC_USUARIO
  FROM
    V1_DATACTORES D
    JOIN V1_USUARIOS U
    ON D.DAS_UID = U.US_ID
  WHERE
    D.DAS_TPDID = 23
    AND D.DAS_VDATO = 'No generado' FOR UPDATE;
  V_VDAT1 V1_DATACTORES.DAS_VDATO%TYPE;
  V_VDAT2 V1_DATACTORES.DAS_VDATO%TYPE;
  V_VDAT3 V1_DATACTORES.DAS_VDATO%TYPE;
  V_VDAT4 V1_DATACTORES.DAS_VDATO%TYPE;
  V_VDAT5 V1_DATACTORES.DAS_VDATO%TYPE;
BEGIN
  FOR ITERACION IN USUARIOS_CURSOR LOOP
    V_VDAT1:=CONDATO(ITERACION.USC_ID, 1);
    V_VDAT2:=CONDATO(ITERACION.USC_ID, 2);
    V_VDAT3:=CONDATO(ITERACION.USC_ID, 3);
    V_VDAT4:=CONDATO(ITERACION.USC_ID, 4);
    V_VDAT5:=CONDATO(ITERACION.USC_ID, 5);
    IF(V_VDAT1 != 0
    AND V_VDAT2 != 0
    AND V_VDAT3 != 0
    AND V_VDAT4 != 0
    AND V_VDAT5 != 0) THEN
      DBMS_OUTPUT.PUT_LINE('PDF Generado para el usuario, '
                           || ITERACION.USC_USUARIO);
      UPDATE V1_DATACTORES
      SET
        DAS_VDATO = 'Generado'
      WHERE
        DAS_UID = ITERACION.USC_ID
        AND DAS_TPDID = 23;
    ELSE
      DBMS_OUTPUT.PUT_LINE('Informacion Faltante para el usuario, '
                           || ITERACION.USC_USUARIO);
    END IF;
  END LOOP;

  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: '
                         || SQLCODE
                         || ' - '
                         || SQLERRM);
    ROLLBACK;
END GENERARPDF;
/