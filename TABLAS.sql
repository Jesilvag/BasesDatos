CREATE TABLE Actividades
  (
    idActividad                  INTEGER NOT NULL ,
    num_horas                    INTEGER NOT NULL ,
    contratos_idContrato         INTEGER NOT NULL ,
    tipo_contrato_idTipoContrato INTEGER NOT NULL
  ) ;
ALTER TABLE Actividades ADD CONSTRAINT Actividades_PK PRIMARY KEY ( idActividad ) ;
ALTER TABLE Actividades ADD CONSTRAINT ActividadesTipoContrato__UN UNIQUE ( tipo_contrato_idTipoContrato ) ;


CREATE TABLE MATRICULAS
  (
    idMatricula  INTEGER NOT NULL ,
    idEstudiante INTEGER NOT NULL ,
    fecha_pago   DATE NOT NULL ,
    fecha_limite DATE NOT NULL ,
    tipo         VARCHAR2 (10 CHAR) NOT NULL ,
    valor        NUMBER NOT NULL
  ) ;
ALTER TABLE MATRICULAS ADD CONSTRAINT MATRICULAS_PK PRIMARY KEY ( idMatricula ) ;


CREATE TABLE Prerrequisitos
  (
    idPrerrequisito INTEGER NOT NULL ,
    materia         INTEGER NOT NULL ,
    semestre        INTEGER NOT NULL
  ) ;
ALTER TABLE Prerrequisitos ADD CONSTRAINT Prerrequisitos_PK PRIMARY KEY ( idPrerrequisito ) ;


CREATE TABLE REGISTRO_MATERIAS
  (
    idCurso                  INTEGER NOT NULL ,
    estudiantes_idEstudiante INTEGER NOT NULL ,
    fecha_registro           DATE NOT NULL ,
    estado                   CHAR (1) DEFAULT '0'
  ) ;
ALTER TABLE REGISTRO_MATERIAS ADD CONSTRAINT REGISTRO_MATERIAS_PK PRIMARY KEY ( idCurso ) ;


CREATE TABLE USV
  (
    idUniversidad INTEGER NOT NULL ,
    nombre        VARCHAR2 (25 CHAR)
  ) ;
ALTER TABLE USV ADD CONSTRAINT USV_PK PRIMARY KEY ( idUniversidad ) ;


CREATE TABLE asistencia
  (
    idAsistencia             INTEGER NOT NULL ,
    asistio                  CHAR (1) DEFAULT '1' NOT NULL ,
    sesion_clase_idSesion    INTEGER NOT NULL ,
    estudiantes_idEstudiante INTEGER NOT NULL
  ) ;
ALTER TABLE asistencia ADD CONSTRAINT asistencia_PK PRIMARY KEY ( idAsistencia ) ;


CREATE TABLE aulas
  (
    idAula                INTEGER NOT NULL ,
    capacidad             INTEGER NOT NULL ,
    facultades_idFacultad INTEGER NOT NULL ,
    descripcion           VARCHAR2 (40 CHAR)
  ) ;
ALTER TABLE aulas ADD CONSTRAINT aulas_PK PRIMARY KEY ( idAula ) ;


CREATE TABLE cancelaciones
  (
    idCancelacion             INTEGER NOT NULL ,
    fecha_cancelacion         DATE ,
    estudiantes_idEstudiante  INTEGER NOT NULL ,
    registro_curso_idRegCurso INTEGER NOT NULL
  ) ;
ALTER TABLE cancelaciones ADD CONSTRAINT cancelaciones_PK PRIMARY KEY ( idCancelacion ) ;


CREATE TABLE contratos
  (
    idContrato           INTEGER NOT NULL ,
    docentes_docentes_ID INTEGER NOT NULL ,
    num_contrato         VARCHAR2 (20 CHAR) NOT NULL ,
    tipo                 VARCHAR2 (30 CHAR) NOT NULL ,
    sueldo               NUMBER NOT NULL
  ) ;
ALTER TABLE contratos ADD CONSTRAINT contratos_PK PRIMARY KEY ( idContrato ) ;


