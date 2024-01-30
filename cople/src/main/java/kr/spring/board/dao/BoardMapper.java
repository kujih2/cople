package kr.spring.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.board.vo.BoardFavVO;
import kr.spring.board.vo.BoardVO;

@Mapper
public interface BoardMapper {
	//작성글
		public List<BoardVO> selectList(Map<String,Object> map);
		public int selectRowCount(Map<String,Object> map);
		public void insertBoard(BoardVO board);
		public BoardVO detailBoard(int board_num);
		@Update("UPDATE commu_board SET hit=hit+1 WHERE board_num=#{board_num}")
		public void updateHit(int board_num);
		public void updateBoard(BoardVO board);
		@Delete("DELETE FROM commu_board WHERE board_num=#{board_num}")
		public void deleteBoard(int board_num);
		
	//좋아요
		@Select("SELECT * FROM commu_fav WHERE board_num=#{board_num} AND mem_num=#{mem_num}")
		public BoardFavVO selectFav(BoardFavVO fav);
		@Select("SELECT COUNT(*) FROM commu_fav WHERE board_num=#{board_num} AND fav_status=1")
		public int selectFavCount(int board_num);
		@Select("SELECT COUNT(*) FROM commu_fav WHERE board_num=#{board_num} AND fav_status=2")
		public int selectHateCount(int board_num);
		@Insert("INSERT INTO commu_fav (board_num,mem_num,fav_status) "
			  + "VALUES (#{board_num},#{mem_num},#{fav_status})")
		public void insertFav(BoardFavVO fav);
		@Update("UPDATE commu_fav SET fav_status = CASE WHEN fav_status = 1 THEN 2 ELSE 1 END WHERE board_num=#{board_num} AND mem_num=#{mem_num}")
		public void switchFav(BoardFavVO fav);
		@Update("UPDATE commu_fav SET fav_status=#{fav_status} WHERE board_num=#{board_num} AND mem_num=#{mem_num}")
		public void updateFav(BoardFavVO fav);
		@Delete("DELETE FROM commu_fav WHERE board_num=#{board_num} AND mem_num=#{mem_num}")
		public void deleteFav(BoardFavVO boardFav);
		public void deleteFavBoardNum(int board_num);
}
