package www.gnsoft.zionshelter.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import www.gnsoft.zionshelter.service.BoardService;
import www.gnsoft.zionshelter.service.MemberService;
import www.gnsoft.zionshelter.vo.MemberVO;

@Controller
@Slf4j
public class IndexController {

    private final MemberService memberService;
    private final BoardService boardService;

    public IndexController(MemberService memberService, BoardService boardService) {
        this.memberService = memberService;
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

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @PostMapping("/loginPost")
    public String loginPost(String id, String password){
        MemberVO memberVO = new MemberVO();
        memberVO.setMemberId(id);
        memberVO.setMemberPassword(password);

        System.out.println("id :" + id + " , pw : " + password);
        System.out.println("vo : "+ memberVO);
        System.out.println("service : " + memberService.toString());
        memberService.selectMember(memberVO);
        System.out.println("result : " + memberService.selectMember(memberVO).toString());
        return null;
    }

}
