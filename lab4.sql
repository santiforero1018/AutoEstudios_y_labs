
--- TABLAS
CREATE TABLE usuarios (id_usuario NUMBER(5) NOT NULL,
email VARCHAR(100)  NOT NULL, user_name VARCHAR(50) NOT NULL, createdAt DATE NOT NULL);

CREATE TABLE contenidos (id_contenido NUMBER(10) NOT NULL, id_exclusiveness INTEGER NOT NULL,
order_exc INTEGER, title VARCHAR(20) NOT NULL, publishingDate DATE NOT NULL, Cdescription VARCHAR(30));

CREATE TABLE likes (user_id NUMBER(5) NOT NULL, content_id NUMBER(10) NOT NULL );

CREATE TABLE videos (content_id NUMBER(10) NOT NULL, Vduration INTEGER NOT NULL);

CREATE TABLE eventos (content_id NUMBER(10) NOT NULL , plannedDate DATE  NOT NULL, actualDate DATE, duracion INTEGER); 

CREATE TABLE posts (content_id NUMBER(10) NOT NULL, ptext VARCHAR(50));

CREATE TABLE accounts (id_account NUMBER(5) NOT NULL, aname VARCHAR(70) NOT NULL, 
createdAt DATE NOT NULL, subscribers NUMBER(5) NOT NULL, id_user INTEGER NOT NULL);

CREATE TABLE exclusiveness (account_id NUMBER(5) NOT NULL,code VARCHAR(9) NOT NULL, eorder NUMBER(3) DEFAULT 0 NOT NULL, ename VARCHAR(50)NOT NULL,
price INTEGER, eduracion INTEGER NOT NULL);

CREATE TABLE subscriptions (id_subscriptor NUMBER(5) NOT NULL, createdAt DATE NOT NULL, account_id NUMBER(5) NOT NULL,
account_idTwo NUMBER(5) NOT NULL ,detail VARCHAR(50));

CREATE TABLE stages (id_subscription NUMBER(5) NOT NULL, id_stage NUMBER(5) NOT NULL, exc_id NUMBER(5) NOT NULL,
exc_order NUMBER(3) NOT NULL, startAt DATE NOT NULL, endAT DATE, price INTEGER NOT NULL, status CHAR);

CREATE TABLE lables (lorder NUMBER(3) NOT NULL, account_id NUMBER(5) NOT NULL, lable VARCHAR(10));

--- Primarias
ALTER TABLE usuarios ADD CONSTRAINT PK_usuarios
    PRIMARY KEY (id_usuario);

ALTER TABLE contenidos ADD CONSTRAINT PK_contenidos
    PRIMARY KEY (id_contenido);

ALTER TABLE likes ADD CONSTRAINT PK_likes
    PRIMARY KEY(user_id, content_id);

ALTER TABLE videos ADD CONSTRAINT PK_videos
    PRIMARY KEY(content_id);

ALTER TABLE eventos ADD CONSTRAINT PK_eventos
    PRIMARY KEY(content_id);
    
ALTER TABLE posts ADD CONSTRAINT PK_posts
    PRIMARY KEY(content_id);

ALTER TABLE accounts ADD CONSTRAINT PK_accounts
    PRIMARY KEY(id_account);
    
ALTER TABLE exclusiveness ADD CONSTRAINT PK_exclusiveness
    PRIMARY KEY(account_id, eorder);

ALTER TABLE subscriptions ADD CONSTRAINT PK_subscriptions
    PRIMARY KEY(id_Subscriptor);

ALTER TABLE stages ADD CONSTRAINT PK_stages
    PRIMARY KEY(id_subscription, id_stage);

ALTER TABLE lables ADD CONSTRAINT PK_lables
    PRIMARY KEY(lorder,account_id, lable);

--- Unicas
ALTER TABLE usuarios ADD CONSTRAINT uk_user
    UNIQUE (email);
    
--- foraneas
ALTER TABLE likes ADD CONSTRAINT FK_user_likes
FOREIGN KEY (user_id) REFERENCES usuarios(id_usuario);

ALTER TABLE likes ADD CONSTRAINT FK_content_likes
FOREIGN KEY (content_id) REFERENCES contenidos(id_contenido);

