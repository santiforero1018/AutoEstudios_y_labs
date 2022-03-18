--- TABLAS
CREATE TABLE musician(m_no INTEGER NOT NULL,
m_name VARCHAR(20) NOT NULL, born DATE NOT NULL, died DATE,
born_in INTEGER NOT NULL,living_in INTEGER NOT NULL);

CREATE TABLE performer(perf_no INTEGER NOT NULL, perf_is INTEGER NOT NULL, 
instrument VARCHAR(10), 
perf_type VARCHAR(10) NOT NULL);

CREATE TABLE plays_in(player INTEGER NOT NULL, band_id INTEGER NOT NULL);

CREATE TABLE band(band_no INTEGER NOT NULL, band_name VARCHAR(10) NOT NULL,
band_home INTEGER NOT NULL, band_type VARCHAR(10) NOT NULL, b_date DATE NOT NULL,
band_contact INTEGER NOT NULL);

CREATE TABLE place(place_no INTEGER NOT NULL, place_town VARCHAR(20) NOT NULL,
place_country VARCHAR(20) NOT NULL);

CREATE TABLE composer(comp_no INTEGER NOT NULL, comp_is INTEGER NOT NULL,
comp_type VARCHAR(10));

CREATE TABLE has_composed(cmpr_no INTEGER NOT NULL, cmpn_no INTEGER NOT NULL);

CREATE TABLE composition(c_no INTEGER NOT NULL, comp_date DATE NOT NULL, 
c_title VARCHAR(40) NOT NULL, c_in INTEGER NOT NULL);

CREATE TABLE concert(concert_no INTEGER NOT NULL, concert_venue VARCHAR(20), concert_in INTEGER NOT NULL, con_date DATE NOT NULL,
concert_orgniser INTEGER NOT NULL);

CREATE TABLE Performances(pfrmnc_no INTEGER NOT NULL, gave INTEGER NOT NULL, performed INTEGER NOT NULL,
conducted_by INTEGER NOT NULL, performed_in INTEGER NOT NULL);
-- Adicionar las restricciones declarativas a la base de datos (Atributos, Primarias, Únicas, Foraneas) 

ALTER TABLE musician ADD CONSTRAINT PK_musician 
    PRIMARY KEY(m_no);
    
ALTER TABLE performer ADD CONSTRAINT PK_performer
    PRIMARY KEY(perf_no);

ALTER TABLE band ADD CONSTRAINT PK_band
    PRIMARY KEY(band_no);

ALTER TABLE place ADD CONSTRAINT PK_place
    PRIMARY KEY(place_no);
    
ALTER TABLE composer ADD CONSTRAINT PK_composer
    PRIMARY KEY(comp_no);

ALTER TABLE composition ADD CONSTRAINT PK_composition
    PRIMARY KEY(c_no);

ALTER TABLE has_composed ADD CONSTRAINT PK_has_composed
    PRIMARY KEY(cmpr_no, cmpn_no);

ALTER TABLE concert ADD CONSTRAINT PK_CONCERT
    PRIMARY KEY(concert_no);

ALTER TABLE Performances ADD CONSTRAINT PK_PERFORMANCE
    PRIMARY KEY(pfrmnc_no);
    
--FORANEAS 

ALTER TABLE musician ADD CONSTRAINT FK_musician_place
    FOREIGN KEY(born_in) REFERENCES place(place_no);

ALTER TABLE musician ADD CONSTRAINT FK2_musician_place
    FOREIGN KEY(living_in) REFERENCES place(place_no);

ALTER TABLE performer ADD CONSTRAINT FK_performer_musician
    FOREIGN KEY(perf_is) REFERENCES musician(m_no);

ALTER TABLE band ADD CONSTRAINT FK_band_musician
    FOREIGN KEY(band_contact) REFERENCES musician(m_no);

ALTER TABLE composer ADD CONSTRAINT FK_composer_musician
    FOREIGN KEY(comp_is) REFERENCES musician(m_no);

ALTER TABLE composition ADD CONSTRAINT FK_composition_place
    FOREIGN KEY(c_in) REFERENCES place(place_no);

ALTER TABLE band ADD CONSTRAINT FK_band_place
    FOREIGN KEY(band_home) REFERENCES place(place_no);
    
ALTER TABLE plays_in ADD CONSTRAINT FK_plays_in_band
    FOREIGN KEY(band_id) REFERENCES band(band_no);
    
ALTER TABLE has_composed ADD CONSTRAINT FK_has_composed_composer
    FOREIGN KEY(cmpr_no) REFERENCES composer(comp_no);

ALTER TABLE plays_in ADD CONSTRAINT FK_plays_in_performer
    FOREIGN KEY(player) REFERENCES performer(perf_no);

ALTER TABLE has_composed ADD CONSTRAINT FK_has_composed_composition
    FOREIGN KEY(cmpn_no) REFERENCES composition(c_no);

ALTER TABLE concert ADD CONSTRAINT FK_concert_place
    FOREIGN KEY(concert_in) REFERENCES place(place_no);

ALTER TABLE concert ADD CONSTRAINT FK_concert_musician
    FOREIGN KEY(concert_orgniser) REFERENCES musician(m_no);

ALTER TABLE Performances ADD CONSTRAINT FK_performances_musician
    FOREIGN KEY(conducted_by) REFERENCES musician(m_no);

ALTER TABLE Performances ADD CONSTRAINT FK_Performances_concert
    FOREIGN KEY(performed_in) REFERENCES concert(concert_no);

-- UNIQUE 

ALTER TABLE musician ADD CONSTRAINT UK_musician
    UNIQUE (m_name, born, died);
    
ALTER TABLE band ADD CONSTRAINT UK_band
    UNIQUE (band_name);
    
