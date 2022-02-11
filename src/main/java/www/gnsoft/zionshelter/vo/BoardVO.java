package www.gnsoft.zionshelter.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
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
    private String fileSaveName;
    private String fileOriginalName;
    private MultipartFile file;
    
    
}
