SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ���� ���̺� ����
DROP TABLE TBL_BOARD PURGE;

--�� TBL_BOARD ���̺� ����(�Խ��� ���� ���̺� ����)
CREATE TABLE TBL_BOARD
( NUM       NUMBER(9)               NOT NULL        -- �Խù� ��ȣ
, NAME      VARCHAR2(30)            NOT NULL        -- �Խù� �ۼ���
, PWD       VARCHAR2(20)            NOT NULL        -- �Խù� ��ȣ
, EMAIL     VARCHAR2(50)                            -- �ۼ��� �̸���
, SUBJECT   VARCHAR2(100)           NOT NULL        -- �Խù� ����
, CONTENT   VARCHAR2(4000)          NOT NULL        -- �Խù� ����
, IPADDR    VARCHAR2(20)                            -- ������ Ŭ���̾�Ʈ IP �ּ�
, HITCOUNT  NUMBER DEFAULT 0        NOT NULL        -- �Խù� ��ȸ��
, CREATED   DATE DEFAULT SYSDATE    NOT NULL        -- �Խù� �ۼ���
, CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM)          -- �Խù� ��ȣ�� PK �������� ����
);
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.

--�� �Խù� ��ȣ�� �ִ밪�� ���� ������ ����
SELECT NVL(MAX(NUM),0) AS MAXNUM
FROM TBL_BOARD;
--> �� �� ����
SELECT NVL(MAX(NUM),0) AS MAXNUM FROM TBL_BOARD
;


--�� �Խù� �ۼ� ������ ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1,'����ȭ','1234','hwa@test.com', '�ۼ��׽�Ʈ', '���빰�ۼ�', '211.238.142.153',0 ,SYSDATE);
--> �� �� ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(1,'����ȭ','1234','hwa@test.com', '�ۼ��׽�Ʈ', '���빰�ۼ�', '211.238.142.153',0 ,SYSDATE)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.



--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� DB ���ڵ��� ������ �������� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;

--                   1      10   �� (1~10) / (11~20) / (21~30) / 
--�� Ư�� ������(���۹�ȣ~����ȣ) �Խù��� ����� �о���� ������ ����
-- ��ȣ, �ۼ���, ����, ��ȸ��, �ۼ���
-- 1. �ۼ��Ϻκ� TO_CHAR ���� �ϰ����ְ�!
-- 2. �Խù� ������������ �ֱٿ� �� �Խù� �� DESC
-- WHERE NUM >= 1 AND NUM <= 10 ������ �̷��� ������� ���� ������ �� �Խñ� ����� ����������� 10�����ƴ϶� 1�� ��� �������� 9�� ...
-- �׷��� ROWNUM ���� ���� ����(��������)  �� �ѹ� �� �������� ���� �� �� ������ ������ �־����
-- ���������� ��ȸ�Ǵ� ���������� * ���ٴ� NUM, NAME, SUBJECT, HITCOUNT, CREATED ���ִ°� ����!(���߿� ResultSet���� ���� + �������ؼ��� / *�ᵵ �Ǳ���!)
SELECT *
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED
        FROM TBL_BOARD
        ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM >= 1 AND RNUM <= 10;
--> �� �� ����
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM ( SELECT ROWNUM RNUM, DATA.* FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC ) DATA ) WHERE RNUM >= 1 AND RNUM <= 10
;
--> �̰� �ٿ�����!
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED
        FROM TBL_BOARD
        ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM >= 1 AND RNUM <= 10
;


--�� Ư�� �Խù� ��ȸ�� ���� ��ȸ Ƚ�� ���� ������ ����
-- UPDATE CHECK~!! / +1 / ��ȸ�Ҷ��� �ĺ��ڴ� NUM�� �̿�
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT + 1
WHERE NUM=1;
--> �� �� ����
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM=1
;


--�� Ư�� �Խù��� ������ �о���� ������ ����
--   (NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT
     , TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=3;
--> �� �� ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT , TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=3
;



--�� Ư�� �Խù��� �����ϴ� ������ ����
--   (�Խù� �� ���� ������ �� Article.jsp �������� ó��)
--   �ۼ���, �н�����, �̸���, ����, ����
UPDATE TBL_BOARD
SET NAME='����ȣ', PWD='1234', EMAIL='lch@test.com', SUBJECT='��������', CONTENT='��������'
WHERE NUM=5;
--> �� �� ����
UPDATE TBL_BOARD SET NAME='����ȣ', PWD='1234', EMAIL='lch@test.com', SUBJECT='��������', CONTENT='��������' WHERE NUM=5
;



--�� Ư�� �Խù� ���� ��ȣ �о���� ������ ���� -- 7, 207, 208, 209
-- ���� �����ִ� �Խù� ��ȣ�� 7���ε� 7������ ū�� ��ȸ�ϴµ� �� �� ���� ���� ��! ��ȸ
-- ���� 209�� �̸� �ڰ� �����ϱ� NVL �� ó��!
SELECT NAL(MIN(NUM),-1) AS NEXTNUM
FROM TBL_BOARD
WHERE NUM>209;
--> �� �� ����
SELECT NAL(MIN(NUM),-1) AS NEXTNUM FROM TBL_BOARD WHERE NUM>209
;


----�� Ư�� �Խù� ���� ��ȣ �о���� ������ ����
SELECT NAL(MAX(NUM),-1) AS BEFOREENUM
FROM TBL_BOARD
WHERE NUM<9;
--> �� �� ����
SELECT NAL(MAX(NUM),-1) AS BEFORENUM FROM TBL_BOARD WHERE NUM<9
;



--�� Ư�� �Խù��� �����ϴ� ������ ����
DELETE 
FROM TBL_BOARD
WHERE NUM=1;
--> �� �� �ۼ�
DELETE FROM TBL_BOARD WHERE NUM=1
;



--------------------------------------------------------------------------------
-- ���� �ǽ� ���ణ �׽�Ʈ ���� --

--�� �Խù� �ۼ� ������ ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1,'����ȭ','1234','hwa@test.com', '�ۼ��׽�Ʈ', '���빰�ۼ�', '211.238.142.153',0 ,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_BOARD;



--�� �Խù� �ۼ�
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(2,'���±�','1234','ssk@test.com', '�±��� �⵿', '���� �ٷ� �±��̴�', '211.238.142.153',0 ,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(3,'�մ���','1234','sdj@test.com', '�մ��� �⵿', '���� ��ó ����', '211.238.142.153',0 ,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT PWD
FROM TBL_BOARD
WHERE NUM=633;
--==>> java004$

SELECT PWD
FROM TBL_BOARD
WHERE NUM=666;
--==>> java004$


-- �˻��� ���� ����
SELECT COUNT(*) AS COUNT 
FROM TBL_BOARD
WHERE
--NAME 
--SUBJECT
CONTENT
LIKE '%����%';
-->�� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_BOARD WHERE CONTENT LIKE '%����%'
;


-- �˻��� ���� ����
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED 
FROM 
(
    SELECT ROWNUM RNUM, DATA.* 
    FROM 
    (
        SELECT NUM, NAME, SUBJECT, HITCOUNT
        , TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED 
        FROM TBL_BOARD  
        WHERE SUBJECT LIKE '%����%' 
        ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM >= 1 AND RNUM <= 10;
--> �� �� ����
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM (SELECT ROWNUM RNUM, DATA.* FROM (SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE SUBJECT LIKE '%����%' ORDER BY NUM DESC) DATA)WHERE RNUM >= 1 AND RNUM <= 10;

















































