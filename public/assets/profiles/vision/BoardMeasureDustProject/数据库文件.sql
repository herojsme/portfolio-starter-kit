------------------------------------  数据库切换------------------------------------
--use master;
--drop database Parting;
--go

use TEST;

use BoardMeasureDustDB;

--IF EXISTS(SELECT * FROM   sysdatabases  WHERE  name = 'BoardMeasureDustDB')
--  DROP DATABASE BoardMeasureDustDB
--go


------------------------------------ 创建修仙数据库------------------------------------
CREATE DATABASE BoardMeasureDustDB ON PRIMARY (
--主数据文件组
NAME='Parting_Data', --逻辑文件名
filename='D:\project\company\项目1 螺丝孔距离；脏污检测\DataBase\BoardMeasureDustDB_Data.mdf', --物理路径
size=20MB, --大小
filegrowth=10MB --扩容
), (
--次数据文件组
NAME='Parting_SubData', --逻辑文件名
filename='D:\project\company\项目1 螺丝孔距离；脏污检测\DataBase\BoardMeasureDustDB_SubData.ndf', --物理路径
size=20MB, --大小
filegrowth=10MB --扩容
) log ON (
--日志文件
NAME='Parting_Log', --逻辑文件名
filename='D:\project\company\项目1 螺丝孔距离；脏污检测\DataBase\BoardMeasureDustDB_Log.ldf', --物理路径
size=20MB, --大小
filegrowth=10MB --扩容
) 

------------------------------------表相关操作------------------------------------
use BoardMeasureDustDB;

create  Table BoardDetailTable(
--列名 类型 约束(不同列名之间是逗号)identity
ID  int identity(1,1) primary key,
InspectType int not null,
InspectDetail nvarchar(200),
DateTimeStr datetime not null,
ImageUrl varchar(200) not null,
InspectDis float ,
StandardDis float,
);

--alter table ProDetailTable  add  test int;
--alter table ProDetailTable  drop column test ;

select * from BoardDetailTable  ;

insert into BoardDetailTable(InspectType,InspectDetail,DateTimeStr,ImageUrl,InspectDis,StandardDis) 
values(1,'ss','2025-09-12 21:22:22','','')


select COUNT(*) from BoardDetailTable

delete  from BoardDetailTable  where ID=1002


-- 增加字段
ALTER TABLE BoardDetailTable 
ADD Pos1Coor VARCHAR(80) NULL,Pos2Coor VARCHAR(80) NULL ;

ALTER TABLE BoardDetailTable  drop  column pos1Coor,pos2Coor

insert into BoardDetailTable(InspectType,InspectDetail,DateTimeStr,ImageUrl,InspectDis,StandardDis,Pos1Coor,Pos2Coor) 
values(1,'ss','2025-09-12 21:22:22','xxul',20,null,'(xx,yy)','(xx,yy)')


-- 分页查询
--DECLARE @PageNumber INT = 1;  -- 当前页码
--DECLARE @PageSize INT = 10;   -- 每页记录数
--select * from BoardDetailTable ORDER BY ID DESC OFFSET (@PageNumber-1) * @PageSize ROWS FETCH NEXT @PageSize ROWS ONLY
-- select * from BoardDetailTable where DateTimeStr>='{startTime}' and DateTimeStr<='{endTime}'ORDER BY ID OFFSET ({PageNumber}-1) * {PageSize} ROWS FETCH NEXT {PageSize} ROWS ONLY

select * from BoardDetailTable ORDER BY ID DESC OFFSET 3 * 0 ROWS FETCH NEXT 3 ROWS ONLY 




--select count(*) from ProDetailTable where PersonAccount= '韩立' And PersonPassword=123456;
--select PersonID,PersonName from Person where PersonAccount= '韩立' And PersonPassword=123456;
--insert into Person(PersonAccount,PersonPassword,PersonName,PersonAddress)
--values ('韩立','123456','韩立','越国小山村'),
--('张铁','123456','张铁','七玄门14号'),
--('历飞羽','123456','历飞羽','七玄门15号'),
--('南宫婉','123456','南宫婉','越国17号'),
--('紫灵','123456','王凝','乱星海1号'),
--('元瑶','123456','元瑶','乱星海6号'),
--('墨居仁','123456','墨居仁','惊蛟会1号'),
--('青元子','123456','青元子','玄武国7号'),
--('慕沛灵','123456','慕沛灵','落云宗8号'),
--('宝花','123456','宝花','魔渊海5号')

