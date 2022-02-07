package www.gnsoft.zionshelter.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import www.gnsoft.zionshelter.service.BoardService;

@Controller
@Slf4j
public class IndexController {

    private final BoardService boardService;

    public IndexController(BoardService boardService) {
        this.boardService = boardService;
    }

    @RequestMapping("/")
    public String index(){
        System.out.println("오긴옴??");
        log.info(boardService.selectAllBoard().toString());
        return "index";
    }

    @RequestMapping("/testInsert")
    public void insert(){
        boardService.testInsert();
    }

    @RequestMapping("/contact")
    public String contact(){
        return "contact";
    }
}
