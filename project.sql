drop table Gproduct;
drop table Gboardo;
drop table Gboardx;
drop table Greplyo;
drop table Greplyx;

create table Gmember(
	id 			varchar2(20) 	primary key,
	pass 		varchar2(30) 	not null,
	name 		varchar2(10) 	not null,
	addr 		varchar2(50) 	not null,
	tel 		varchar2(20)	not null,
	email 		varchar2(50) 	not null,
	gender 		char(1) 		not null,
	birthday 	date 			not null
);
alter table Gmember modify(tel varchar2(20));
select * from GMEMBER;
insert into GMEMBER values('master','master','마스터','서울특별시 강남구 역삼동',
'01011112222','master@master.com','M',sysdate);

create table Gproduct(
	pro_num number primary key,
	pro_cate varchar2(30) not null,
	pro_name varchar2(30) not null,
	pro_price number not null,
	pro_sale number default 0,
	pro_info varchar2(4000) not null,
	pro_image varchar2(20) default 'default.jpg',
	pro_date date not null,
	pro_count number not null,
	pro_sell number default 0,
	pro_read number default 0
);

create table Gboardo(
	bo_num number primary key,		
	bo_subject varchar2(30) not null,
	bo_content varchar2(4000) not null,
	bo_date date not null,
	bo_image varchar2(30) default 'default.jpg',
	bo_read number default 0,
	bo_star number default 0,
	bo_del char(1) default 'n',
	id varchar2(20),
	pro_num number references Gproduct(pro_num)
);
select * from Gboardo;
-- �븘吏� �븘�씠�뵒 �뿰�룞�� �븞�븳 �긽�깭�씪 id而щ읆 洹몃깷 �깮�꽦

create table Gboardx(
	bx_num number primary key,
	bx_subject varchar2(30) not null,	
	bx_content varchar2(4000) not null,
	bx_categ varchar2(30) not null,
	bx_date date not null,
	bx_read number default 0,
	bx_del char(1) default 'n',
	id varchar2(20),
	bn_num number default 1,
	bq_num number default 1,
	bx_rep number default 0
);
-- bn_num�� 怨듭�寃뚯떆�뙋踰덊샇, bq_num�� qna寃뚯떆�뙋踰덊샇
create sequence bq_num nocache;
create sequence bn_num nocache;
-- �떆���뒪濡� 踰덊샇 利앷��꽕�젙

create table Greplyo (
	reo_num number primary key,
	reo_content varchar2(100) not null,
	reo_date date not null,
	reo_del char(1) default 'n',	
	bo_num number references Gboardo(bo_num),
	id varchar2(20)
);
-- �긽�뭹�룊媛�履� �뙎湲� 寃뚯떆�뙋

create table Greplyx (
	rex_num number primary key,
	rex_content varchar2(100) not null,
	rex_date date not null,
	rex_del char(1) default 'n',
	id varchar2(20),
	bx_num number references Gboardx(bx_num)
);
-- qna寃뚯떆�뙋履� �뙎湲�寃뚯떆�뙋

select * from Gboardx;
select * from Gboardo;
select * from Greplyo;
select * from Greplyx;
select * from Gproduct;

-------------------------------------------------------


select * from gmember;
insert into gmember values ('123','123','123','123',123,'123',1,'1999-12-12');