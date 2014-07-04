use rdtest
/*�إ�*/
CREATE TABLE Student
(
ID int NOT NULL  IDENTITY(1,1) PRIMARY KEY,
Name varchar(50) NOT NULL 
)

CREATE TABLE Orders
(
auto_No int NOT NULL  IDENTITY(1,1) PRIMARY KEY,
ID int NOT NULL   ,
commodity varchar(50) NOT NULL ,
amount int NOT NULL 
)

/* �s�W
INSERT INTO Student ( "Name")
VALUES ('Glenn');
INSERT INTO Student ( "Name")
VALUES ('Ken');
INSERT INTO Student ( "Name")
VALUES ('Aron');
INSERT INTO Student ( "Name")
VALUES ('Jack');
INSERT INTO Student ( "Name")
VALUES ('Stanley');
INSERT INTO Student ( "Name")
VALUES ('Alien');
INSERT INTO Student ( "Name")
VALUES ('Larry');
INSERT INTO Student ( "Name")
VALUES ('Ricky');
INSERT INTO Student ( "Name")
VALUES ('Janet');
INSERT INTO Student ( "Name")
VALUES ('Tank');
INSERT INTO Student ( "Name")
VALUES ('Allen');
INSERT INTO Student ( "Name")
VALUES ('Charles');
INSERT INTO Student ( "Name")
VALUES ('Derrick');
INSERT INTO Student ( "Name")
VALUES ('Ellie');
INSERT INTO Student ( "Name")
VALUES ('Patty');

INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('1', 'Peache',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('2', 'Peache',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('3', 'Peache',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('4', 'Peache',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('5', 'Peache',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('6', 'Peache',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('7', 'Peache',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('8', 'Peache',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('9', 'Peache',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('10', 'Peache',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('11', 'Peache',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('12', 'Peache',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('13', 'Peache',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('14', 'Peache',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('15', 'Peache',rand()*10+1);

INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('1', 'Apple',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('2', 'Apple',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('3', 'Apple',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('4', 'Apple',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('5', 'Apple',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('6', 'Apple',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('7', 'Apple',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('8', 'Apple',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('9', 'Apple',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('10', 'Apple',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('11', 'Apple',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('12', 'Apple',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('13', 'Apple',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('14', 'Apple',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('15', 'Apple',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('1', 'banana',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('2', 'banana',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('3', 'banana',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('4', 'banana',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('5', 'banana',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('6', 'banana',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('7', 'banana',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('8', 'banana',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('9', 'banana',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('10', 'banana',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('11', 'banana',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('12', 'banana',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('13', 'banana',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('14', 'banana',rand()*10+1);
INSERT INTO Orders ( "ID","commodity","amount")
VALUES ('15', 'banana',rand()*10+1);
*/

select * from Student
select * from Orders
select id , commodity,sum(amount) sumAmo from Orders
where id=1
group by id , commodity



SELECT  CAST(isnull(commodity,'') AS VARCHAR)  +','
FROM   Orders
WHERE id = 1
group by commodity
ORDER  BY commodity 
FOR XML PATH('')

--�ƧǬ���
select * ,
ROW_NUMBER() OVER(ORDER BY amount,commodity) AS ROW_NUMBER_amount,--�Ƨ�(������)
RANK() OVER(ORDER BY amount) AS RANK_amount,--�Ƨ�(����)
DENSE_RANK() OVER(ORDER BY amount) AS DENSE_RANK_amount,--�Ƨ�(������)
NTILE(5) over(order by amount )as NTILE_amount, --����
ROW_NUMBER() over(partition by commodity order by amount)DENSE_RANK_partition  --���s��(�Ƨ�)
from Orders
where commodity = 'Apple'


DECLARE @count int 
set @count = 1
--ROW_NUMBER ������ϥ�
select * from (
select * ,
ROW_NUMBER() OVER(ORDER BY amount desc) AS ROW_NUMBER_amount--�Ƨ�(������)
from Orders
)T
where ROW_NUMBER_amount between (@count -1)*20+1 and @count*20


--NTILE����, ����
select * ,
case NTILE(5) over(order by amount desc)
	when 1 then 'A'
	when 2 then 'B'
	when 3 then 'C'
	when 4 then 'D'
	when 5 then 'E'
end pricebank
from Orders
order by commodity ,amount desc

/*�H����Q��*/
SELECT TOP 10 * FROM Orders Orders ORDER BY NEWID()



--�إ߮ȫȩm�W view
CREATE VIEW View_Pax_Cnma
	WITH SCHEMABINDING
	AS 
	select PAX_CD,PAX_CNML+PAX_CNMF as PAX_CNM 
	from dbo.TRPAX
--�إ�view����
CREATE UNIQUE CLUSTERED INDEX PK_View_Pax_Cnma
ON View_Pax_Cnma (PAX_CD) 
--�إ�index
CREATE NONCLUSTERED INDEX NCI_View_Pax_Cnm1a
ON View_Pax_Cnma (PAX_CNM) 
INCLUDE (PAX_CD)
--�˵�view
select * from  View_Pax_Cnm
where PAX_CNM like '%'
--�R��view
drop VIEW View_Pax_Cnma