CREATE TABLE cursos
  (
    idCurso              INTEGER NOT NULL ,
    periodo              INTEGER NOT NULL ,
    docentes_docentes_ID INTEGER NOT NULL ,
    materias_idMateria   INTEGER NOT NULL ,
    anio_curso           VARCHAR2 (7 CHAR) NOT NULL
  ) ;
ALTER TABLE cursos ADD CONSTRAINT cursos_PK PRIMARY KEY ( idCurso ) ;


CREATE TABLE descripcion_actividad
  (
    idDescripcion           INTEGER NOT NULL ,
    Actividades_idActividad INTEGER NOT NULL
  ) ;
ALTER TABLE descripcion_actividad ADD CONSTRAINT descripcion_actividad_PK PRIMARY KEY ( idDescripcion ) ;


CREATE TABLE dias
  (
    idDia INTEGER NOT NULL ,
    dia   VARCHAR2 (10 CHAR) NOT NULL
  ) ;
ALTER TABLE dias ADD CONSTRAINT dias_PK PRIMARY KEY ( idDia ) ;


CREATE TABLE docentes
  (
    docentes_ID INTEGER CONSTRAINT NNC_docentes_idDocente NOT NULL ,
    nombres     VARCHAR2 (30 CHAR) CONSTRAINT NNC_docentes_nombres NOT NULL ,
    apellidos   VARCHAR2 (30 CHAR) CONSTRAINT NNC_docentes_apellidos NOT NULL ,
    cedula      VARCHAR2 (12 CHAR) CONSTRAINT NNC_docentes_cedula NOT NULL ,
    email       VARCHAR2 (20 CHAR) CONSTRAINT NNC_docentes_email NOT NULL ,
    telefono    VARCHAR2 (15 CHAR) CONSTRAINT NNC_docentes_telefono NOT NULL
  ) ;
CREATE INDEX docentes__IDX ON docentes
  ( apellidos ASC
  ) ;
ALTER TABLE docentes ADD CONSTRAINT docentes_PK PRIMARY KEY ( docentes_ID ) ;


CREATE TABLE elementos_Audiovisuales
  (
    idElemento            INTEGER NOT NULL ,
    facultades_idFacultad INTEGER NOT NULL ,
    nombre_elemento       VARCHAR2 (50 CHAR) NOT NULL
  ) ;
ALTER TABLE elementos_Audiovisuales ADD CONSTRAINT elementos_Audiovisuales_PK PRIMARY KEY ( idElemento ) ;


CREATE TABLE elementos_reservas
  (
    idReserva            INTEGER NOT NULL ,
    reservas_idReserva   INTEGER NOT NULL ,
    elementos_idElemento INTEGER NOT NULL
  ) ;
ALTER TABLE elementos_reservas ADD CONSTRAINT elementos_reservas_PK PRIMARY KEY ( idReserva ) ;


CREATE TABLE estudiante_calificacion
  (
    idCalificacion              INTEGER NOT NULL ,
    evaluaciones_idCalificacion INTEGER NOT NULL ,
    nota                        NUMBER NOT NULL ,
    estCurso_idEstCurso         INTEGER NOT NULL
  ) ;
ALTER TABLE estudiante_calificacion ADD CONSTRAINT est_calificacion_PK PRIMARY KEY ( idCalificacion ) ;


CREATE TABLE estudiante_curso
  (
    idEstudiatesCurso        INTEGER NOT NULL ,
    estudiantes_idEstudiante INTEGER NOT NULL ,
    cursos_idCurso           INTEGER NOT NULL
  ) ;
ALTER TABLE estudiante_curso ADD CONSTRAINT estudiante_curso_PK PRIMARY KEY ( idEstudiatesCurso ) ;


