package www.gnsoft.zionshelter.service;

import www.gnsoft.zionshelter.vo.MemberVO;

import java.util.List;

public interface MemberService {

    //Member Select
    MemberVO selectMember(MemberVO memberVO);

    //Member Insert
    MemberVO insertMember(MemberVO memberVO);



}
