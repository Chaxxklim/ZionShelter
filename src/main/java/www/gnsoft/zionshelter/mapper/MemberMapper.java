package www.gnsoft.zionshelter.mapper;

import org.apache.ibatis.annotations.Mapper;
import www.gnsoft.zionshelter.vo.MemberVO;



@Mapper
public interface MemberMapper {

    MemberVO selectMember(MemberVO memberVO);

    MemberVO insertMember(MemberVO memberVO);

    MemberVO idCheck(MemberVO memberVO);
}