ALTER TABLE contenidos ADD CONSTRAINT FK_exclusiveness_contenidos
FOREIGN KEY (id_exclusiveness, order_exc) REFERENCES exclusiveness(account_id, eorder);

ALTER TABLE videos ADD CONSTRAINT FK_contenidos_videos
FOREIGN KEY (content_id) REFERENCES contenidos(id_contenido);

ALTER TABLE eventos ADD CONSTRAINT FK_contenidos_evententos
FOREIGN KEY (content_id) REFERENCES contenidos(id_contenido);

ALTER TABLE posts ADD CONSTRAINT FK_contenidos_posts
FOREIGN KEY (content_id) REFERENCES contenidos(id_contenido);

ALTER TABLE accounts ADD CONSTRAINT FK_usuarios_accounts
FOREIGN KEY (id_user) REFERENCES usuarios(id_usuario);

ALTER TABLE exclusiveness ADD CONSTRAINT FK_accounts_exclusiveness
FOREIGN KEY (account_id) REFERENCES accounts(id_account);

ALTER TABLE subscriptions ADD CONSTRAINT FK_accounts_subscritions
FOREIGN KEY (account_id) REFERENCES accounts(id_account);

ALTER TABLE subscriptions ADD CONSTRAINT FK2_accounts_subscritions
FOREIGN KEY (account_idTwo) REFERENCES accounts(id_account);

ALTER TABLE stages ADD CONSTRAINT FK_subscription_stages
FOREIGN KEY (id_subscription) REFERENCES subscriptions (id_subscriptor);

ALTER TABLE stages ADD CONSTRAINT FK_exclusiveness_stages
FOREIGN KEY (exc_id, exc_order) REFERENCES exclusiveness(account_id, eorder);

ALTER TABLE lables ADD CONSTRAINT FK_exclusiveness_lables 
FOREIGN KEY (lorder, account_id) REFERENCES exclusiveness(eorder,account_id);


--- PoblarOk
INSERT INTO usuarios(id_usuario, email, user_name, createdAt) VALUES(12345, 'juanydanni94@gmail.com', 'Juan', '20/09/2017');
INSERT INTO usuarios(id_usuario, email, user_name, createdAt) VALUES(24680, 'juanodanni44@gmail.com', 'daniel', '10/09/2017');
INSERT INTO usuarios(id_usuario, email, user_name, createdAt) VALUES(36912, 'santiago@gmail.com', 'santiago', '20/09/2017');

INSERT INTO accounts(id_account, aname, createdAt, subscribers, id_user) VALUES(67890, 'superGam', '09/03/2019', 400, 12345);
INSERT INTO accounts(id_account, aname, createdAt, subscribers, id_user) VALUES(23486, 'AlfGamer', '05/11/2020', 250, 24680);
INSERT INTO accounts(id_account, aname, createdAt, subscribers, id_user) VALUES(10203, 'METIRODELE', '11/04/2018', 10000, 36912);

INSERT INTO exclusiveness(account_id, code, eorder, ename, price, eduracion) VALUES (67890, 'EX-485765', 123, 'Premium Exc', 85000, 30);
INSERT INTO exclusiveness(account_id, code, eorder, ename, price, eduracion) VALUES (23486, 'EX-123456', 321, 'Medium Exc', 50000, 30);
INSERT INTO exclusiveness(account_id, code, eorder, ename, price, eduracion) VALUES (10203, 'EX-654321', 213, 'Basic Exc', 35000, 30);

INSERT INTO subscriptions(id_subscriptor, createdAt, account_id) VALUES (01234, '10/06/2019', 67890);
INSERT INTO subscriptions(id_subscriptor, createdAt, account_id) VALUES (56789, '30/09/2021', 23486);
INSERT INTO subscriptions(id_subscriptor, createdAt, account_id) VALUES (10112, '10/06/2019', 10203);

INSERT INTO contenidos(id_contenido, id_exclusiveness, order_exc, title, publishingDate, Cdescription) VALUES (0123056789, 67890, 123, 'JugandoLol', '04/05/2020','echando LOL EN MBDA :)');
INSERT INTO contenidos(id_contenido, id_exclusiveness, order_exc, title, publishingDate, Cdescription) VALUES (6126810124, 23486, 321, 'JugandoFree', '04/05/2021','echando Free en el cole :v');
INSERT INTO contenidos(id_contenido, id_exclusiveness, order_exc, title, publishingDate, Cdescription) VALUES (3691215189, 10203, 213, 'JugandoCOD', '04/05/2019','echando COD en TPRO :D');

