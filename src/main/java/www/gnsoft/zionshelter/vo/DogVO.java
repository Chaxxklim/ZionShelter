package www.gnsoft.zionshelter.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DogVO {
    private long dogIdx;
    private long boardIdx;
    private String dogName;
    private int dogAge;
    private String dogDivision;
    private String dogContent;
    private String dogStatus;
}
