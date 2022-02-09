package www.gnsoft.zionshelter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import www.gnsoft.zionshelter.service.BoardService;
import www.gnsoft.zionshelter.service.MemberService;
import www.gnsoft.zionshelter.vo.BoardVO;

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
        model.addAttribute("boardVO", boardVO);
        return "freeBoardDetailView";
    }
}