--PoblarnoOk(2)
INSERT INTO usuarios(id_usuario, email, user_name, createdAt) VALUES(1, 'Error1@gmail.com', 'Error1', '20/09/2017');
INSERT INTO usuarios(id_usuario, email, user_name, createdAt) VALUES('1', 'Error2@gmail.com', 'Error2', '20/09/2017');
INSERT INTO usuarios(id_usuario, email, user_name, createdAt) VALUES(1, NULL, 'Error3', '20/09/2017');
INSERT INTO usuarios(id_usuario, email, user_name, createdAt) VALUES(1, 'Error4@gmail.com', 'Error4', 20/09/2017);
INSERT INTO accounts(id_account, aname, createdAt, subscribers, id_user) VALUES(4, 'Error5', '11/04/2018', 10000, 5);
---PoblarnoOk(3)
INSERT INTO usuarios(id_usuario, email, user_name, createdAt) VALUES(4, 'Error1@gmailcom', 'Error1', '20/09/2017');
INSERT INTO exclusiveness(account_id, code, eorder, ename, price, eduracion) VALUES (3, '485765', 456, 'Basic Exc', 35000, 30);
INSERT INTO exclusiveness(account_id, code, eorder, ename, price, eduracion) VALUES (2, 'EX-123456', 798, 'Medium Exc', 55500000000, 30);
INSERT INTO exclusiveness(account_id, code, eorder, ename, price, eduracion) VALUES (1, 'EX-987543', 978, 'Premium Exc', 85000, 91);
INSERT INTO accounts(id_account, aname, createdAt, subscribers, id_user) VALUES(4, 'Error5', '11/04/2018', 10000, 5);

--XPoblar
DELETE FROM contenidos;
DELETE FROM subscriptions;
DELETE FROM exclusiveness;
DELETE FROM accounts;
DELETE FROM usuarios;

--Ttipos
ALTER TABLE exclusiveness ADD CONSTRAINT CH_exclusiveness_TCode
CHECK (REGEXP_LIKE(code, 'EX-[[:digit:]]{6}'));

ALTER TABLE usuarios ADD CONSTRAINT CH_usuarios_TEmail
CHECK (REGEXP_LIKE (email, '^[[:alnum:]]{1,49}@[[:alpha:]]{1,46}.[[:alpha:]]{2,3}') );

ALTER TABLE contenidos ADD CONSTRAINT CH_contenidos_TContentId
CHECK (REGEXP_LIKE(id_contenido, '^[[:alnum:]]{10}'));

ALTER TABLE exclusiveness ADD CONSTRAINT CH_exclusiveness_TOrder
CHECK (eorder >= 0);

ALTER TABLE exclusiveness ADD CONSTRAINT CH_exclusiveness_TMoney
CHECK (price >= 0 AND REGEXP_LIKE(price, '^[[:digit:]]{0,9}'));

ALTER TABLE exclusiveness ADD CONSTRAINT CH_exclusiveness_TDays
CHECK(eduracion >=1 AND eduracion <=90 AND REGEXP_LIKE(eduracion, '^[[:digit:]]{2}'));

ALTER TABLE stages ADD CONSTRAINT CH_stages_TMoney
CHECK (price >= 0 AND REGEXP_LIKE(price, '^[[:digit:]]{0,9}'));

ALTER TABLE subscriptions ADD CONSTRAINT CH_subscriptions_TDetails
CHECK (REGEXP_LIKE(detail, '^D: [[:alpha:]]{10,20} NE: [[:alnum:]]{2,5} DET: [[:alpha:]]{5,13}'));

ALTER TABLE videos ADD CONSTRAINT CH_videos_TMinutes
CHECK (1 <= Vduration AND Vduration <= 1380);

ALTER TABLE eventos ADD CONSTRAINT CH_eventos_TMinutes
CHECK (1 <= duracion AND duracion <= 1380);

ALTER TABLE posts ADD CONSTRAINT CH_posts_TText
CHECK (ptext LIKE '[[:alpha:]]{2,27} [[:alpha:]]{2,26}');

