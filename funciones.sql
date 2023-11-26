CREATE OR REPLACE FUNCTION condato(
  p_us_id IN v1_Usuarios.us_id%TYPE,
  p_tpd_id IN v1_TipoDatActor.tp_did%TYPE
) 
RETURN v1_DatActores.das_vdato%TYPE 
AS
  v_dato v1_DatActores.das_vdato%TYPE;
BEGIN

  SELECT das_vdato
  INTO v_dato
  FROM v1_DatActores
  WHERE das_uid = p_us_id AND das_tpdid = p_tpd_id;

  RETURN v_dato;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
  WHEN OTHERS THEN
    RETURN 0;
END condato;
/
