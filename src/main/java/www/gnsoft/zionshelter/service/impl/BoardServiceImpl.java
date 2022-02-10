package www.gnsoft.zionshelter.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import www.gnsoft.zionshelter.mapper.BoardMapper;
import www.gnsoft.zionshelter.mapper.CommentMapper;
import www.gnsoft.zionshelter.service.BoardService;
import www.gnsoft.zionshelter.vo.BoardVO;
import www.gnsoft.zionshelter.vo.CommentVO;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private BoardMapper boardMapper;
    private CommentMapper commentMapper;

    @Autowired
    public BoardServiceImpl(BoardMapper boardMapper, CommentMapper commentMapper) {
        this.boardMapper = boardMapper;
        this.commentMapper = commentMapper;
    }


    @Override
    public List<BoardVO> selectAllFreeBoard() {
        return boardMapper.selectAllFreeBoard();
    }

    @Override
    public void testInsert() {
        boardMapper.testInsert();
    }

    @Override
    public BoardVO selectFreeBoard(Long boardIdx) {
        BoardVO boardVO = new BoardVO();
        boardVO.setBoardIdx(boardIdx);
        return boardMapper.selectFreeBoard(boardVO);
    }

    @Override
    public List<CommentVO> selectCommentByBoardIdx(Long boardIdx) {
        BoardVO boardVO = new BoardVO();
        boardVO.setBoardIdx(boardIdx);
        return commentMapper.selectCommentByBoardIdx(boardVO);
    }

    @Override
    public CommentVO insertComment(CommentVO commentVO) {
        commentMapper.insertCommentByBoardIdx(commentVO);
        return commentMapper.selectLatestComment(commentVO);

    }

    @Override
    public void insertBoard(BoardVO boardVO) {
        boardMapper.insertBoard(boardVO);
    }
}
