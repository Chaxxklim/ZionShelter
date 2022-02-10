package www.gnsoft.zionshelter.mapper;

import org.apache.ibatis.annotations.Mapper;
import www.gnsoft.zionshelter.vo.BoardVO;
import www.gnsoft.zionshelter.vo.CommentVO;

import java.util.List;

@Mapper
public interface CommentMapper {
    List<CommentVO> selectCommentByBoardIdx(BoardVO boardVO);

    void insertCommentByBoardIdx(CommentVO commentVO);

    CommentVO selectLatestComment(CommentVO commentVO);
}