ALTER TABLE stages ADD CONSTRAINT CH_posts_TStatus
CHECK (status IN ('G', 'P'));

ALTER TABLE usuarios ADD CONSTRAINT CH_usuarios_TIdUsers
CHECK(REGEXP_LIKE(id_usuario, '^[[:digit:]]{5}'));

--PoblarNoOK(2) -> with new Restrictions
INSERT INTO usuarios(id_usuario, email, user_name, createdAt) VALUES(1234,'Error1@gmail.com', 'Error1', '20/09/2017');
INSERT INTO videos(content_id, Vduration) VALUES(6126810124, 1382);
INSERT INTO stages(id_subscription, id_stage, exc_id,exc_order,startAt, price, status) VALUES(01234, 1, 67890,123, '20/01/2020', -5000, 'A');
INSERT INTO exclusiveness(account_id, code, eorder, ename, price, eduracion) VALUES (23486, 'EX-987543', 978, 'Premium Exc', 85000, 91);
INSERT INTO stages(id_subscription, id_stage, exc_id,exc_order, startAt, price, status) VALUES(01234, 1, 67890,123, '20/01/2020', 45000, 'B');

--CONSULTAS
-- consultar cuentas con mayores subscriptores
SELECT id_account, aname, subscribers
FROM accounts
WHERE subscribers = (SELECT MAX(subscribers) FROM accounts);
-- consultar exclusividad del usuario llamado Juan
SELECT account_id, code, eorder, ename, price, eduracion
FROM exclusiveness JOIN accounts ON (exclusiveness.account_id = accounts.id_account) JOIN usuarios ON (accounts.id_user = usuarios.id_usuario)
WHERE user_name LIKE 'Juan%';

                --- DISPARADORES
                
--se genera el id
CREATE TRIGGER TR_idSubscription
BEFORE INSERT ON subscriptions
FOR EACH ROW
DECLARE
idsubs NUMBER(5);
BEGIN
    SELECT COUNT(*)+1 INTO idsubs FROM subscriptions;
    :new.id_subscriptor := idsubs;
END TR_idSubscription;
--- drop trigger 
DROP TRIGGER TR_idSubscription;

--la fecha createdAt se genera automáticamente
CREATE TRIGGER TR_actualDatesubs
BEFORE INSERT ON subscriptions
FOR EACH ROW
BEGIN
    :new.createdAT := SYSDATE;
END TR_actualDatesubs;
--- drop trigger 
DROP TRIGGER TR_actualDatesubs;
--el nivel gratuito de exclusividad debe estar bien definido (se definio como default en la tabla )
--se crea y asigna la etapa correspondiente al nivel libre de exclusividad
CREATE TRIGGER TR_Stage
BEFORE INSERT ON stages
FOR EACH ROW 
DECLARE
free CHAR := 'G';
premium CHAR := 'P';
orderEx NUMBER(3);
BEGIN
    SELECT eorder INTO orderEx FROM exclusiveness JOIN stages ON(exc_id = account_id AND exc_order = eorder );
    IF orderEx = 0 THEN
        :new.status := free;
    ELSE
        :new.status := premium;
    END IF; 
END TR_Stage;

DROP TRIGGER TR_Stage;

--- solo el detalle y el stage podrían actualizarse
CREATE TRIGGER TR_ModifiedDetail
BEFORE UPDATE ON subscriptions
FOR EACH ROW
BEGIN
   IF updating('id_subscriptor') THEN
    raise_application_error(-20001,'No se puede modificar el id del subscriptor');
   END IF;
   IF updating('createdAt') THEN
    raise_application_error(-20001,'No se puede modificar la fecha');
   END IF;
   
   IF updating('account_id') THEN
    raise_application_error(-20001,'No se puede modificar el id ');
   END IF;
   
   IF updating('account_idTwo') THEN
    raise_application_error(-20001,'No se puede modificar el segundo id');
   END IF;
 END TR_NotModifiedDetail;
--drop trigger
DROP TRIGGER TR_ModifiedDetail;

