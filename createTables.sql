CREATE TABLE v1_TipoUsuarios (
  tipu_uid NUMBER PRIMARY KEY,
  tipu_nombre VARCHAR2(50)
);

CREATE TABLE v1_Usuarios (
  us_id NUMBER PRIMARY KEY,
  us_usuario VARCHAR2(100),
  us_correo VARCHAR2(120),
  us_contra VARCHAR2(100),
  us_freg DATE,
  us_estado VARCHAR2(20),
  us_tipous NUMBER 
);

ALTER TABLE v1_Usuarios
ADD CONSTRAINT uq_usuario UNIQUE (us_usuario);
ALTER TABLE v1_Usuarios
ADD CONSTRAINT uq_correo UNIQUE (us_correo);

ALTER TABLE v1_Usuarios
ADD CONSTRAINT fk_tipous
FOREIGN KEY (us_tipous) 
REFERENCES v1_TipoUsuarios(tipu_uid);


CREATE SEQUENCE seq_usuario START WITH 1 INCREMENT BY 1;

CREATE TABLE v1_TipoDatActor (
  tp_did NUMBER PRIMARY KEY,
  tp_nombre VARCHAR2(50)
);


CREATE TABLE v1_DatActores (
  das_did NUMBER PRIMARY KEY,
  das_uid NUMBER ,
  das_tpdid NUMBER ,
  das_vdato VARCHAR2(255)
);
ALTER TABLE v1_DatActores
ADD CONSTRAINT fk_dasusid
FOREIGN KEY (das_uid) 
REFERENCES v1_Usuarios(us_id);

ALTER TABLE v1_DatActores
ADD CONSTRAINT fk_dastipoda
FOREIGN KEY (das_tpdid) 
REFERENCES v1_TipoDatActor(tp_did);

CREATE SEQUENCE seq_dactores START WITH 1 INCREMENT BY 1;


CREATE TABLE v1_Proy (
 pro_id NUMBER PRIMARY KEY,
 pro_caid NUMBER ,
 pro_titulo VARCHAR2(255),
 pro_cantActores NUMBER,
 pro_desc VARCHAR2(1000),
 pro_fechacr DATE,
 pro_fechain DATE,
 pro_fechafi DATE
);

ALTER TABLE v1_Proy
ADD CONSTRAINT fk_procaid
FOREIGN KEY (pro_caid) 
REFERENCES v1_Usuarios(us_id);

CREATE SEQUENCE seq_proyecto START WITH 1 INCREMENT BY 1;

CREATE TABLE v1_Pro_Sele (
  ps_id NUMBER PRIMARY KEY,
  ps_proid NUMBER,
  ps_actid NUMBER,
  ps_fechasel DATE
);

ALTER TABLE v1_Pro_Sele
ADD CONSTRAINT fk_psproid
FOREIGN KEY (ps_proid) 
REFERENCES v1_Proy(pro_id);

ALTER TABLE v1_Pro_Sele
ADD CONSTRAINT fk_psacid
FOREIGN KEY (ps_actid) 
REFERENCES v1_Usuarios(us_id);

CREATE SEQUENCE seq_prosel START WITH 1 INCREMENT BY 1;

CREATE TABLE v1_Aud_Proye (
  aup_id NUMBER PRIMARY KEY,
  aup_pro_id NUMBER,
  aup_pro_titulo VARCHAR2(255),
  aup_pro_CantActores NUMBER,
  aup_fechacr DATE,
  aup_fechain DATE,
  aup_fechafi DATE
);

ALTER TABLE v1_Aud_Proye
ADD CONSTRAINT fk_aupproid
FOREIGN KEY (aup_pro_id) 
REFERENCES v1_Proy(pro_id);


CREATE TABLE v1_Aud_DatoActor (
  audac_id NUMBER PRIMARY KEY,
  audac_uid NUMBER,
  audac_tpdid NUMBER,
  audac_vdato VARCHAR2(255)
);

ALTER TABLE v1_Aud_DatoActor
ADD CONSTRAINT fk_audacuid
FOREIGN KEY (audac_uid) 
REFERENCES v1_Usuarios(us_id);

ALTER TABLE v1_Aud_DatoActor
ADD CONSTRAINT fk_audactpid
FOREIGN KEY (audac_tpdid)  
REFERENCES v1_TipoDatActor(tp_did);