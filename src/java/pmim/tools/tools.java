package pmim.tools;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

public class tools {
    public static boolean stringLengthCheck(String desstr, int deslength) {
        return desstr.length() < deslength ? false : true;
    }

    public static String charset_utf8(String res) {
        String des = null;
        try {
            des = new String(res.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return des;
    }

    public static String toMD5(String res) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
        byte[] resByteArray = res.getBytes();
        byte[] desByteArray = md.digest(resByteArray);
        StringBuffer hexValue = new StringBuffer();
        for (int i = 0; i < desByteArray.length; i++) {
            int val = ((int) desByteArray[i]) & 0xff;
            if (val < 16)
                hexValue.append("0");
            hexValue.append(Integer.toHexString(val));
        }
        return hexValue.toString();

    }
}
