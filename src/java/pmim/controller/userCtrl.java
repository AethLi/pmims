package pmim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class userCtrl {

    @RequestMapping(value = "AAccount.do")
    public @ResponseBody Object AAccountCtrl(@RequestBody Map<String,Object> map){
        System.out.printf(map.toString());
        return null;
    }



    @RequestMapping(value = "Account.do")
    public  String AccountCtrl(HttpServletRequest request){
        System.out.printf("text controller");
        return null;
    }
}
