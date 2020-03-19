import org.junit.Test;

import java.io.File;
import java.io.IOException;

public class test1 {
    @Test
    public void setNum() throws IOException {
        File file = new File("D:/test/a/b/c/", "a.txt");
        if (!file.exists())
            file.mkdirs();
        //file.createNewFile();
    }
}
