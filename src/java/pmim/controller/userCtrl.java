package pmim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class userCtrl {

    @RequestMapping(value = "/AAccount")
    public @ResponseBody Object AAcountCtrl(HttpServletRequest request){
        return null;
    }
}
