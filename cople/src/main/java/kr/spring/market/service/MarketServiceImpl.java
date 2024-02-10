package kr.spring.market.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.market.dao.MarketMapper;
import kr.spring.market.vo.MarketChatRoomVO;
import kr.spring.market.vo.MarketChatVO;
import kr.spring.market.vo.MarketVO;
import kr.spring.member.dao.MemberMapper;
import kr.spring.member.vo.MemberVO;

@Service
@Transactional
public class MarketServiceImpl implements MarketService{
	
	@Autowired
	private MarketMapper marketMapper;
	@Autowired
	private MemberMapper memberMapper;
	
	
	@Override
	public List<MarketVO> selectList(Map<String, Object> map) {
		List<MarketVO> list = marketMapper.selectList(map);
		if (list!=null) {
			for (MarketVO each : list) {
		        Integer sellerNum = each.getProduct_seller();
		        if (sellerNum != null) {
		            MemberVO member = memberMapper.selectMember(sellerNum);
		            if (member != null) {
		                each.setSeller_id(member.getId());
		               each.setSeller_nickname(member.getNick_name());
		            }
		        }
		    }
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
		MarketVO vo =  marketMapper.selectMarketDetail(product_num);
		Integer sellerNum = vo.getProduct_seller();
		Integer buyerNum = vo.getProduct_buyer();
		if(sellerNum!=null) {
			 MemberVO member = memberMapper.selectMember(sellerNum);
			 if(member!=null) {
				 vo.setSeller_id(member.getId());
				 vo.setSeller_nickname(member.getNick_name());
				 vo.setMarket_score(member.getMarket_score());
			 }
		}
		if(buyerNum!=null) {
			MemberVO member = memberMapper.selectMember(buyerNum);
			if(member!=null) {
				vo.setBuyer_id(member.getId());
				vo.setBuyer_nickname(member.getNick_name());
			}
		}
		
		return vo;
	}
	@Override
	public void updateMarket(int product_num) {
		marketMapper.updateMarket(product_num);
		
	}

	@Override
	public void deleteMarket(int product_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFile(int product_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int selectChatRoomCheck(Map<String, Object> map) {
		int check = marketMapper.selectChatRoomCheck(map);
		
		return check;
	}
	@Override
	public List<MarketChatRoomVO> selectChatRoomList(int mem_num) {
		List<MarketChatRoomVO> list =  marketMapper.selectChatRoomList(mem_num);
		if (list!=null) {
			for (MarketChatRoomVO each : list) {
			        Integer sellerNum = each.getSeller_num();
			        if (sellerNum != null) {
			            MemberVO member = memberMapper.selectMember(sellerNum);
			            if (member != null) {
			                each.setSeller_id(member.getId());
			                each.setSeller_nickname(member.getNick_name());
			            }
			        }
		            Integer buyerNum = each.getBuyer_num();
			        if (sellerNum != null) {
			            MemberVO member = memberMapper.selectMember(buyerNum);
			            if (member != null) {
			                each.setBuyer_id(member.getId());
			                each.setBuyer_nickname(member.getNick_name());
			            	}
			        }
			        
				}
		}
		return list;
	}
	@Override
	public void insertChatRoom(MarketChatRoomVO chatRoomVO) {
		marketMapper.insertChatRoom(chatRoomVO);
		
	}

	@Override
	public void insertChat(MarketChatVO chatVO) {
		marketMapper.insertChat(chatVO);
		
	}


	@Override
	public MarketChatRoomVO selectChatRoom(Map<String, Object> map) {
		return marketMapper.selectChatRoom(map);
	}

	@Override
	public MarketChatRoomVO selectChatRoomDetail(int chatRoom_num) {
		MarketChatRoomVO vo = marketMapper.selectChatRoomDetail(chatRoom_num);
		if(vo.getSeller_num() != null) {
			 MemberVO member = memberMapper.selectMember(vo.getSeller_num());
	            if (member != null) {
	                vo.setSeller_id(member.getId());
	                vo.setSeller_nickname(member.getNick_name());
	            }
		}
		if(vo.getBuyer_num() != null) {
			MemberVO member = memberMapper.selectMember(vo.getBuyer_num());
			if (member != null) {
				vo.setBuyer_id(member.getId());
				vo.setBuyer_nickname(member.getNick_name());
			}
		}
		return vo;
	}

	@Override
	public List<MarketChatVO> selectChatDetail(Map<String,Integer> map) {
		
		marketMapper.updateChatRead(map);
		
		List<MarketChatVO> list = marketMapper.selectChatDetail(map);
		if (list!=null) {
			for (MarketChatVO each : list) {
			        Integer memNum = each.getMem_num();
			        if (memNum != null) {
			            MemberVO member = memberMapper.selectMember(memNum);
			            if (member != null) {
			                each.setMem_id(member.getId());
			                each.setMem_nickname(member.getNick_name());
			            }
			        }
		            
			        
				}
		}
		
		return list;
	}

	

	

	
	

}
