package www.gnsoft.zionshelter.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import www.gnsoft.zionshelter.mapper.MemberMapper;
import www.gnsoft.zionshelter.service.MemberService;
import www.gnsoft.zionshelter.vo.MemberVO;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    @Autowired
    private final MemberMapper memberMapper;


    @Override
    public MemberVO selectMember(MemberVO memberVO) {
        return memberMapper.selectMember(memberVO);
    }

    @Override
    public MemberVO insertMember(MemberVO memberVO) {
        return memberMapper.insertMember(memberVO);
    }
}
