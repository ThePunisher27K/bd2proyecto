CREATE TABLE TipoUsuarios (
  tipu_uid NUMBER PRIMARY KEY,
  tipu_nombre VARCHAR2(50)
);

CREATE TABLE Usuarios (
  us_id NUMBER PRIMARY KEY,
  us_usuario VARCHAR2(100),
  us_correo VARCHAR2(120),
  us_contra VARCHAR2(100),
  us_freg DATE,
  us_estado VARCHAR2(20),
  us_tipous NUMBER REFERENCES TipoUsuarios(tipu_uid)
);
ALTER TABLE Usuarios
ADD CONSTRAINT uq_usuario UNIQUE (us_usuario);
ALTER TABLE Usuarios
ADD CONSTRAINT uq_correo UNIQUE (us_correo);

ALTER TABLE Usuarios
ADD CONSTRAINT fk_tipous
FOREIGN KEY (us_tipous) 
REFERENCES TipoUsuarios(tipu_uid);


CREATE SEQUENCE seq_usuario START WITH 1 INCREMENT BY 1;

CREATE TABLE TipoDatActor (
  tp_did NUMBER PRIMARY KEY,
  tp_nombre VARCHAR2(50)
);


CREATE TABLE DatActores (
  das_did NUMBER PRIMARY KEY,
  das_uid NUMBER ,
  das_tpdid NUMBER ,
  das_vdato VARCHAR2(255)
);
ALTER TABLE DatActores
ADD CONSTRAINT fk_dasusid
FOREIGN KEY (das_uid) 
REFERENCES Usuarios(us_id);

ALTER TABLE DatActores
ADD CONSTRAINT fk_dastipoda
FOREIGN KEY (das_tpdid) 
REFERENCES TipoDatActor(tp_did);

CREATE SEQUENCE seq_dactores START WITH 1 INCREMENT BY 1;


CREATE TABLE Proy (
 pro_id NUMBER PRIMARY KEY,
 pro_caid NUMBER ,
 pro_titulo VARCHAR2(255),
 pro_cantActores NUMBER,
 pro_desc VARCHAR2(1000),
 pro_fechacr DATE,
 pro_fechain DATE,
 pro_fechafi DATE
);


ALTER TABLE Proy
ADD CONSTRAINT fk_procaid
FOREIGN KEY (pro_caid) 
REFERENCES Usuarios(us_id);

CREATE SEQUENCE seq_proyecto START WITH 1 INCREMENT BY 1;

CREATE TABLE Pro_Sele (
  ps_id NUMBER PRIMARY KEY,
  ps_proid NUMBER,
  ps_actid NUMBER,
  ps_fechasel DATE
);

ALTER TABLE Pro_Sele
ADD CONSTRAINT fk_psproid
FOREIGN KEY (ps_proid) 
REFERENCES Proy(pro_id);

ALTER TABLE Pro_Sele
ADD CONSTRAINT fk_psacid
FOREIGN KEY (ps_actid) 
REFERENCES Usuarios(us_id);

CREATE SEQUENCE seq_prosel START WITH 1 INCREMENT BY 1;

CREATE TABLE Aud_Proye (
  aup_id NUMBER PRIMARY KEY,
  aup_pro_id NUMBER,
  aup_pro_titulo VARCHAR2(255),
  aup_pro_CantActores NUMBER,
  aup_fechacr DATE,
  aup_fechain DATE,
  aup_fechafi DATE
);

ALTER TABLE Aud_Proye
ADD CONSTRAINT fk_aupproid
FOREIGN KEY (aup_pro_id) 
REFERENCES Proy(pro_id);


CREATE TABLE Aud_DatoActor (
  audac_id NUMBER PRIMARY KEY,
  audac_uid NUMBER,
  audac_tpdid NUMBER REFERENCES TipoDatoActor(tp_did),
  audac_vdato VARCHAR2(255)
);

ALTER TABLE Aud_DatoActor
ADD CONSTRAINT fk_audacuid
FOREIGN KEY (audac_uid) 
REFERENCES Usuarios(us_id);

ALTER TABLE Aud_DatoActor
ADD CONSTRAINT fk_audactpid
FOREIGN KEY (audac_tpdid)  
REFERENCES TipoUsuarios(tipu_uid);