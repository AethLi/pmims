package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pmim.model.RequestAction;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;


@Controller
@RequestMapping(value = "file")
public class fileCtrl {
    @RequestMapping("/imageShowUrl.do")
    public @ResponseBody
    Object imageShowUrl(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);

        return null;
    }

    @RequestMapping(value = "/imageShow.do")
    @ResponseBody
    public String imageShow(HttpServletRequest request, HttpServletResponse response, Model model) {

        FileInputStream fis = null;
        OutputStream os = null;
        try {
            fis = new FileInputStream("/");
            os = response.getOutputStream();
            int count = 0;
            byte[] buffer = new byte[1024 * 8];
            while ((count = fis.read(buffer)) != -1) {
                os.write(buffer, 0, count);
                os.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            fis.close();
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "ok";
    }

    @RequestMapping(value = "fileDownUrl.do")
    public @ResponseBody
    Object fileDownUrl(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);

        return null;
    }

    @RequestMapping(value = "fileDown.do")
    public @ResponseBody
    Object fileDown(HttpServletRequest request) {
        return null;
    }
}



