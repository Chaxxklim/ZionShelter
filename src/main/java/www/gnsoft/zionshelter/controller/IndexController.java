package www.gnsoft.zionshelter.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import www.gnsoft.zionshelter.service.BoardService;
import www.gnsoft.zionshelter.service.MemberService;
import www.gnsoft.zionshelter.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

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
    public String loginPost(String id, String password, HttpServletRequest request){
        HttpSession session = request.getSession();
        MemberVO memberVO = new MemberVO();
        memberVO.setMemberId(id);
        memberVO.setMemberPassword(password);
        if(memberService.selectMember(memberVO) == null) {
            return "login";
        } else {
            session.setAttribute("memberVO", memberService.selectMember(memberVO));
            return "index";
        }
    }

    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @PostMapping("/idCheckPost")
    public String idCheckPost(@RequestBody Map<String, Object> map){
        MemberVO memberVO = new MemberVO();
        memberVO.setMemberId((String)map.get("inputId"));

        String inputId = (String)map.get("inputId");
        System.out.println("inputId : " + inputId);
        return null;

    }





}