CREATE TABLE estudiantes
  (
    idEstudiante         INTEGER NOT NULL ,
    programas_idPrograma INTEGER NOT NULL ,
    estado               CHAR (1) DEFAULT '1' NOT NULL ,
    fechaNacimiento      DATE NOT NULL ,
    Nombres              VARCHAR2 (50 CHAR) NOT NULL ,
    apellidos            VARCHAR2 (50 CHAR) NOT NULL ,
    doc_identidad        VARCHAR2 (20 CHAR) NOT NULL ,
    correo               VARCHAR2 (50 CHAR) NOT NULL ,
    direccion            VARCHAR2 (20 CHAR) NOT NULL ,
    telefono             VARCHAR2 (25 CHAR)
  ) ;
ALTER TABLE estudiantes ADD CONSTRAINT estudiantes_PK PRIMARY KEY ( idEstudiante ) ;


CREATE TABLE evaluaciones
  (
    idCalificacion              INTEGER NOT NULL ,
    porcentaje                  NUMBER NOT NULL ,
    fecha_entrega               DATE NOT NULL ,
    cursos_idCurso              INTEGER NOT NULL ,
    evaluaciones_idCalificacion INTEGER ,
    descripcion                 VARCHAR2 (40 CHAR)
  ) ;
ALTER TABLE evaluaciones ADD CONSTRAINT calificaciones_PK PRIMARY KEY ( idCalificacion ) ;


CREATE TABLE facultades
  (
    idFacultad        INTEGER NOT NULL ,
    USV_idUniversidad INTEGER NOT NULL ,
    nombreFacultad    INTEGER NOT NULL
  ) ;
ALTER TABLE facultades ADD CONSTRAINT facultades_PK PRIMARY KEY ( idFacultad ) ;


CREATE TABLE fechas_pago
  (
    idFecha                        INTEGER NOT NULL ,
    fecha_pago                     DATE NOT NULL ,
    matricula_creditos_idMatricula INTEGER NOT NULL ,
    fecha_limite                   DATE NOT NULL ,
    monto                          INTEGER
  ) ;
ALTER TABLE fechas_pago ADD CONSTRAINT fechas_pago_PK PRIMARY KEY ( idFecha ) ;


CREATE TABLE horario_dia
  (
    id                 INTEGER NOT NULL ,
    horarios_idHorario INTEGER NOT NULL ,
    dias_idDia         INTEGER NOT NULL
  ) ;
ALTER TABLE horario_dia ADD CONSTRAINT horario_dia_PK PRIMARY KEY ( id ) ;


CREATE TABLE horarios
  (
    idHorario      INTEGER NOT NULL ,
    cursos_idCurso INTEGER NOT NULL ,
    aulas_idAula   INTEGER NOT NULL ,
    hora_inicio    VARCHAR2 (15 CHAR) NOT NULL ,
    hora_final     VARCHAR2 (15 CHAR) NOT NULL
  ) ;
ALTER TABLE horarios ADD CONSTRAINT horarios_PK PRIMARY KEY ( idHorario ) ;


CREATE TABLE mallas_curriculares
  (
    idMallla             INTEGER NOT NULL ,
    programas_idPrograma INTEGER NOT NULL
  ) ;
ALTER TABLE mallas_curriculares ADD CONSTRAINT mallas_curriculares_PK PRIMARY KEY ( idMallla ) ;


CREATE TABLE materias
  (
    idMateria            INTEGER NOT NULL ,
    semestres_idSemestre INTEGER NOT NULL ,
    intensidadHoraria    INTEGER NOT NULL ,
    creditos             INTEGER NOT NULL ,
    carta_Descriptiva    VARCHAR2 (100 CHAR)
  ) ;
ALTER TABLE materias ADD CONSTRAINT materias_PK PRIMARY KEY ( idMateria ) ;


CREATE TABLE matricula_creditos
  (
    idMatricula           INTEGER NOT NULL ,
    num_cuotas            INTEGER NOT NULL ,
    Matricula_IdMatricula INTEGER NOT NULL
  ) ;
ALTER TABLE matricula_creditos ADD CONSTRAINT matricula_creditos_PK PRIMARY KEY ( idMatricula ) ;
ALTER TABLE matricula_creditos ADD CONSTRAINT matricula_creditos__UN UNIQUE ( Matricula_IdMatricula ) ;