ALTER TABLE place ADD CONSTRAINT UK_place
    UNIQUE (place_town, place_country);
    
ALTER TABLE composition ADD CONSTRAINT UK_composition
    UNIQUE (c_title);

--- Atributos

ALTER TABLE band ADD CONSTRAINT CK_BAND_BAND_TYPE
    CHECK(REGEXP_LIKE(band_type, '^[[:alpha:]]{10}'));

ALTER TABLE band ADD CONSTRAINT CK_BAND_BAND_NAME
    CHECK(REGEXP_LIKE(band_name, '^[[:alpha:]]{1,20}'));

--- Acciones
ALTER TABLE musician DROP CONSTRAINT FK_musician_place;
ALTER TABLE musician DROP CONSTRAINT FK2_musician_place;
ALTER TABLE performer DROP CONSTRAINT FK_performer_musician;
ALTER TABLE band DROP CONSTRAINT FK_band_musician;
ALTER TABLE composer DROP CONSTRAINT FK_composer_musician;
ALTER TABLE composition DROP CONSTRAINT FK_composition_place;
ALTER TABLE band DROP CONSTRAINT FK_band_place;
ALTER TABLE plays_in DROP CONSTRAINT FK_plays_in_band;
ALTER TABLE has_composed DROP CONSTRAINT FK_has_composed_composer;
ALTER TABLE plays_in DROP CONSTRAINT FK_plays_in_performer;
ALTER TABLE has_composed DROP CONSTRAINT FK_has_composed_composition;
ALTER TABLE concert DROP CONSTRAINT FK_concert_place;
ALTER TABLE concert DROP CONSTRAINT FK_concert_musician;
ALTER TABLE performances DROP CONSTRAINT FK_performances_musician;
ALTER TABLE performances DROP CONSTRAINT FK_Performances_concert;

ALTER TABLE musician ADD CONSTRAINT FK_musician_place
    FOREIGN KEY(born_in) REFERENCES place(place_no) ON DELETE CASCADE;

ALTER TABLE musician ADD CONSTRAINT FK2_musician_place
    FOREIGN KEY(living_in) REFERENCES place(place_no) ON DELETE CASCADE;

ALTER TABLE performer ADD CONSTRAINT FK_performer_musician
    FOREIGN KEY(perf_is) REFERENCES musician(m_no) ON DELETE CASCADE;

ALTER TABLE band ADD CONSTRAINT FK_band_musician
    FOREIGN KEY(band_contact) REFERENCES musician(m_no) ON DELETE CASCADE;

ALTER TABLE composer ADD CONSTRAINT FK_composer_musician
    FOREIGN KEY(comp_is) REFERENCES musician(m_no) ON DELETE CASCADE;

ALTER TABLE composition ADD CONSTRAINT FK_composition_place
    FOREIGN KEY(c_in) REFERENCES place(place_no) ON DELETE CASCADE;

ALTER TABLE band ADD CONSTRAINT FK_band_place
    FOREIGN KEY(band_home) REFERENCES place(place_no) ON DELETE CASCADE;
    
ALTER TABLE plays_in ADD CONSTRAINT FK_plays_in_band
    FOREIGN KEY(band_id) REFERENCES band(band_no) ON DELETE CASCADE;
    
ALTER TABLE has_composed ADD CONSTRAINT FK_has_composed_composer
    FOREIGN KEY(cmpr_no) REFERENCES composer(comp_no) ON DELETE CASCADE;

ALTER TABLE plays_in ADD CONSTRAINT FK_plays_in_performer
    FOREIGN KEY(player) REFERENCES performer(perf_no) ON DELETE CASCADE;

ALTER TABLE has_composed ADD CONSTRAINT FK_has_composed_composition
    FOREIGN KEY(cmpn_no) REFERENCES composition(c_no) ON DELETE CASCADE;

ALTER TABLE concert ADD CONSTRAINT FK_concert_place
    FOREIGN KEY(concert_in) REFERENCES place(place_no) ON DELETE CASCADE;

ALTER TABLE concert ADD CONSTRAINT FK_concert_musician
    FOREIGN KEY(concert_orgniser) REFERENCES musician(m_no) ON DELETE CASCADE;

ALTER TABLE Performances ADD CONSTRAINT FK_performances_musician
    FOREIGN KEY(conducted_by) REFERENCES musician(m_no) ON DELETE CASCADE;

ALTER TABLE Performances ADD CONSTRAINT FK_Performances_concert
    FOREIGN KEY(performed_in) REFERENCES concert(concert_no) ON DELETE CASCADE;


--Poblar la base de datos con los datos iniciales (PoblarOK) Automaticen la generación de las instrucciones INSERT. Dejen en el archivo las consultas correspondientes en comentarios.
INSERT INTO place (place_no, place_town, place_country)
  VALUES (1,'Quibdo','Colombia');

INSERT INTO musician (m_no, m_name, born, died, born_in, living_in)
    VALUES (1,'ricardo','01/11/1980','',1,1);

insert into band (band_name, band_home, band_type, b_date, band_contact)
  values ('LOL',1, 'salsaOOOOO', '01/12/2220', '1');

---Disparadores
CREATE TRIGGER TriggernumerationBand
BEFORE INSERT ON band
FOR EACH ROW
DECLARE
noband INTEGER;
BEGIN
    SELECT COUNT(*)+1 INTO noband FROM band;
    :new.band_no := noband;
END TriggernumerationBand;

---Xdisparadores
DROP TRIGGER TriggernumerationBand;
DELETE FROM musician;
DELETE FROM place;
DELETE FROM band;
---XTablas
ALTER TABLE musician DROP CONSTRAINT FK_musician;
DROP TABLE musician;
DROP TABLE place;