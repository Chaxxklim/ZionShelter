package www.gnsoft.zionshelter.mapper;


//import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Mapper;
import www.gnsoft.zionshelter.vo.BoardVO;
import www.gnsoft.zionshelter.vo.CommentVO;

import java.util.List;

@Mapper
public interface BoardMapper {

    List<BoardVO> selectAllFreeBoard();

    void testInsert();

    BoardVO selectFreeBoard(BoardVO boardVO);


    void insertBoard(BoardVO boardVO);
}
