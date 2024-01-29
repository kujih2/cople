package kr.spring.market.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.market.dao.MarketMapper;
import kr.spring.market.vo.MarketVO;
import kr.spring.member.dao.MemberMapper;
import kr.spring.member.vo.MemberVO;

@Service
@Transactional
public class MarketServiceImpl implements MarketService{
	
	@Autowired
	private MarketMapper marketMapper;
	private MemberMapper memberMapper;
	
	
	@Override
	public List<MarketVO> selectList(Map<String, Object> map) {
		List<MarketVO> list = marketMapper.selectList(map);
		MemberVO member = new MemberVO();
		for(MarketVO each : list) {
			System.out.println(each.getProduct_seller());
			member = memberMapper.selectMember(each.getProduct_seller());
			each.setSeller_name(member.getName());
		}
		return list;
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return marketMapper.selectRowCount(map);
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
