package www.gnsoft.zionshelter.mapper;


//import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Mapper;
import www.gnsoft.zionshelter.vo.BoardVO;

import java.util.List;

@Mapper
public interface BoardMapper {

    List<BoardVO> selectAllBoard();

    void testInsert();
}