CREATE TABLE programas
  (
    idPrograma            INTEGER NOT NULL ,
    facultades_idFacultad INTEGER NOT NULL ,
    nombrePrograma        VARCHAR2 (50 CHAR) NOT NULL
  ) ;
ALTER TABLE programas ADD CONSTRAINT programas_PK PRIMARY KEY ( idPrograma ) ;


CREATE TABLE registro_curso
  (
    idRegCurso      INTEGER NOT NULL ,
    cursos_idCurso  INTEGER NOT NULL ,
    REG_MATERIAS_ID INTEGER NOT NULL
  ) ;
ALTER TABLE registro_curso ADD CONSTRAINT registro_curso_PK PRIMARY KEY ( idRegCurso ) ;


CREATE TABLE reservas
  (
    idReserva            INTEGER NOT NULL ,
    fecha_reserva        DATE NOT NULL ,
    docentes_docentes_ID INTEGER NOT NULL ,
    estado               CHAR (1) DEFAULT '0' NOT NULL
  ) ;
ALTER TABLE reservas ADD CONSTRAINT reserva_PK PRIMARY KEY ( idReserva ) ;


CREATE TABLE semestres
  (
    idSemestre                   INTEGER NOT NULL ,
    mallas_curriculares_idMallla INTEGER NOT NULL ,
    numSemestre                  INTEGER NOT NULL
  ) ;
ALTER TABLE semestres ADD CONSTRAINT semestres_PK PRIMARY KEY ( idSemestre ) ;


CREATE TABLE sesion_clase
  (
    idSesion       INTEGER NOT NULL ,
    fecha_sesion   DATE NOT NULL ,
    cursos_idCurso INTEGER NOT NULL
  ) ;
ALTER TABLE sesion_clase ADD CONSTRAINT sesion_clase_PK PRIMARY KEY ( idSesion ) ;


CREATE TABLE tipo_contrato
  (
    idTipoContrato INTEGER NOT NULL ,
    Descripcion    VARCHAR2 (20 CHAR) NOT NULL
  ) ;
ALTER TABLE tipo_contrato ADD CONSTRAINT tipo_contrato_PK PRIMARY KEY ( idTipoContrato ) ;


ALTER TABLE Actividades ADD CONSTRAINT Actividades_contratos_FK FOREIGN KEY ( contratos_idContrato ) REFERENCES contratos ( idContrato ) ;

ALTER TABLE Actividades ADD CONSTRAINT Actividades_tipo_contrato_FK FOREIGN KEY ( tipo_contrato_idTipoContrato ) REFERENCES tipo_contrato ( idTipoContrato ) ;

ALTER TABLE MATRICULAS ADD CONSTRAINT MATRICULAS_estudiantes_FK FOREIGN KEY ( idEstudiante ) REFERENCES estudiantes ( idEstudiante ) ;

ALTER TABLE Prerrequisitos ADD CONSTRAINT Prerrequisitos_semestres_FK FOREIGN KEY ( semestre ) REFERENCES semestres ( idSemestre ) ;

ALTER TABLE Prerrequisitos ADD CONSTRAINT Prerrequisitos_semestres_FKv1 FOREIGN KEY ( materia ) REFERENCES semestres ( idSemestre ) ;

ALTER TABLE REGISTRO_MATERIAS ADD CONSTRAINT REG_MATERIAS_estudiantes_FK FOREIGN KEY ( estudiantes_idEstudiante ) REFERENCES estudiantes ( idEstudiante ) ;

ALTER TABLE asistencia ADD CONSTRAINT asistencia_estudiantes_FK FOREIGN KEY ( estudiantes_idEstudiante ) REFERENCES estudiantes ( idEstudiante ) ;

ALTER TABLE asistencia ADD CONSTRAINT asistencia_sesion_clase_FK FOREIGN KEY ( sesion_clase_idSesion ) REFERENCES sesion_clase ( idSesion ) ;

