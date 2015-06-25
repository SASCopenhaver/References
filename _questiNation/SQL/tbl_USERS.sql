TRUNCATE TABLE USERS;
--------------------------------------------------------------------------------
create sequence USERS_ID increment by 1 start with 1;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--SELECT FROM Access  ECA:
SELECT 'INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  '''& UCASE(I.FirstName)&''', '''&UCASE(I.LastName)&''', ''pass'', ''email'', ''A'', 2);'
FROM Individuals I;
--SELECT FROM Access  IIP:
SELECT 'INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  '''& UCASE(I.FirstName)&''', '''&UCASE(I.LastName)&''', ''pass'', ''email'', ''A'', 3);'
FROM Individuals I;
--------------------------------------------------------------------------------


DROP table "Q42ADMIN"."USERS" ;

CREATE TABLE "Q42ADMIN"."USERS" 
(
 "IDS" 		NUMBER NOT NULL
,"FNAME" 	VARCHAR2(20) NOT NULL
,"LNAME" 	VARCHAR2(20) NOT NULL
,"PASS"  	VARCHAR2(10) NOT NULL
,"EMAIL" 	VARCHAR2(100)
,"ACT_INACT" CHAR(1) DEFAULT "A"
,"ORG_ID"   NUMBER NOT NULL
,CONSTRAINT "PK_USERS" PRIMARY KEY("IDS")
)  
TABLESPACE "USERS" 
;


--------------------------------------------------------------------------------
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,'SERGEY' ,'SURIKOV' ,'sas', 'ssuriov@usa-ctc.com' ,'A' , 0  );
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,'WILLIAM','GOODWIN' ,'wg', 'wgoodwin2@pd.state.net', 'A' ,0 );
COMMIT;
--------------------------------------------------------------------------------
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SANA', 'ABED-KOTOB', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MAGGIE', 'AHERN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'WILLIAM', 'ANCKER', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ERIK', 'ANDERSON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ALCE', 'ARMITAGE', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'KAREN', 'ASCHAFFEBURG', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MARY', 'ASHSLEY', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'KATRINA', 'ASKEW', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ALANNA', 'BAILEY', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SUSIE', 'BAKER', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LINDA TRESSA', 'BARKER', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JOYCE', 'BEAMON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'BRENT', 'BEEMER', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MARGERY', 'BENSON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ELLEN', 'BERELSON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'TERRY', 'BLATT', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ORNA', 'BLUM', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'PEGGY', 'BOND', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SUE', 'BORJA', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ROBIN', 'BRADLEY', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DONNA', 'BRISCOE', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DANA', 'BULLOCK', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DEBORAH', 'BURRELL', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MICHAEL', 'CAIN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'THOMAS', 'CARMICHAEL', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'WILLIE', 'CARTLEDGE', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'BEN', 'CASTRO', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'RUTA', 'CHAGNON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DEBORAH', 'CHAOMAN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JACKIE', 'CHISOLM', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ELLA', 'CLEMENT-LILLY', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SUSAN', 'COHEN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'EILEEN', 'CONNOLLY', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'J ANDREW', 'CORTEZ_GREIG', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MARIANNE', 'CRAVEN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'GAIL', 'CURTIS', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LORRAINE', 'DALE', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'KAY', 'DAVIS', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'KENDRA', 'DAVIS', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'THOMAS', 'DRISCOLL', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LINDA', 'DUNCAN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'PHYLLIS', 'EASTMAN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'PAUL', 'ENGLESTAD', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DONNA', 'EVERETT', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'IVEL', 'FELDER', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LORRAINE', 'FLORA', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'AUDREY', 'FORD', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'AMY', 'FOREST', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MARY', 'FRANKO', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'STEPHEN', 'GANGSTEAD', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'PATRICIA', 'GARON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DEHAB', 'GHEBREAB', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JANET', 'GILLIGAN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ROY', 'GLOVER', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'BILL', 'GOODWIN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'CAROL', 'GRABAUSKAS', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MIKE', 'GRAHAM', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JOCELYN', 'GREENE', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'GAIL', 'GULLIKSEN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LAYLA', 'HAKIM', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DAVID', 'HAMILL', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ILO-MAI', 'HARDING', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JOYCE', 'HARROD', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'KIM', 'HAVENNER', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ANDREA', 'HEFLEY', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'IRVIN', 'HICKS', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MARK', 'HILBERT', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JOCHEN', 'HOFFMAN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SHARON', 'HOWARD-JOHNSON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'CURT', 'HUFF', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'GAYNELL', 'HUNTER', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'WILLIAM', 'JAMES', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'FELITA', 'JENNINGS', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LUCY', 'JILKA', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MARY', 'JOHNSON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'PATRICIA', 'JOHNSON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MARY LOU', 'JOHNSON-PIZARRO', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'BRENDA', 'JONES', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SHALITA', 'JONES', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'GERRY', 'JORIA', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'BETSY', 'KAGEN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ROBERT', 'KEITH', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ANTHONY', 'KLUTTZ', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SARAH', 'KNOTT', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SUSAN', 'KRAUSE', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SALLY', 'LAWRENCE', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DAVID', 'LEVIN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'CAROLYN', 'LOBRON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JOYCE', 'LOVE', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'PAT', 'LUCAS', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'CINDY', 'MALECKI', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'TIM', 'MARSHALL', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ANN', 'MARTIN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'THERESA', 'MASTRANGELO', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ROBERT', 'MCCARTHEY', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ANGEL', 'MCLAURINE-QUALLS', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LORRETTA GENTRY', 'MILBURN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LYNN', 'MONTEIRO', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ROBIN', 'MOORE', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DOROTHY', 'MORA', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'WILLIAM', 'MORGAN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'PAT', 'MOSLEY', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'RICHARD', 'MURPHY', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ROBIN', 'NEILSON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JIM', 'OGUL', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'APRIL', 'PARKER', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'BOB', 'PERSIKO', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'BOBBY', 'PICKETT', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'HANS', 'POSEY', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ANNIE', 'PRINCE', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LAFAYE', 'PROCTOR', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'VERONICA', 'RECTOR', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'VANESSA', 'RELLI-MOREAU', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JAY', 'RICHTER', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SCOTT', 'RIGHETTI', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SEQUITA', 'ROBINSON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'VICKI', 'ROSE', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SANDY', 'ROUSE', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'PATRICIA', 'SCHAEFER', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'HENRY', 'SCOTT', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JOHN', 'SEDLINS', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JOE', 'SEXTON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SHAREN', 'SHEEHAN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ALICE', 'SHIFFLETT', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DONNA', 'SHIRREFFS', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'GLORIA', 'SIMMS', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SARAH', 'SMSITH', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'PATRICIA', 'SPANN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'KAREN', 'STARKEY', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SMAROULA GEORGINA', 'STEPHENS', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'CONNIE', 'STINSON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'PHYLLIS', 'SWANN-SMITH', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'RENEE', 'TAFT', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LYDIA', 'TAYLOR', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DARLENE', 'THOMAS', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DEBORAH', 'THOMPSON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'TAMMIE', 'THOMPSON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'CHARLOTTE', 'TITUS', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DEBBIE', 'UNDERHILL', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'RALPH', 'VOGEL', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'KATHRYN', 'WAINSCOTT', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'TONYA', 'WALLACE', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'STACEY', 'WEAVER', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'IVAN', 'WEINSTEIN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MARIE', 'WESTBROOK', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'WILLIAM', 'WHELAN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'GEORGE', 'WILCOX', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ESSIE', 'WILKES-SCOTT', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ELISABETH', 'WILSON', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'CINDY', 'WOLLOCH', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SAM', 'WUNDER', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JANET', 'YATES', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JOAN', 'ZAFFARANO', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'AZZA', 'ZAKI', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SUSAN', 'ZAPOTOCZNY', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DAVE', 'WHITTEN', 'pass', 'email', 'A', 2);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ECA-IIP', 'EX', 'pass', 'email', 'A', 2);
COMMIT;

--------------------------------------------------------------------------------

INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'RODNEY', 'ADAMS', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ELIZABETH', 'ADGERSON', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MANUEL', 'AGROMAYOR', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SAMUEL', 'ANDERSON', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'CARLOS', 'ARANAGA', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'WILLIAM', 'BACH', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ESTELLE', 'BAIRD', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MICHAEL', 'BANDLER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'STACEY ROSE', 'BLASS', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MARY', 'BOONE', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ZELMA', 'BRIGGS', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'GEORGE', 'BROWN', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SANDRA', 'BRUCKNER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MARY NELL', 'BRYANT', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LORRETA', 'BUSH', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'BRENDA', 'BUTLER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MIRIAM', 'CARVELLA', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JEAN', 'CAVANAUGH', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'GRETCHEN', 'CHRISTISON', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'GEORGE', 'CLACK', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DARRELL', 'COCHRAN', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'CHARLES', 'COREY', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ELIZABETH', 'CRAIG-DAVIS', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'RALPH', 'DANNHEISSER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SUZANNE', 'DAWKINS', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'EILEEN', 'DEEGAN', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MARTHA', 'DEUTSCHER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'FLORENCE', 'DOUGLAS', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'TOM', 'EICHLER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SUSAN', 'ELLIS', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MONA', 'ESQUENTINI', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'PATRICIA', 'FAUNCE', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'WILLIAM', 'DURHAM', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LOUISE', 'FENNER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JAMES', 'FISCHER-THOMPSON', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'BARRY', 'FITZGERALD', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JAMES', 'FULLER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'STUART', 'GAMBLE', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LAURA', 'GOULD', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ANITA', 'GREEN', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'KATHRYN', 'GUNNING', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'WAYNE', 'HALL', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'RICHARD', 'HARMAN', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'CHAS', 'HAUSHEER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ALFRED', 'HEAD', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JOE', 'HOCKERSMITH', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SELINA', 'HOLT', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'HUGH', 'HOWARD', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'PEGGY', 'HU', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'KATHLEEN', 'HUG', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'KEVIN', 'HUNTER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DOLORES', 'HYLANDER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DEBORAH', 'JACKSON', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'CHRISTINE', 'JOHNSON', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MERLE', 'KELLERHALS', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DAVID', 'KRAMER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'CYNTHIA', 'LACOVEY', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'STEPHEN', 'LAROCQUE', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'BARBARA', 'LONG', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'THAN', 'LWIN', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'PAUL', 'MALAMUD', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MARTIN', 'MANNING', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'STUART', 'MAZER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ANDREA', 'MCGLINCHEY', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MARGARET', 'MCKAY', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JAMIE', 'METZEL', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'THADDEUS', 'MIKSINSKI', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LA SEANE', 'MILLER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'AFAF', 'MITCHELL', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LAUREN', 'MONSEN', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'KEVIN', 'MORAN', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MORSE', 'JANE', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MILDRED', 'NEELY', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'RANDA', 'NOUR', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'BRUCE', 'ODESSEY', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JANINE', 'PERRY', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'NORMAN', 'PHILLIPS', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ROSELYNE', 'PLACE', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LUANNE', 'POND', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'CHARLENE', 'PORTER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'STEVE', 'PRIETO', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'WILLIAM', 'REINCKENS', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'WARNER', 'ROSE', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'HELEN', 'ROUCE', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'AMOR', 'SAFI', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ANTHONY', 'SARITI', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JONATHAN', 'SCHAFFER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'SYLVIA', 'SCOTT', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'HELEN', 'SEBSOW', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'YVONNE', 'SHANKS', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JUDITH', 'SIEGEL', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JANELLE', 'SIMMONS, JANELLE', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'MICHELE', 'SSMITH', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'CHUCK', 'SPEORL', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'CRAIG', 'SPRINGER', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'GLORIA', 'STEELE', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ILYA', 'SUSLOV', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ROSALIE', 'TARGONSKI', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JEFFREY', 'THOMAS', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'ELLEN', 'TOOMEY', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JUDITH', 'TRUNZO', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LORAINE', 'VENEY', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'KAREN', 'WAKEFILED', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'WILLIAM', 'WANLUND', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DIANE', 'WATSON', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DENA', 'WEINSTEIN', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'JOHN', 'WICART', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DIANA', 'WILLIAMS', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'LEONARDO', 'WILLIAMS ', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'KATE', 'YEMELANOV', 'pass', 'email', 'A', 3);
INSERT INTO "Q42ADMIN"."USERS" ("IDS" ,"FNAME" ,"LNAME" , "PASS", "EMAIL", "ACT_INACT" ,"ORG_ID") 
VALUES ( USERS_ID.NextVal ,  'DAVID', 'ZWEIGEL', 'pass', 'email', 'A', 3);
COMMIT;
--------------------------------------------------------------------------------




------------
DROP TABLE USERS CASCADE CONSTRAINTS ; 

CREATE TABLE USERS ( 
  IDS        NUMBER        NOT NULL, 
  FNAME      VARCHAR2 (20)  NOT NULL, 
  LNAME      VARCHAR2 (20)  NOT NULL, 
  PASS       VARCHAR2 (10)  NOT NULL, 
  EMAIL      VARCHAR2 (100), 
  ACT_INACT  CHAR (1)      DEFAULT 'A' NOT NULL, 
  ORG_ID     NUMBER        NOT NULL, 
  CONSTRAINT PK_USERS
  PRIMARY KEY ( IDS ) 
    USING INDEX 
     TABLESPACE USERS PCTFREE 10
     STORAGE ( INITIAL 131072 NEXT 131072 PCTINCREASE 0 ))
   TABLESPACE USERS
   PCTFREE 10
   PCTUSED 40
   INITRANS 1
   MAXTRANS 255
  STORAGE ( 
   INITIAL 131072
   NEXT 131072
   PCTINCREASE 0
   MINEXTENTS 1
   MAXEXTENTS 4096
   FREELISTS 1 FREELIST GROUPS 1 )
   NOCACHE; 

--------------
