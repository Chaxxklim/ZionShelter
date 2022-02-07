package www.gnsoft.zionshelter.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FileVO {
    private String fileSaveName;
    private long boardIdx;
    private String fileOriginalName;
    private String filePath;
}
