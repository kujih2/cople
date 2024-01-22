--	문서 테이블
create table wiki_doc(
	doc_num number not null,
	doc_name varchar2(150) unique not null,
	constraint wiki_doc_pk primary key(doc_num)
);
create sequence wiki_doc_seq;
--업데이트 테이블
create table wiki_update(
	doc_num number not null,
	update_num number not null,
	update_content clob,
	doc_status number not null,
	update_status number default 1 not null,
	update_writer number not null,
	update_summary varchar2(300),
	update_date date default sysdate not null,
	constraint wiki_update_pk primary key (update_num),
	constraint wiki_update_fk foreign key (doc_num) references wiki_doc (doc_num)
);
create sequence wiki_update_seq;