CREATE TRIGGER TR_ModifiedStages
BEFORE UPDATE ON subscriptions
FOR EACH ROW
BEGIN
   IF updating('id_subscription') THEN
    raise_application_error(-20001,'No se puede modificar el id del subscriptor');
   END IF;
   
   IF updating('id_stage') THEN
    raise_application_error(-20001,'No se puede modificar el id del stage');
   END IF;
   
   IF updating('exc_id') THEN
    raise_application_error(-20001,'No se puede modificar el id de exclusiveness');
   END IF;
   
   IF updating('exc_order') THEN
    raise_application_error(-20001,'No se puede modificar el Order de exclusiveness');
   END IF;
   
 END TR_ModifiedStages;
--drop trigger
DROP TRIGGER TR_ModifiedStages;

--
CREATE TRIGGER TR_IdUser
BEFORE INSERT ON usuarios
FOR EACH ROW 
DECLARE 
idUsers NUMBER(5);
BEGIN
    SELECT COUNT(*)+1 INTO idUsers FROM usuarios;
    :new.id_usuario := idUsers;
END TR_IdUser;

DROP TRIGGER TR_IdUser;

CREATE OR REPLACE TRIGGER TR_actualDate
BEFORE INSERT ON usuarios
FOR EACH ROW
DECLARE
fecha DATE := CURRENT_DATE;
BEGIN
    :new.createAT := fecha;
END TR_actualDate;
--- drop trigger 
DROP TRIGGER  TR_actualDate;

CREATE TRIGGER TR_NotModifiedUser
BEFORE UPDATE ON usuarios
FOR EACH ROW
BEGIN
    IF :new.id_usuario != :old.id_usuario OR :new.email != :old.email OR :new.user_name != :old.user_name OR :new.createdAt != :old.createdAt THEN
        :new.id_usuario := :old.id_usuario;
        :new.email := :old.email;
        :new.user_name := :old.user_name;
        :new.createdAt := :old.createdAt;
    END IF;
END TR_NotModifiedUser;

DROP TRIGGER TR_NotModifiedUser;
        
--XTABLAS 
-- DROP CONSTRAINT

ALTER TABLE likes DROP CONSTRAINT  FK_user_likes;
ALTER TABLE likes DROP CONSTRAINT  FK_content_likes;
ALTER TABLE contenidos DROP CONSTRAINT  FK_exclusiveness_contenidos;
ALTER TABLE videos DROP CONSTRAINT  FK_contenidos_videos;
ALTER TABLE eventos DROP CONSTRAINT FK_contenidos_evententos;
ALTER TABLE posts DROP CONSTRAINT  FK_contenidos_posts;
ALTER TABLE accounts DROP CONSTRAINT  FK_usuarios_accounts;
ALTER TABLE exclusiveness DROP CONSTRAINT  FK_accounts_exclusiveness;
ALTER TABLE subscriptions DROP CONSTRAINT  FK_accounts_subscritions;
ALTER TABLE subscriptions DROP CONSTRAINT FK2_accounts_subscritions;
ALTER TABLE stages DROP CONSTRAINT  FK_subscription_stages;
ALTER TABLE stages DROP CONSTRAINT  FK_exclusiveness_stages;
ALTER TABLE lables DROP CONSTRAINT FK_exclusiveness_lables;

ALTER TABLE usuarios DROP CONSTRAINT  PK_usuarios;
ALTER TABLE contenidos DROP CONSTRAINT  PK_contenidos;
ALTER TABLE likes DROP CONSTRAINT  PK_likes;
ALTER TABLE videos DROP CONSTRAINT  PK_videos;
ALTER TABLE eventos DROP CONSTRAINT  PK_eventos;
ALTER TABLE posts DROP CONSTRAINT  PK_posts;
ALTER TABLE accounts DROP CONSTRAINT  PK_accounts;
ALTER TABLE exclusiveness DROP CONSTRAINT  PK_exclusiveness;
ALTER TABLE subscriptions DROP CONSTRAINT  PK_subscriptions;
ALTER TABLE stages DROP CONSTRAINT  PK_stages;
ALTER TABLE usuarios DROP CONSTRAINT  uk_user;


DROP TABLE usuarios;
DROP TABLE contenidos;
DROP TABLE likes;
DROP TABLE videos;
DROP TABLE eventos;
DROP TABLE posts;
DROP TABLE accounts;
DROP TABLE exclusiveness;
DROP TABLE subscriptions;
DROP TABLE stages;
DROP TABLE lables;
