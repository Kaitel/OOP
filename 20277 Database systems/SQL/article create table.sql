CREATE TABLE article(
   ID INT PRIMARY KEY          NOT NULL,
   title      varchar(50)      NOT NULL,
   author       varchar(50)    NOT NULL,
   Journal      CHAR(50)       NOT NULL,
   Year         Date           NOT NULL,
   startPage    INTEGER       NOT NULL,
   endPage      INTEGER       NOT NULL
   
);