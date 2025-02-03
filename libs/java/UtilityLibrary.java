import java.io.File;

public class UtilityLibrary {
    public String concatenateStrings(String... args) {
        StringBuilder sb = new StringBuilder();
        for (String arg : args) {
            sb.append(arg).append(" ");
        }
        return sb.toString().trim();
    }

    public String[] splitString(String input, String delimiter) {
        return input.split(delimiter);
    }

    public String getFileExtension(String filename) {
        File file = new File(filename);
        String extension = "";
        int i = file.getName().lastIndexOf('.');
        if (i > 0) {
            extension = file.getName().substring(i);
        }
        return extension;
    }
}
