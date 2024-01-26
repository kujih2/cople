package kr.spring.market.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.market.dao.MarketMapper;
import kr.spring.market.vo.MarketVO;

@Service
@Transactional
public class MarketServiceImpl implements MarketService{
	
	@Autowired
	private MarketMapper marketMapper;
	
	
	@Override
	public List<MarketVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertMarket(MarketVO market) {
		marketMapper.insertMarket(market);
	}

	@Override
	public MarketVO selectMarketDetail(int product_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMarket(int product_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMarket(int product_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFile(int product_num) {
		// TODO Auto-generated method stub
		
	}

}
