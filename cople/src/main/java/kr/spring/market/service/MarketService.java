package kr.spring.market.service;

import java.util.List;
import java.util.Map;

import kr.spring.market.vo.MarketVO;

public interface MarketService {
	 //부모글
		public List<MarketVO> selectList(Map<String,Object> map);
	    public int selectRowCount(Map<String,Object> map);
	    public void insertMarket(MarketVO market);
	    public MarketVO selectMarketDetail(int product_num);
	    public void updateMarket(int product_num);
	    public void deleteMarket(int product_num);
	    public void deleteFile(int product_num);
		//관심목록
	   //채팅
}