--select PersonID from Person where PersonName='韩立'


----  模拟mysql的limit   做分页
----select top @pageSize id from tablename
----where id not in (
----select top @offset id from tablename
----)

--select top 10 * from Person
--where PersonID not in (
--select top 10 PersonID from Person
--)





--delete  Person

----修为
--create  Table Level(
----列名 类型 约束(不同列名之间是逗号)identity
--LevelID  int identity(1,1) primary key,
--LevelName varchar(20) not null,
--);

--select * from Level;
--insert into Level(LevelName)
--values ('炼气'),
--('筑基'),
--('结丹'),
--('元婴'),
--('化神'),
--('炼虚'),
--('合体'),
--('大乘'),
--('真仙'),
--('金仙'),
--('太乙玉仙'),
--('大罗天尊'),
--('道祖')


---- 宗门
--create  Table Sect(
----列名 类型 约束(不同列名之间是逗号)identity
--SectID  int identity(1,1) primary key,
--SectName varchar(20) not null,
--);

--select * from Sect;
--insert into Sect(SectName)
--values ('掩月宗'),
--('天阙堡'),
--('清虚门'),
--('巨剑门'),
--('化刀坞'),
--('灵兽山'),
--('黄枫谷'),
--('合欢宗'),
--('鬼灵门'),
--('御灵宗'),
--('天煞宗'),
--('魔焰门'),
--('千幻宗')


----职位
--create  Table Position(
----列名 类型 约束(不同列名之间是逗号)identity
--PositionID  int identity(1,1) primary key,
--PositionName varchar(20) not null,
--);
--delete Position
--select * from Position;
--insert into Position(PositionName)
--values ('太上长老'),
--('掌门'),
--('长老'),
--('精英弟子'),
--('内门弟子'),
--('外门弟子')



--create  Table PersonInfo(
----列名 类型 约束(不同列名之间是逗号)identity
--ID  int identity(1,1) primary key, --主键约束
--PersonID  int references Person(PersonID),--外键约束
--PersonName varchar(40) not null,
--PersonAddress nvarchar(200) not null default('默认地址'),
--Weapon nvarchar(10) not null ,
--Gong nvarchar(10) not null ,
--LongTime int not null,
--PositionID  int  references Position(PositionID), --外键约束
--SectID int references Sect(SectID),--外键约束
--LevelID  int references  Level(LevelID)--外键约束
--);


--select * from PersonInfo;
--insert into PersonInfo(PersonID,PersonName,PersonAddress,Weapon,Gong,LongTime,PositionID,SectID,LevelID)
--values (1,'韩立','越国小山村','青竹蜂云剑','青元剑诀',200,14,7,1),
--(10,'宝花','魔源海5号','玄天花树','怜花指',10000,9,14,8)

--delete  PersonInfo

----多表联合查询1
--select 
-- --PersonInfo.PersonName,
-- --PersonInfo.PersonAddress,
-- --PersonInfo.PersonName,
-- --PersonInfo.Weapon,
-- --PersonInfo.LongTime,
-- PersonInfo.*,
-- Person.PersonName,
-- Position.PositionName,
-- Sect.SectName,
-- Level.LevelName
--from Person,PersonInfo,Position,Sect,Level  
--where  
-- PersonInfo.PersonID=Person.PersonID  and
-- PersonInfo.PositionID=Position.PositionID  and
-- PersonInfo.SectID=Sect.SectID  and
-- PersonInfo.LevelID=Level.LevelID
--order by ID asc

----多表联合查询2
--select 
-- PersonInfo.*,
-- Person.PersonName,
-- Position.PositionName,
-- Sect.SectName,
-- Level.LevelName
--from Person,PersonInfo,Position,Sect,Level  
--where  
-- PersonInfo.PersonID=Person.PersonID  and
-- PersonInfo.PositionID=Position.PositionID  and
-- PersonInfo.SectID=Sect.SectID  and
-- PersonInfo.LevelID=Level.LevelID
--order by ID asc

