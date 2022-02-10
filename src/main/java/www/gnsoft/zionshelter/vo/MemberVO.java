package www.gnsoft.zionshelter.vo;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@NoArgsConstructor
@Data
public class MemberVO {
    private long memberIdx;

    @NotNull(message = "ID, NOT NULL")
    @NotBlank(message = "ID, NOT BLANK")
    @Size(min = 6, max = 20, message = "ID, SIZE : 6~10")
    private String memberId;

    @NotNull(message = "PW, NOT NULL")
    @NotBlank(message = "PW, NOT BLANK")
    @Size(min = 8, max = 20, message = "PW, SIZE : 8~20")
    private String memberPassword;

    @NotNull(message = "NAME, NOT NULL")
    @NotBlank(message = "NAME, NOT BLANK")
    @Size(min = 2, max = 10, message = "NAME, SIZE : 2~10")
    private String memberName;

    @NotNull(message = "NUMBER, NOT NULL")
    @NotBlank(message = "NUMBER, NOT BLANK")
    @Size(min = 11, max = 11, message = "SIZE : 11, ex) 01012345678")
    private String memberPhoneNumber;

    @NotNull(message = "ZIPCODE, NOT NULL")
    @NotBlank(message = "ZIPCODE, NOT BLANK")
    private String memberZipcode;

    @NotNull(message = "ADD1, NOT NULL")
    @NotBlank(message = "ADD1, NOT BLANK")
    private String memberAddress1;

    @NotNull(message = "ADD2, NOT NULL")
    @NotBlank(message = "ADD2, NOT BLANK")
    private String memberAddress2;

    private String memberDivision;
    
    
}
