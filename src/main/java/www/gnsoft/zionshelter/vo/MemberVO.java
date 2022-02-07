package www.gnsoft.zionshelter.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {
    private long memberIdx;
    private String memberId;
    private String memberPassword;
    private String memberName;
    private String memberPhoneNumber;
    private String memberZipcode;
    private String memberAddress1;
    private String memberAddress2;
}
