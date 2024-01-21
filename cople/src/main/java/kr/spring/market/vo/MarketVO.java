package kr.spring.market.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MarketVO {
	private int product_num;
	@NotBlank
	private String product_title;
	private int product_seller;
	private int product_buyer;
	@NotBlank
	private String product_photo1;
	private String product_photo2;
	private String product_photo3;
	private String product_photo4;
	@NotBlank
	private String product_content;
	private int product_category;
	private int product_price;
	private String product_place; 
	private String product_placeDetail;
	private int product_sale;
	private String product_buyerReview;
	private String product_sellerRevuew;
	private int product_status;
	private Date product_regDate;
	private Date product_modifyDate;
	private Date product_soldDate;
	
}
