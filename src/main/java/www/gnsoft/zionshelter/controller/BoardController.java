package www.gnsoft.zionshelter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import www.gnsoft.zionshelter.service.BoardService;
import www.gnsoft.zionshelter.service.MemberService;
import www.gnsoft.zionshelter.vo.BoardVO;
import www.gnsoft.zionshelter.vo.CommentVO;

import java.util.List;

@Controller
public class BoardController {
    private final MemberService memberService;
    private final BoardService boardService;

    public BoardController(MemberService memberService, BoardService boardService) {
        this.memberService = memberService;
        this.boardService = boardService;
    }


    @RequestMapping("/freeBoardList")
    public String boardList(Model model){
        List<BoardVO> boardVOList = boardService.selectAllFreeBoard();
        System.out.println("test : " + boardService.selectAllFreeBoard());
        model.addAttribute("boardVOList", boardVOList);

        return "freeBoardList";
    }

    @GetMapping("/freeBoardDetail")
    public String boardDetail(@RequestParam Long boardIdx, Model model){

        BoardVO boardVO = boardService.selectFreeBoard(boardIdx);
        List<CommentVO> commentVOList = boardService.selectCommentByBoardIdx(boardIdx);
        CommentVO commentVO = new CommentVO();
        model.addAttribute("boardVO", boardVO);
        model.addAttribute("commentVOList", commentVOList);
        model.addAttribute("commentVO", commentVO);
        return "freeBoardDetailView";
    }

    @PostMapping("/commentPost")
    public String commentPost(@ModelAttribute("commentVO") CommentVO commentVO){
        System.out.println(commentVO);
        return null;

    }
}
