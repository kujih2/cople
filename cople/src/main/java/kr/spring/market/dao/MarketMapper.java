package kr.spring.market.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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
    public MarketChatRoomVO selectChatRoom(Map<String,Object> map);//존재한 채팅방의 번호 조회
    public	int selectChatRoomCheck(Map<String,Object> map); //사용자가 구매자일 경우 채팅방 유무 조회
    public List<MarketChatRoomVO> selectChatRoomList(int mem_num); //사용자의 전체 채팅방 조회
    public	MarketChatRoomVO selectChatRoomDetail(int chatRoom_num); //선택된 채팅방의 상품정보 구하기
    public void insertChatRoom(MarketChatRoomVO chatRoomVO); //채팅방 생성
 

	
  	public void insertChat(MarketChatVO chatVO);//채팅 메시지 등록
  	public void insertCommitChat(MarketChatVO chatVO);//구매확정요청 채팅 메시지 등록
  	public List<MarketChatVO> selectChatDetail(Map<String,Integer> map);//채팅 메시지 읽기
  	@Select("SELECT COUNT(*) FROM market_chat WHERE chatRoom_num=#{chatRoom_num} AND mem_num != #{mem_num} AND chat_readCheck = 1")
  	public int selectCountChat(@Param(value="chatRoom_num")int chatRooom_num,@Param(value="mem_num")int mem_num);
  	public void updateChatRead(Map<String,Integer> map);//읽은 채팅은 읽음으로 바꾸기
  	public void updateProductSale(int product_num);//구매한 상품 판매완료로 바꾸기
  	
  	public void deleteChat(int chatRoom_num);
  	public void deleteChatRoom(int chatRoom_num); //채팅방 삭제
  	
}
