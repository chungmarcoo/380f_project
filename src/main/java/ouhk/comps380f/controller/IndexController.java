package ouhk.comps380f.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @RequestMapping("/")
    public String index(HttpSession session) {
        if(session.isNew()){
        session.setAttribute("lang", "english");
        }
        return "redirect:/lecture/list";
    }
    
    @RequestMapping("langage/chinese")
    public String chinese(HttpSession session) {
        
        session.setAttribute("lang", "chinese");
        return "redirect:/lecture/list";
    }
    @RequestMapping("langage/english")
    public String english(HttpSession session) {
        session.setAttribute("lang", "english");
        return "redirect:/lecture/list";
    }

    @RequestMapping("login")
    public String login() {
        return "login";
    }
    
}
