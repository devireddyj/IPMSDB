use test;
select * from user;


CREATE INDEX index_user ON user (UserId);


use test;
CREATE INDEX index_Customer ON Customer (CustId);


use test;
select * from UserCode;

use test;
CREATE INDEX index_login ON login (LoginId);

use test;
CREATE VIEW View_Password AS
SELECT PassId, PassUserId, PassTitle FROM Password;

use test;
CREATE VIEW View_Report AS
SELECT ReportId, ReportDesc FROM report;


select * from View_Password;

select * from View_Report;

use test;
select * from usercode;

START transaction;
select * from usercode;
update usercode set UC_UserId =320 where UC_ID = 324;
commit;


use test;
CREATE USER super@localhost 
IDENTIFIED BY 'Secure1Pass!';


use test;
GRANT SELECT
ON test.report
TO super@localhost;


use test;
CREATE USER manager@localhost 
IDENTIFIED BY 'Secure1Pass!';

use test;
GRANT SELECT, insert
ON test.*
TO manager@localhost;

use test;
CREATE USER developer@localhost 
IDENTIFIED BY 'Secure1Pass!';

use test;
GRANT SELECT, insert, update, delete
ON test.*
TO developer@localhost;

use test;
CREATE USER RDM@localhost 
IDENTIFIED BY 'Secure1Pass!';

use test;
GRANT SELECT, insert, update
ON test.*
TO RDM@localhost;


SHOW GRANTS FOR super@localhost;
SHOW GRANTS FOR manager@localhost;
SHOW GRANTS FOR developer@localhost;
SHOW GRANTS FOR RDM@localhost;


use test;
select * from customer;

use test;
select * from user;

LOCK TABLES user READ, Customer WRITE;
update Customer set User_UserId =
   (SELECT UserId FROM user WHERE UserName = 'Terry') where CustId =4801;
update Customer set User_UserId =
  (SELECT UserId FROM user WHERE UserName = 'Sariya') where CustId = 8793;
UNLOCK TABLES;




