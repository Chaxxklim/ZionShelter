package www.gnsoft.zionshelter.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
public class CommentVO {
    private long commentIdx;
    private long boardIdx;
    private long memberIdx;
    private Date commentDate;
    private String commentContent;
}
