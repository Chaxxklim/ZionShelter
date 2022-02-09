package www.gnsoft.zionshelter.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
public class BoardVO {
    private long boardIdx;
    private long memberIdx;
    private String memberName;
    private String boardDivision;
    private String boardTitle;
    private String boardContent;
    private Date BoardWriteDate;
}