----多表联合查询 错误的
--select 
-- PersonInfo.*,
-- Person.PersonName,
-- Position.PositionName,
-- Sect.SectName,
-- Level.LevelName
--from Person,PersonInfo,Position,Sect,Level  
--where  
-- PersonInfo.PersonID=Person.PersonID  and
-- PersonInfo.PositionID=Position.PositionID  and
-- PersonInfo.SectID=Sect.SectID  and
-- PersonInfo.LevelID=Level.LevelID and
-- PersonInfo.PersonName like '%青%'   -- 带搜索条件的时候无法用这种方式
--order by ID asc

----多表联合内联查询3
--select 
-- PersonInfo.*,
-- Person.PersonName,
-- Position.PositionName,
-- Sect.SectName,
-- Level.LevelName
--from PersonInfo  
--inner join Person on PersonInfo.PersonID=Person.PersonID
--inner join Position on PersonInfo.PositionID=Position.PositionID
--inner join Sect on PersonInfo.SectID=Sect.SectID
--inner join Level on PersonInfo.LevelID=Level.LevelID
--where PersonInfo.PersonName like '%韩%'
--;

----左联   以左边为基准
--select 
-- PersonInfo.*,
-- Person.PersonName,
-- Position.PositionName,
-- Sect.SectName,
-- Level.LevelName
--from PersonInfo  
--left join Person on PersonInfo.PersonID=Person.PersonID
--left join Position on PersonInfo.PositionID=Position.PositionID
--left join Sect on PersonInfo.SectID=Sect.SectID
--left join Level on PersonInfo.LevelID=Level.LevelID
--where PersonInfo.PersonName like '%韩%'

----右联   以右边为基准
--select 
-- PersonInfo.*,
-- Person.PersonName,
-- Position.PositionName,
-- Sect.SectName,
-- Level.LevelName
--from PersonInfo  
--right join Person on PersonInfo.PersonID=Person.PersonID
--right join Position on PersonInfo.PositionID=Position.PositionID
--right join Sect on PersonInfo.SectID=Sect.SectID
--right join Level on PersonInfo.LevelID=Level.LevelID
--where PersonInfo.PersonName like '%韩%'


--select * from PersonInfo where PersonName like '%青%' or Weapon like '%青%';

---- 删除
--delete from PersonInfo where ID=1;

----更新

--update PersonInfo set PersonName = '韩老魔', PersonAddress='落云宗'  where PersonID=1;




--多表查询--内链接查询
  --select ParkinglotCarID,ParkinglotCarName,EntryTime,OutTime,CarNumber,MoneyByHour,CategroyID, ParkinglotCar.PersonID, PersonName from ParkinglotCar
  --inner join Person on ParkinglotCar.PersonID=Person.PersonID where CategroyID=1003 and ParkinglotCarName like '%龙华%'-- like 像 模糊查询  % 通配符  inner join 内链接
  --delete from ParkinglotCar where ParkinglotCarID=8

-- 增加字段
---- add column `like_count` to douyin_aweme_comment
--alter table douyin_aweme_comment add column `like_count` varchar(255) NOT NULL DEFAULT '0' COMMENT '点赞数';
--alter table xhs_note add column xsec_token varchar(50) default null comment '签名算法';
--alter table douyin_aweme_comment add column `pictures` varchar(500) NOT NULL DEFAULT '' COMMENT '评论图片列表';


------------------------------------权限相关------------------------------------
-- 用户组



  ----这个无法执行删除（因为主键值，已经被外键表使用）
  --delete from Department where DepartmentId=11

  ----如果要强制删除，可以在确保安全的情况下，先删除外键表数据
  --delete from Employee where DepartmentId=11

  ----连接查询和汇总查询
  --select EmployeeName, Gender, NowAddress, IdNo,PostName, DepartmentName,Post.PostId from Employee
  --inner join Post on Employee.PostId=Post.PostId
  --inner join Department on Employee.DepartmentId=Department.DepartmentId

  ----改变列的名称
  --  select 员工姓名=EmployeeName, 性别=Gender, NowAddress as 住址, IdNo,PostName, DepartmentName,Post.PostId from Employee
  --inner join Post on Employee.PostId=Post.PostId
  --inner join Department on Employee.DepartmentId=Department.DepartmentId