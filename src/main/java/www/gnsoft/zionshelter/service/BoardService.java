package www.gnsoft.zionshelter.service;

import www.gnsoft.zionshelter.vo.BoardVO;
import www.gnsoft.zionshelter.vo.CommentVO;

import java.util.List;


public interface BoardService {

    List<BoardVO> selectAllFreeBoard();

    void testInsert();

    BoardVO selectFreeBoard(Long boardIdx);

    List<CommentVO> selectCommentByBoardIdx(Long boardIdx);

    CommentVO insertComment(CommentVO commentVO);

    void insertBoard(BoardVO boardVO);
}
