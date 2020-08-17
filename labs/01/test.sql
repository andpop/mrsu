PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE test (
    id integer PRIMARY KEY,
    name text,
    lastname text
);
INSERT INTO test VALUES(1,'andrey','popov');
INSERT INTO test VALUES(2,'Андрей','Попов');
INSERT INTO test VALUES(3,'andrey','popov');
CREATE TABLE strange (c1, c2);
INSERT INTO strange VALUES(1,2);
INSERT INTO strange VALUES('aaa','bbb');
COMMIT;
