package kr.spring.market.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.market.vo.MarketVO;

@Mapper
public interface MarketMapper {
   //부모글
	public List<MarketVO> selectList(Map<String,Object> map);
    public int selectRowCount(Map<String,Object> map);
    public void insertMarket(MarketVO marketVO);
    public MarketVO selectMarketDetail(int product_num);
    public void updateMarket(int product_num);
    public void deleteMarket(int product_num);
    public void deleteFile(int product_num);
	//관심목록
   //채팅
}