ALTER TABLE aulas ADD CONSTRAINT aulas_facultades_FK FOREIGN KEY ( facultades_idFacultad ) REFERENCES facultades ( idFacultad ) ;

ALTER TABLE cancelaciones ADD CONSTRAINT cancelacion_reg_curso_FK FOREIGN KEY ( registro_curso_idRegCurso ) REFERENCES registro_curso ( idRegCurso ) ;

ALTER TABLE cancelaciones ADD CONSTRAINT cancelaciones_estudiantes_FK FOREIGN KEY ( estudiantes_idEstudiante ) REFERENCES estudiantes ( idEstudiante ) ;

ALTER TABLE contratos ADD CONSTRAINT contratos_docentes_FK FOREIGN KEY ( docentes_docentes_ID ) REFERENCES docentes ( docentes_ID ) ;

ALTER TABLE cursos ADD CONSTRAINT cursos_docentes_FK FOREIGN KEY ( docentes_docentes_ID ) REFERENCES docentes ( docentes_ID ) ;

ALTER TABLE cursos ADD CONSTRAINT cursos_materias_FK FOREIGN KEY ( materias_idMateria ) REFERENCES materias ( idMateria ) ;

ALTER TABLE descripcion_actividad ADD CONSTRAINT descActividad_Actividades_FK FOREIGN KEY ( Actividades_idActividad ) REFERENCES Actividades ( idActividad ) ;

ALTER TABLE elementos_reservas ADD CONSTRAINT elemReservas_elemAudioV_FK FOREIGN KEY ( elementos_idElemento ) REFERENCES elementos_Audiovisuales ( idElemento ) ;

ALTER TABLE elementos_Audiovisuales ADD CONSTRAINT elem_Audio_facultades_FK FOREIGN KEY ( facultades_idFacultad ) REFERENCES facultades ( idFacultad ) ;

ALTER TABLE elementos_reservas ADD CONSTRAINT elementos_reservas_reservas_FK FOREIGN KEY ( reservas_idReserva ) REFERENCES reservas ( idReserva ) ;

ALTER TABLE estudiante_calificacion ADD CONSTRAINT est_cal_est_curso_FK FOREIGN KEY ( estCurso_idEstCurso ) REFERENCES estudiante_curso ( idEstudiatesCurso ) ;

ALTER TABLE estudiante_calificacion ADD CONSTRAINT est_cal_evaluaciones_FK FOREIGN KEY ( evaluaciones_idCalificacion ) REFERENCES evaluaciones ( idCalificacion ) ;

ALTER TABLE estudiante_curso ADD CONSTRAINT est_curso_cursos_FK FOREIGN KEY ( cursos_idCurso ) REFERENCES cursos ( idCurso ) ;

ALTER TABLE estudiante_curso ADD CONSTRAINT est_curso_estudiantes_FK FOREIGN KEY ( estudiantes_idEstudiante ) REFERENCES estudiantes ( idEstudiante ) ;

ALTER TABLE estudiantes ADD CONSTRAINT estudiantes_programas_FK FOREIGN KEY ( programas_idPrograma ) REFERENCES programas ( idPrograma ) ;

ALTER TABLE evaluaciones ADD CONSTRAINT evaluaciones_cursos_FK FOREIGN KEY ( cursos_idCurso ) REFERENCES cursos ( idCurso ) ;

ALTER TABLE evaluaciones ADD CONSTRAINT evaluaciones_evaluaciones_FK FOREIGN KEY ( evaluaciones_idCalificacion ) REFERENCES evaluaciones ( idCalificacion ) ;

ALTER TABLE facultades ADD CONSTRAINT facultades_USV_FK FOREIGN KEY ( USV_idUniversidad ) REFERENCES USV ( idUniversidad ) ;

ALTER TABLE fechas_pago ADD CONSTRAINT fechasPago_matricula_cred_FK FOREIGN KEY ( matricula_creditos_idMatricula ) REFERENCES matricula_creditos ( idMatricula ) ;

