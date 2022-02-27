package www.gnsoft.zionshelter.controller;

import com.sun.org.apache.xpath.internal.operations.Mult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import www.gnsoft.zionshelter.service.BoardService;
import www.gnsoft.zionshelter.service.MemberService;
import www.gnsoft.zionshelter.vo.BoardVO;
import www.gnsoft.zionshelter.vo.CommentVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {

    private final MemberService memberService;
    private final BoardService boardService;

    @Autowired
    public BoardController(MemberService memberService, BoardService boardService) {
        this.memberService = memberService;
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
        System.out.println(boardVO);
        System.out.println(boardVO.getFile().getName());
        System.out.println(boardVO.getFile().getSize());
        System.out.println(boardVO.getFile().getOriginalFilename());
        boardService.insertBoard(boardVO);
        return "redirect:freeBoardList";
    }



}
