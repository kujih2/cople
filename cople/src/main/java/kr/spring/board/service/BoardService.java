package kr.spring.board.service;

import java.util.List;
import java.util.Map;

import kr.spring.board.vo.BoardFavVO;
import kr.spring.board.vo.BoardReplyVO;
import kr.spring.board.vo.BoardVO;

public interface BoardService {
	//게시글
	public List<BoardVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertBoard(BoardVO board);
	public BoardVO detailBoard(int board_num);
	public void updateHit(int board_num);
	public void updateBoard(BoardVO board);
	public void deleteBoard(int board_num);
	
	//좋아요
	public BoardFavVO selectFav(BoardFavVO fav);
	public int selectFavCount(int board_num);
	public int selectHateCount(int board_num);
	public int selectFavHateSum(int board_num);
	public void insertFav(BoardFavVO fav);
	public void switchFav(BoardFavVO fav);
	public void updateFav(BoardFavVO fav);
	public void deleteFav(BoardFavVO boardFav);
	
	//댓글
	public List<BoardReplyVO> selectListReply(Map<String,Object> map);
	public int selectRowCountReply(Map<String,Object> map);
	public BoardReplyVO selectReply(int re_num);
	public void insertReply(BoardReplyVO boardReplyVO);
	public void insertReplies (BoardReplyVO boardReplyVO);
	public void updateReply(BoardReplyVO boardReplyVO);
}
