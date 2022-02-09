package www.gnsoft.zionshelter.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import www.gnsoft.zionshelter.service.BoardService;
import www.gnsoft.zionshelter.service.MemberService;
import www.gnsoft.zionshelter.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
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
    public String login(@ModelAttribute("memberVO") MemberVO memberVO){
        return "login";
    }

    @PostMapping("/loginPost")
    public String loginPost(@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request){
        HttpSession session = request.getSession();
        if(memberService.selectMember(memberVO) == null) {
            return "login";
        } else {
            session.setAttribute("memberVO", memberService.selectMember(memberVO));
            System.out.println(memberService.selectMember(memberVO).toString());
            return "index";
        }
    }

    @RequestMapping("/register")
    public String register(@ModelAttribute("memberVO") MemberVO memberVO){
        return "register";
    }

    @PostMapping("/idCheckPost")
    @ResponseBody
    public Map<String, Object> idCheckPost(@RequestBody Map<String, Object> map){
        Map<String, Object> resultMap = new HashMap<>();
        String result = "";
        if(memberService.idCheck((String)map.get("inputId")) == null){
            result = "Y";
        } else {
            result = "N";
        }
        resultMap.put("result", result);
        return resultMap;
    }





}
