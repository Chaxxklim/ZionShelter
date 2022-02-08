package www.gnsoft.zionshelter.service;

import www.gnsoft.zionshelter.vo.MemberVO;

public interface MemberService {

    //Member Select
    MemberVO selectMember(String id, String password);

    //Member Insert
    MemberVO insertMember(MemberVO memberVO);


    MemberVO idCheck(String inputId);
}
