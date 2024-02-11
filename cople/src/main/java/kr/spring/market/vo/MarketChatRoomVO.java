package kr.spring.market.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MarketChatRoomVO {
	private int chatRoom_num;
	private Integer product_num;
	private String product_title;
	private String filename0;
	private Integer product_price;
	private Integer seller_num;
	private String seller_id;
	private String seller_nickname;
	private Integer buyer_num;
	private String buyer_id;
	private String buyer_nickname;
	private int product_sale;
	private int chat_count;

}
