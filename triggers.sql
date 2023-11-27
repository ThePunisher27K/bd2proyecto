CREATE OR REPLACE TRIGGER Del_Upd_Datactores
AFTER UPDATE OR DELETE ON v1_DatActores
FOR EACH ROW
DECLARE
  v_action VARCHAR2(10);
BEGIN
  IF UPDATING THEN
    v_action := 'UPDATE';
  ELSIF DELETING THEN
    v_action := 'DELETE';
  END IF;

  INSERT INTO v1_Aud_DatoActor (audac_id, audac_uid, audac_tpdid, audac_vdato,audac_fecha)
  VALUES (seq_aud_datoactor.NEXTVAL, :OLD.das_uid, :OLD.das_tpdid, :OLD.das_vdato,SYSDATE);

END Del_Upd_Datactores;
/
