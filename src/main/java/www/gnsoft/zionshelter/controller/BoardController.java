package www.gnsoft.zionshelter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import www.gnsoft.zionshelter.service.BoardService;
import www.gnsoft.zionshelter.vo.BoardVO;
import www.gnsoft.zionshelter.vo.CommentVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {

    private final BoardService boardService;

    @Autowired
    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @RequestMapping("/freeBoardList")
    public String boardList(Model model){
        List<BoardVO> boardVOList = boardService.selectAllFreeBoard();
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
    @ResponseBody
    public Map<String, Object> commentPost(@RequestBody Map<String, Object> map){

        CommentVO commentVO = new CommentVO();
        commentVO.setBoardIdx(Long.parseLong((String) map.get("boardIdx")));
        commentVO.setCommentContent((String) map.get("commentContent"));
        commentVO.setMemberIdx(Long.parseLong((String) map.get("memberIdx")));
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("insertCommentVO", boardService.insertComment(commentVO));
        return resultMap;

    }

    @RequestMapping("/boardWrite")
    public String boardWrite(Model model){
        BoardVO boardVO = new BoardVO();
        model.addAttribute(boardVO);
        return "boardWrite";
    }

    @RequestMapping("/boardWritePost")
    public String boardWrite(@ModelAttribute("boardVO") BoardVO boardVO){
        boardService.insertBoard(boardVO);
        return "redirect:freeBoardList";
    }

    @RequestMapping("/calculator")
    public String calculator(){
        return "calculator";
    }

    @RequestMapping("/calculator2")
    public String calculator2(){
        return "calculator2";
    }


    @RequestMapping("/calculator3")
    public String calculator3(){
        return "calculator3";
    }

}