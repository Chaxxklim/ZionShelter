package www.gnsoft.zionshelter.service;

import www.gnsoft.zionshelter.vo.MemberVO;

public interface MemberService {

    //Member Select
    MemberVO selectMember(MemberVO memberVO);

    //Member Insert
    MemberVO insertMember(MemberVO memberVO);


    MemberVO idCheck(String inputId);

    void registerMember(MemberVO memberVO);
}
