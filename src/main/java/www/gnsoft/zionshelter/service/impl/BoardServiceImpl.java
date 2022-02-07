package www.gnsoft.zionshelter.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import www.gnsoft.zionshelter.mapper.BoardMapper;
import www.gnsoft.zionshelter.service.BoardService;
import www.gnsoft.zionshelter.vo.BoardVO;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private BoardMapper boardMapper;

    @Autowired
    public BoardServiceImpl(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    @Override
    public List<BoardVO> selectAllBoard() {

        return boardMapper.selectAllBoard();
    }

    @Override
    public void testInsert() {
        boardMapper.testInsert();
    }
}
