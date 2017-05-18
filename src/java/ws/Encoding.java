package ws;

import java.nio.charset.StandardCharsets;
import java.text.Normalizer;

public class Encoding
{
    public static String fix(String raw)
    {
        //ENCODING:
        byte[] bytes = raw.getBytes(StandardCharsets.ISO_8859_1);
        raw = new String(bytes, StandardCharsets.UTF_8);
        //raw = quitaAcentos(raw);
        
        return raw;
    }
    public static String quitaAcentos(String s) 
    {
        s = Normalizer.normalize(s, Normalizer.Form.NFD);
        s = s.replaceAll("[\\p{InCombiningDiacriticalMarks}]", "");
        return s;
    }
}

