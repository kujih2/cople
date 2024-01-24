--상품 테이블
CREATE TABLE market_product(
  product_num NUMBER NOT NULL PRIMARY KEY, -- 상품의 식별번호
  product_title VARCHAR2(15) NOT NULL, -- 상품 글의 제목
  product_seller NUMBER NOT NULL, -- 판매자의 식별번호
  product_buyer NUMBER, -- 구매자의 식별번호
  product_photo1 VARCHAR2(200) NOT NULL, -- 상품사진 1
  product_photo2 VARCHAR2(200), -- 상품사진2
  product_photo3 VARCHAR2(200), -- 상품사진3
  product_photo4 VARCHAR2(100), -- 상품사진4
  product_content VARCHAR2(200) NOT NULL, -- 상품의 설명
  product_category NUMBER(1) NOT NULL, -- 0:중고, 1:나눔 
  product_price NUMBER DEFAULT 0, -- 상품 가격 0
  product_place VARCHAR2(50), -- 거래 장소
  product_placeDetail VARCHAR2(50), -- 거래 장소 상세
  product_sale NUMBER(1) NOT NULL, -- 판매현황 (0:판매중, 1:거래완료)
  product_buyerReview VARCHAR2(100), -- 구매자 리뷰
  product_sellerReview VARCHAR2(100), -- 판매자 리뷰
  product_status NUMBER DEFAULT 0 NOT NULL, -- 판매글의 상태(0:열람가능, 1:신고 처리 완료)
  product_regDate DATE DEFAULT SYSDATE NOT NULL, -- 글 작성일
  product_modifyDate DATE, -- 글 수정일
  product_soldDate DATE, -- 거래완료가 된 날짜
  constraint market_product_fk1 foreign key (product_seller) references member (mem_num),
 constraint market_product_fk2 foreign key (product_buyer) references member (mem_num)
);

create sequence market_product_seq;

-- 장터 관심 목록
create table market_interest(
 product_num number not null, --상품번호
 mem_num number not null,  --회원번호
 constraint market_interest_fk1 foreign key (product_num) references market_product (product_num),
 constraint market_interest_fk2 foreign key (mem_num) references member (mem_num)
);

--장터 채팅방
create table market_chatRoom(
 chatRoom_num number not null PRIMARY KEY, --채팅방 번호
 product_num number not null, --상품 식별번호
 seller_num number not null, --판매자 식별번호
 buyer_num number not null, --구매자 식별번호
 constraint market_chatRoom_fk1 foreign key (product_num) references market_product (product_num),
 constraint market_chatRoom_fk2 foreign key (seller_num) references member (mem_num),
 constraint market_chatRoom_fk3 foreign key (buyer_num) references member (mem_num)
);
create sequence market_chatRoom_seq;
--장터 채팅글
create table market_chat(
 chat_num number not null primary key, --채팅글 고유번호
 chatRoom_num number not null, --채팅방 고유번호
 mem_num number not null, --사용자 고유번호
 chat_message varchar2(900) not null, --체팅 내용
 chat_regDate date default sysdate not null, -- 채팅 날짜
 chat_readCheck number(1) not null, --읽음 상태 (0:읽음, 1:읽지 않음)
 constraint market_chat_fk1 foreign key (chatRoom_num) references market_chatRoom (chatRoom_num),
 constraint market_chat_fk2 foreign key (mem_num) references member (mem_num)
);
create sequence market_chat_seq;