ALTER TABLE horario_dia ADD CONSTRAINT horario_dia_dias_FK FOREIGN KEY ( dias_idDia ) REFERENCES dias ( idDia ) ;

ALTER TABLE horario_dia ADD CONSTRAINT horario_dia_horarios_FK FOREIGN KEY ( horarios_idHorario ) REFERENCES horarios ( idHorario ) ;

ALTER TABLE horarios ADD CONSTRAINT horarios_aulas_FK FOREIGN KEY ( aulas_idAula ) REFERENCES aulas ( idAula ) ;

ALTER TABLE horarios ADD CONSTRAINT horarios_cursos_FK FOREIGN KEY ( cursos_idCurso ) REFERENCES cursos ( idCurso ) ;

ALTER TABLE semestres ADD CONSTRAINT mallas_curriculares_FK FOREIGN KEY ( mallas_curriculares_idMallla ) REFERENCES mallas_curriculares ( idMallla ) ;

ALTER TABLE mallas_curriculares ADD CONSTRAINT mallas_programas_FK FOREIGN KEY ( programas_idPrograma ) REFERENCES programas ( idPrograma ) ;

ALTER TABLE materias ADD CONSTRAINT materias_semestres_FK FOREIGN KEY ( semestres_idSemestre ) REFERENCES semestres ( idSemestre ) ;

ALTER TABLE matricula_creditos ADD CONSTRAINT matriCredi_matri_FK FOREIGN KEY ( Matricula_IdMatricula ) REFERENCES MATRICULAS ( idMatricula ) ;

ALTER TABLE programas ADD CONSTRAINT programas_facultades_FK FOREIGN KEY ( facultades_idFacultad ) REFERENCES facultades ( idFacultad ) ;

ALTER TABLE registro_curso ADD CONSTRAINT registro_curso_cursos_FK FOREIGN KEY ( cursos_idCurso ) REFERENCES cursos ( idCurso ) ;

ALTER TABLE registro_curso ADD CONSTRAINT registro_curso_regMat_FK FOREIGN KEY ( REG_MATERIAS_ID ) REFERENCES REGISTRO_MATERIAS ( idCurso ) ;

ALTER TABLE reservas ADD CONSTRAINT reservas_docentes_FK FOREIGN KEY ( docentes_docentes_ID ) REFERENCES docentes ( docentes_ID ) ;

ALTER TABLE sesion_clase ADD CONSTRAINT sesion_clase_cursos_FK FOREIGN KEY ( cursos_idCurso ) REFERENCES cursos ( idCurso ) ;

CREATE OR REPLACE VIEW LISTADO_CURSO  AS
SELECT estudiantes.Nombres,
  estudiantes.apellidos,
  estudiantes.doc_identidad
FROM estudiantes
INNER JOIN estudiante_curso
ON estudiantes.idEstudiante = estudiante_curso.estudiantes_idEstudiante 
;





CREATE SEQUENCE Actividades_idActividad_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER Actividades_idActividad_TRG BEFORE
  INSERT ON Actividades FOR EACH ROW WHEN (NEW.idActividad IS NULL) BEGIN :NEW.idActividad := Actividades_idActividad_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MATRICULAS_idMatricula_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MATRICULAS_idMatricula_TRG BEFORE
  INSERT ON MATRICULAS FOR EACH ROW WHEN (NEW.idMatricula IS NULL) BEGIN :NEW.idMatricula := MATRICULAS_idMatricula_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE Prerrequisitos_idPrerrequisito START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER Prerrequisitos_idPrerrequisito BEFORE
  INSERT ON Prerrequisitos FOR EACH ROW WHEN (NEW.idPrerrequisito IS NULL) BEGIN :NEW.idPrerrequisito := Prerrequisitos_idPrerrequisito.NEXTVAL;
END;
/

