package kr.spring.market.vo;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MarketChatVO {
	private int chat_num;
	private int chatRoom_num;
	private int mem_num;
	private String mem_id;
	private String mem_nickname;
	private String chat_message;
	private String chat_regDate;
	private int chat_readCheck;
	private int chat_saleCommit;//구매확정요청 메시지 인지 판별
}
