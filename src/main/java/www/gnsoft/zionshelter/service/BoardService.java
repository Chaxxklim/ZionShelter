package www.gnsoft.zionshelter.service;

import www.gnsoft.zionshelter.vo.BoardVO;

import java.util.List;


public interface BoardService {

    List<BoardVO> selectAllFreeBoard();

    void testInsert();

    BoardVO selectFreeBoard(Long boardIdx);
}