CREATE SEQUENCE REGISTRO_MATERIAS_idCurso_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER REGISTRO_MATERIAS_idCurso_TRG BEFORE
  INSERT ON REGISTRO_MATERIAS FOR EACH ROW WHEN (NEW.idCurso IS NULL) BEGIN :NEW.idCurso := REGISTRO_MATERIAS_idCurso_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE USV_idUniversidad_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER USV_idUniversidad_TRG BEFORE
  INSERT ON USV FOR EACH ROW WHEN (NEW.idUniversidad IS NULL) BEGIN :NEW.idUniversidad := USV_idUniversidad_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE asistencia_idAsistencia_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER asistencia_idAsistencia_TRG BEFORE
  INSERT ON asistencia FOR EACH ROW WHEN (NEW.idAsistencia IS NULL) BEGIN :NEW.idAsistencia := asistencia_idAsistencia_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE aulas_idAula_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER aulas_idAula_TRG BEFORE
  INSERT ON aulas FOR EACH ROW WHEN (NEW.idAula IS NULL) BEGIN :NEW.idAula := aulas_idAula_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE cancelaciones_idCancelacion START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER cancelaciones_idCancelacion BEFORE
  INSERT ON cancelaciones FOR EACH ROW WHEN (NEW.idCancelacion IS NULL) BEGIN :NEW.idCancelacion := cancelaciones_idCancelacion.NEXTVAL;
END;
/

CREATE SEQUENCE contratos_idContrato_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER contratos_idContrato_TRG BEFORE
  INSERT ON contratos FOR EACH ROW WHEN (NEW.idContrato IS NULL) BEGIN :NEW.idContrato := contratos_idContrato_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE cursos_idCurso_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER cursos_idCurso_TRG BEFORE
  INSERT ON cursos FOR EACH ROW WHEN (NEW.idCurso IS NULL) BEGIN :NEW.idCurso := cursos_idCurso_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE descripcion_actividad_idDescri START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER descripcion_actividad_idDescri BEFORE
  INSERT ON descripcion_actividad FOR EACH ROW WHEN (NEW.idDescripcion IS NULL) BEGIN :NEW.idDescripcion := descripcion_actividad_idDescri.NEXTVAL;
END;
/

CREATE SEQUENCE dias_idDia_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER dias_idDia_TRG BEFORE
  INSERT ON dias FOR EACH ROW WHEN (NEW.idDia IS NULL) BEGIN :NEW.idDia := dias_idDia_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE docentes_docentes_ID_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER docentes_docentes_ID_TRG BEFORE
  INSERT ON docentes FOR EACH ROW WHEN (NEW.docentes_ID IS NULL) BEGIN :NEW.docentes_ID := docentes_docentes_ID_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE elementos_Audiovisuales_idElem START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER elementos_Audiovisuales_idElem BEFORE
  INSERT ON elementos_Audiovisuales FOR EACH ROW WHEN (NEW.idElemento IS NULL) BEGIN :NEW.idElemento := elementos_Audiovisuales_idElem.NEXTVAL;
END;
/

CREATE SEQUENCE elementos_reservas_idReserva START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER elementos_reservas_idReserva BEFORE
  INSERT ON elementos_reservas FOR EACH ROW WHEN (NEW.idReserva IS NULL) BEGIN :NEW.idReserva := elementos_reservas_idReserva.NEXTVAL;
END;
/

CREATE SEQUENCE estudiante_calificacion_idCali START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER estudiante_calificacion_idCali BEFORE
  INSERT ON estudiante_calificacion FOR EACH ROW WHEN (NEW.idCalificacion IS NULL) BEGIN :NEW.idCalificacion := estudiante_calificacion_idCali.NEXTVAL;
END;
/

CREATE SEQUENCE estudiante_curso_idEstudiatesC START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER estudiante_curso_idEstudiatesC BEFORE
  INSERT ON estudiante_curso FOR EACH ROW WHEN (NEW.idEstudiatesCurso IS NULL) BEGIN :NEW.idEstudiatesCurso := estudiante_curso_idEstudiatesC.NEXTVAL;
END;
/

