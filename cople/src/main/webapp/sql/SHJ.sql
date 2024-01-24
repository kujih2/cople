create table emp(
	emp_num number not null,
	comsize_status number not null,
	comsize varchar2(100) not null,
	compeople_status number not null,
	compeople varchar2(100) not null,
	field_status number not null,
	field number not null,
	role_status number not null,
	role varchar2(100) not null,
	career_status number not null,
	career varchar2(100) not null,
	salary_status number not null,
	salary varchar2(100) not null,
	periodtime_status number not null,
	periodtime varchar2(100) not null,
	education_status number not null,
	education varchar2(100) not null,
	major_status number not null,
	major varchar2(100) not null,
	certification_status number not null,
	certification varchar2(100) not null,
	location_status number not null,
	location varchar2(150) not null,
	workstart_status number not null,
	workstart varchar2(100) not null,
	mem_num number not null,
	filename varchar2(300) not null,
	advice varchar2(300) not null,
	location_api varchar2(300) not null,
	constraint emp_pk primary key (emp_num),
	constraint emp_fk foreign key (mem_num) references member(mem_num)
);

create sequence emp_seq;

create table letter(
	letter_num number not null,
	sender number not null,
	receiver number not null,
	letter_content clob not null,
	date_sent date not null,
	date_read date,
	receiv_del number DEFAULT 0,
	sent_del number DEFAULT 0,
	letter_ip varchar2(30) not null,
	letter_status number default 0,
	constraint letter_pk primary key (letter_num),
	constraint letter_fk1 foreign key (sender) references member(mem_num),
	constraint letter_fk2 foreign key (receiver) references member(mem_num)
);

create sequence letter_seq;

create table advice(
	advice_num number not null,
	sender number not null,
	receiver number not null,
	letter_content clob not null,
	date_sent date not null,
	date_read date,
	receiv_read number not null,
	receive_del number default 0,
	sent_del number default 0,
	advice_complete number default 0,
	letter_ip varchar2(30) not null,
	filename varchar2(300) not null,
	constraint advice_pk primary key (advice_num),
	constraint advice_fk1 foreign key (sender) references member(mem_num),
	constraint advice_fk2 foreign key (receiver) references member(mem_num)
);

create sequence advice_seq;

create table mchatroom(
	mchatroom_num number not null,
	sender number not null,
	receiver number not null,
	constraint mchatroom_pk primary key (mchatroom_num),
	constraint mchatroom_fk1 foreign key (sender) references member(mem_num),
	constraint mchatroom_fk2 foreign key (receiver) references member(mem_num)
);

create sequence mchatroom_seq;

create table mchat(
	mchat_num number not null,
	mchatroom_num number not null,
	mem_num number not null,
	message clob not null,
	reg_date date not null,
	ip varchar2(30) not null,
	read_check number default 0,
	constraint mchat_pk primary key (mchat_num),
	constraint mchat_fk1 foreign key (mchatroom_num) references mchatroom (mchatroom_num),
	constraint mchat_fk2 foreign key (mem_num) references member(mem_num)
);

create sequence mchat_seq;