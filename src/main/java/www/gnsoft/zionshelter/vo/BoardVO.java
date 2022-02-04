package www.gnsoft.zionshelter.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVO {
    private long boardIdx;
    private String boardDvsn;
    private String boardTitle;
    private String boardCont;
    private long memIdx;
    private String boardFile;
}