--�O��o��View�[�K�[�K��u�ݱo���ƦӬݤ���䤤���y�k ���L�[�K��N����ѱK�F
CREATE VIEW View_Pax_Cnmb
	WITH  ENCRYPTION
	AS 
	select PAX_CD,PAX_CNML+PAX_CNMF as PAX_CNM 
	from dbo.TRPAX


--PIVOT
--������m�S�B�z
SELECT * FROM Orders 
PIVOT (
	SUM(amount) FOR commodity  IN ([Apple], [Peache],[banana]) 
) AS pvt
--�B�z��
select * ,ROW_NUMBER() OVER(ORDER BY Totle desc)as sq
--into tmpa
from (
	select * 
	from (
		SELECT * FROM (
			select o.ID,o.commodity,o.amount
			from Orders o
		) T
		PIVOT (
			SUM(amount) FOR commodity  IN (Peache,Apple,banana) 
		) AS pvt
	) T
)T1
--��m�᪺��
select * from tmpa

--����m
select * from tmpa
unpivot (amt for tp in ([apple],[banana],[peache])) as T



drop table tmpa







--FOR XML
--FOR XML PATH  
SELECT id ,    commodity ,amount
FROM orders 
WHERE id=7 
FOR XML PATH  ,ROOT('myRoot')

SELECT CAST(isnull(commodity,'') AS VARCHAR)  +' - ' + CONVERT(varchar,(amount))+' | '
FROM orders 
WHERE id=7 
FOR XML PATH('')  


--FOR XML RAW 
select PAX_CD,PAX_CNML+PAX_CNMF as PAX_CNM 
	from dbo.TRPAX AS P
FOR XML RAW, TYPE,ROOT('myRoot')

--FOR XML AUTo
select PAX_CD,PAX_CNML+PAX_CNMF as PAX_CNM 
	from dbo.TRPAX
FOR XML AUTO, TYPE,ROOT('myRoot')

--FOR XML RAW �P FOR XML AUTO���t�O �u�OTag���W�٤��P��l�\��j�ܬۦP

--FOR XML EXPLICIT
SELECT
    1 AS Tag,
    NULL AS Parent,
    NULL AS 'Agents!1!',
    NULL AS 'Agent!2!AgentID',
    NULL AS 'Agent!2!Fname!Element',
    NULL AS 'Agent!2!SSN!Element'
UNION ALL
SELECT
    2 AS Tag,
    1 AS Parent,
    NULL, 
    'AgentID',
    'Fname',
    'SSN'
UNION ALL
SELECT
    2 AS Tag,
    1 AS Parent,
    NULL, 
    'AgentID2',
    'Fname2',
    'SSN2'
FOR XML EXPLICIT




---EXPLICIT�i��
/*
Borrowed from Kent's code
*/
declare @agent table
(
    AgentID int,
    Fname varchar(5),
    SSN varchar(11)
)
insert into @agent
select 1, 'Vimal', '123-23-4521' union all
select 2, 'Jacob', '321-52-4562' union all
select 3, 'Tom', '252-52-4563'
declare @address table
(
    AddressID int,
    AddressType varchar(12),
    Address1 varchar(20),
    Address2 varchar(20),
    City varchar(25),
    AgentID int
)
insert into @address
select 1, 'Home', 'abc', 'xyz road', 'RJ', 1 union all
select 2, 'Office', 'temp', 'ppp road', 'RJ', 1 union all
select 3, 'Home', 'xxx', 'aaa road', 'NY', 2 union all
select 4, 'Office', 'ccc', 'oli Com', 'CL', 2 union all
select 5, 'Temp', 'eee', 'olkiu road', 'CL', 2 union all
select 6, 'Home', 'ttt', 'loik road', 'NY', 3

SELECT
    1 AS Tag,
    NULL AS Parent,
    NULL AS 'Agents!1!',
    NULL AS 'Agent!2!AgentID',
    NULL AS 'Agent!2!Fname!Element',
    NULL AS 'Agent!2!SSN!Element'
UNION ALL
SELECT
    2 AS Tag,
    1 AS Parent,
    NULL, 
    AgentID,
    Fname,
    SSN
FROM @agent
FOR XML EXPLICIT

--for xml ��h����ƻݾ�z���@���e�X��
select distinct id,(
		SELECT  CAST(isnull(commodity,'') AS VARCHAR)  +' - ' + CONVERT(varchar,(Samount))+'||'
		FROM   (
			select id , commodity,sum(amount) as Samount
			from orders
			group by id,commodity
		)T
		WHERE T.id = o.id
		group by commodity,Samount
		ORDER  BY commodity 
		FOR XML PATH('')
		) as txml
from Orders o


