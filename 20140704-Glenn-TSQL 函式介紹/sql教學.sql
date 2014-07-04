use rdtest
/*建立*/
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

/* 新增
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

--for xml 當多筆資料需整理成一筆送出時
select distinct id,(
					SELECT  CAST(isnull(commodity,'') AS VARCHAR)  +' - ' + CONVERT(varchar,(Samount))+','
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


SELECT  CAST(isnull(commodity,'') AS VARCHAR)  +','
FROM   Orders
WHERE id = 1
group by commodity
ORDER  BY commodity 
FOR XML PATH('')

--排序相關
select * ,
ROW_NUMBER() OVER(ORDER BY amount) AS ROW_NUMBER_amount,--排序(不重覆)
RANK() OVER(ORDER BY amount) AS RANK_amount,--排序(跳號)
DENSE_RANK() OVER(ORDER BY amount) AS DENSE_RANK_amount,--排序(不跳號)
NTILE(5) over(order by amount )as NTILE_amount, --分級
ROW_NUMBER() over(partition by commodity order by amount)DENSE_RANK_partition  --分群組(排序)
from Orders
where commodity = 'Apple'


DECLARE @count int 
set @count = 1
--ROW_NUMBER 當分頁使用
select * from (
select * ,
ROW_NUMBER() OVER(ORDER BY amount desc) AS ROW_NUMBER_amount--排序(不重覆)
from Orders
)T
where ROW_NUMBER_amount between (@count -1)*20+1 and @count*20


--NTILE應用, 分級
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

/*隨機找十筆*/
SELECT TOP 10 * FROM Orders Orders ORDER BY NEWID()



--建立旅客姓名 view
CREATE VIEW View_Pax_Cnma
	WITH SCHEMABINDING
	AS 
	select PAX_CD,PAX_CNML+PAX_CNMF as PAX_CNM 
	from dbo.TRPAX
--建立view索引
CREATE UNIQUE CLUSTERED INDEX PK_View_Pax_Cnma
ON View_Pax_Cnma (PAX_CD) 
--建立index
CREATE NONCLUSTERED INDEX NCI_View_Pax_Cnm1a
ON View_Pax_Cnma (PAX_CNM) 
INCLUDE (PAX_CD)
--檢視view
select * from  View_Pax_Cnm
--刪除view
drop VIEW View_Pax_Cnma

--是把這個View加密加密後只看得到資料而看不到其中的語法 不過加密後就不能解密了
CREATE VIEW View_Pax_Cnmb
	WITH  ENCRYPTION
	AS 
	select PAX_CD,PAX_CNML+PAX_CNMF as PAX_CNM 
	from dbo.TRPAX


--PIVOT
--直接轉置沒處理
SELECT * FROM Orders 
PIVOT (
	SUM(amount) FOR commodity  IN ([Apple], [Peache],[banana]) 
) AS pvt
--處理後
select * ,ROW_NUMBER() OVER(ORDER BY Totle desc)as sq
--into tmpa
from (
	select * , isnull([Peache],0)+isnull([Apple],0)+isnull([banana],0) as Totle 
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
--轉置後的表
select * from tmpa

--反轉置
select * from tmpa
unpivot (amt for tp in ([apple],[banana],[peache])) as T



drop table tmpa










