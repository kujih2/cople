package kr.spring.market.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import kr.spring.market.vo.MarketChatRoomVO;
import kr.spring.market.vo.MarketChatVO;
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
    public List<MarketVO> selectChatRoomList(Map<String,Object> map); //사용자가 구매자일 경우 채팅방 유무 조회
    public List<MarketVO> selectChatRoomList2(int mem_num); //사용자의 전체 채팅방 조회
    public void insertChatRoom(MarketChatRoomVO chatRoomVO); //채팅방 생성
  	public int selectchatRoomNum(); //채팅방 번호 생성
 

	public int selectChatNum(); //채팅 메시지 번호 생성
  	public void insertChat(MarketChatVO chatVO);//채팅 메시지 등록
  	public List<MarketVO> selectChatDetail(Map<String,Integer> map);//채팅 메시지 읽기
  	public void updateChatRead(Map<String,Integer> map);//읽은 채팅은 읽음으로 바꾸기
  	
}
