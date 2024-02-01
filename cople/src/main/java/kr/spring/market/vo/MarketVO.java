package kr.spring.market.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MarketVO {
	private int product_num;
	private String product_title;
	private Integer product_seller;
	private String seller_id;
	private String seller_nickname;
	private Integer product_buyer;
	private String buyer_id;
	private String buyer_nickname;
	private String filename0;
	private String filename1;
	private String filename2;
	private String filename3;
	private MultipartFile[] upload;
	private String product_content;
	private int product_category;
	private Integer product_price;
	private String product_place; 
	private String product_placeDetail;
	private int product_sale;
	private String product_buyerReview;
	private String product_sellerRevuew;
	private int product_status;
	private Date product_regDate;
	private Date product_modifyDate;
	private Date product_soldDate;
	private int market_score;
	
}