CREATE SEQUENCE estudiantes_idEstudiante_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER estudiantes_idEstudiante_TRG BEFORE
  INSERT ON estudiantes FOR EACH ROW WHEN (NEW.idEstudiante IS NULL) BEGIN :NEW.idEstudiante := estudiantes_idEstudiante_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE evaluaciones_idCalificacion START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER evaluaciones_idCalificacion BEFORE
  INSERT ON evaluaciones FOR EACH ROW WHEN (NEW.idCalificacion IS NULL) BEGIN :NEW.idCalificacion := evaluaciones_idCalificacion.NEXTVAL;
END;
/

CREATE SEQUENCE facultades_idFacultad_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER facultades_idFacultad_TRG BEFORE
  INSERT ON facultades FOR EACH ROW WHEN (NEW.idFacultad IS NULL) BEGIN :NEW.idFacultad := facultades_idFacultad_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE fechas_pago_idFecha_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER fechas_pago_idFecha_TRG BEFORE
  INSERT ON fechas_pago FOR EACH ROW WHEN (NEW.idFecha IS NULL) BEGIN :NEW.idFecha := fechas_pago_idFecha_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE horario_dia_id_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER horario_dia_id_TRG BEFORE
  INSERT ON horario_dia FOR EACH ROW WHEN (NEW.id IS NULL) BEGIN :NEW.id := horario_dia_id_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE horarios_idHorario_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER horarios_idHorario_TRG BEFORE
  INSERT ON horarios FOR EACH ROW WHEN (NEW.idHorario IS NULL) BEGIN :NEW.idHorario := horarios_idHorario_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE mallas_curriculares_idMallla START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER mallas_curriculares_idMallla BEFORE
  INSERT ON mallas_curriculares FOR EACH ROW WHEN (NEW.idMallla IS NULL) BEGIN :NEW.idMallla := mallas_curriculares_idMallla.NEXTVAL;
END;
/

CREATE SEQUENCE materias_idMateria_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER materias_idMateria_TRG BEFORE
  INSERT ON materias FOR EACH ROW WHEN (NEW.idMateria IS NULL) BEGIN :NEW.idMateria := materias_idMateria_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE matricula_creditos_idMatricula START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER matricula_creditos_idMatricula BEFORE
  INSERT ON matricula_creditos FOR EACH ROW WHEN (NEW.idMatricula IS NULL) BEGIN :NEW.idMatricula := matricula_creditos_idMatricula.NEXTVAL;
END;
/

CREATE SEQUENCE programas_idPrograma_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER programas_idPrograma_TRG BEFORE
  INSERT ON programas FOR EACH ROW WHEN (NEW.idPrograma IS NULL) BEGIN :NEW.idPrograma := programas_idPrograma_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE registro_curso_idRegCurso_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER registro_curso_idRegCurso_TRG BEFORE
  INSERT ON registro_curso FOR EACH ROW WHEN (NEW.idRegCurso IS NULL) BEGIN :NEW.idRegCurso := registro_curso_idRegCurso_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE reservas_idReserva_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER reservas_idReserva_TRG BEFORE
  INSERT ON reservas FOR EACH ROW WHEN (NEW.idReserva IS NULL) BEGIN :NEW.idReserva := reservas_idReserva_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE semestres_idSemestre_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER semestres_idSemestre_TRG BEFORE
  INSERT ON semestres FOR EACH ROW WHEN (NEW.idSemestre IS NULL) BEGIN :NEW.idSemestre := semestres_idSemestre_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE sesion_clase_idSesion_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER sesion_clase_idSesion_TRG BEFORE
  INSERT ON sesion_clase FOR EACH ROW WHEN (NEW.idSesion IS NULL) BEGIN :NEW.idSesion := sesion_clase_idSesion_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE tipo_contrato_idTipoContrato START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER tipo_contrato_idTipoContrato BEFORE
  INSERT ON tipo_contrato FOR EACH ROW WHEN (NEW.idTipoContrato IS NULL) BEGIN :NEW.idTipoContrato := tipo_contrato_idTipoContrato.NEXTVAL;
END;
/





