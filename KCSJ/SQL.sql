drop table manager;
create table manager(
  mid number primary key,
  mname varchar2(20) not null,
  mpassword varchar2(35) not null,
  mcard varchar2(20) not null
);
--test

--删除原来存在的序列
drop sequence manager_seq;
--创建序列
create sequence manager_seq start with 1 increment by 1;
--插入数据
insert into manager values(manager_seq.nextval,'pp','111111','431202199611300017');


--删除原来的emp表
drop table emp;

create table emp(
  empno number(5)  primary key,
  ecard varchar2(20) not null,
  epassword varchar2(35) not null,
  ename varchar2(10) not null,
  esex varchar2(8) constraint emp_ck_sex check(esex in('男','女')),
  eage number(3) constraint empl_ck_age check(eage between 18 and 60),
  esal number(7,2) not null
);
drop sequence emp_seq;
--创建序列
create sequence emp_seq start with 100 minvalue 100 increment by 1;

--增加数据
insert into emp values(emp_seq.nextval,431202199611300000,'f379eaf3c831b04de153469d1bec345e','pp','男',25,2500);
insert into emp values(emp_seq.nextval,431202199611300001,'f379eaf3c831b04de153469d1bec345e','张弘毅','男',25,2500);
insert into emp values(emp_seq.nextval,431202199611300002,'f379eaf3c831b04de153469d1bec345e','顾思涛','男',25,2500);
insert into emp values(emp_seq.nextval,431202199611300003,'f379eaf3c831b04de153469d1bec345e','贺成','男',18,2500);


--房间信息表
drop table room;
create table room(
  rmno number(4) primary key,
  rmtype varchar2(10)  constraint room_ck_rmtype check(rmtype in('单人间','双人间','电脑房')),
  rmprice number(5,2) not null,
  vprice number(5,2) not null,
  rmbuff varchar2(10) check(rmbuff in('有人','无人')),
  rmbook varchar2(20) check(rmbook in('已预订','无人预订')),
  rydate  varchar2(20)
);


drop sequence room_seq;
--创建序列
create sequence room_seq start with 100 minvalue 100 increment by 1;
--加入数据
insert into room values(room_seq.nextval,'单人间',95,82,'有人','无人预订',null);
insert into room values(room_seq.nextval,'单人间',95,82,'无人','无人预订',null);
insert into room values(room_seq.nextval,'单人间',100,85,'有人','无人预订',null);
insert into room values(room_seq.nextval,'单人间',102,86,'有人','无人预订',null);
insert into room values(room_seq.nextval,'单人间',105,82,'有人','无人预订',null);
insert into room values(room_seq.nextval,'单人间',105,82,'无人','无人预订',null);
insert into room values(room_seq.nextval,'单人间',100,85,'有人','无人预订',null);
insert into room values(room_seq.nextval,'单人间',102,96,'无人','无人预订',null);
insert into room values(room_seq.nextval,'单人间',110,95,'无人','无人预订',null);
insert into room values(room_seq.nextval,'单人间',100,95,'无人','无人预订',null);
insert into room values(room_seq.nextval,'双人间',160,147,'无人','无人预订',null);
insert into room values(room_seq.nextval,'双人间',180,167,'无人','无人预订',null);
insert into room values(room_seq.nextval,'双人间',160,155,'无人','无人预订',null);
insert into room values(room_seq.nextval,'双人间',170,160,'无人','无人预订',null);
insert into room values(room_seq.nextval,'双人间',185,168,'无人','无人预订',null);
insert into room values(room_seq.nextval,'双人间',180,177,'无人','无人预订',null);
insert into room values(room_seq.nextval,'双人间',185,175,'无人','无人预订',null);
insert into room values(room_seq.nextval,'双人间',190,165,'无人','无人预订',null);
insert into room values(room_seq.nextval,'双人间',182,177,'无人','无人预订',null);
insert into room values(room_seq.nextval,'双人间',195,188,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',210,200,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',220,200,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',230,210,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',255,240,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',230,210,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',210,200,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',200,190,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',200,195,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',195,190,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',205,200,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',210,200,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',210,200,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',200,190,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',190,185,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',200,190,'无人','无人预订',null);
insert into room values(room_seq.nextval,'电脑房',225,200,'无人','无人预订',null);


drop table menus;
--餐饮表
 create table menus(
   mno number(5) primary key,
   msname varchar2(10) not null,
   msfee number(4,1) not null,
   mvfee number(4,1) not null
 );
drop sequence menus_seq;
--创建序列
create sequence menus_seq start with 100 minvalue 100 increment by 1;
insert into menus values(menus_seq.nextval,'辣椒炒肉',15,10);
insert into menus values(menus_seq.nextval,'土豆烧肉',15,10);
insert into menus values(menus_seq.nextval,'铁板牛肉',15,10);
insert into menus values(menus_seq.nextval,'红烧肉',15,10);
insert into menus values(menus_seq.nextval,'茄子烧肉',15,10);
insert into menus values(menus_seq.nextval,'绿豆汁/杯',8,7);
insert into menus values(menus_seq.nextval,'红豆汁/杯',8,7);
insert into menus values(menus_seq.nextval,'可乐/大杯',8,7);
insert into menus values(menus_seq.nextval,'可乐/小杯',7,6);
insert into menus values(menus_seq.nextval,'鸡翅/5对',25,23);
insert into menus values(menus_seq.nextval,'汉堡/个',15,13);
insert into menus values(menus_seq.nextval,'矿泉水/瓶',5,4);
insert into menus values(menus_seq.nextval,'五粮液/瓶',50,48);







drop table client;
--客户表
create table client(
  cid number primary key,
  cname varchar2(10) not null,
  ccard varchar2(20) not null,
  ctel number(15) not null,
  rmno references room(rmno),
  --cding number(5,2) not null,
  --cfee number(5,2),
  cmfee number(5,2),
  cdate varchar2(20)
  --cedate varchar2(30)
);
drop sequence client_seq;
--创建序列
create sequence client_seq start with 0 minvalue 0 increment by 1;


--删除原表
drop table vip; 
--vip表
create table vip(
 vno number(3) primary key,
 vname varchar2(10) not null,
 vcard varchar2(20) not null,
 rmno references room(rmno),
 vtel number(15) not null,
 --饭钱
 vfee number(5,2),
 --房费
 --vmfee number(5,2),
 vdate varchar2(20)
);
--删除序列
drop sequence vip_seq ;
--创建序列
create sequence vip_seq start with 100 minvalue 100 increment by 1;
--增加会员
insert into vip values(vip_seq.nextval,'庞攀','431202199611300017',null,13787019873,0,'空');
insert into vip values(vip_seq.nextval,'肖鑫','432501199607137019',null,18273763006,0,'空');
insert into vip values(vip_seq.nextval,'pp','432501199607137018',null,18273763215,0,'空');

drop table history;
--历史记录表
create table history(
  id number primary key,
  hname varchar2(10),
  hcard varchar2(20),
  htel number(11),
  hrmno number(5),
  htype varchar2(10),
  hydate varchar2(20),
  hyedate varchar2(20),
  hdate varchar2(30),
  hedate varchar2(30),
  hallfee number(5,2),
  hshijian varchar2(10)
);
// alter table history modify hname varchar2(30);
--删除序列
drop sequence his_seq;
--创建序列
create sequence his_seq start with 0 minvalue 0 increment by 1;










