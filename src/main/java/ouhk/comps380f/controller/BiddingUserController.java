package ouhk.comps380f.controller;

import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import ouhk.comps380f.dao.BiddingUserRepository;
import ouhk.comps380f.model.BiddingUser;

@Controller
@RequestMapping("user")
public class BiddingUserController {

    @Resource
    BiddingUserRepository biddingUserRepo;

    @RequestMapping(value = {"", "list"}, method = RequestMethod.GET)
    public String list(ModelMap model) {
        model.addAttribute("biddingUsers", biddingUserRepo.findAll());
        return "listUser";
    }

    public static class Form {

        private String username;
        private String password;
        private String[] roles;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String[] getRoles() {
            return roles;
        }

        public void setRoles(String[] roles) {
            this.roles = roles;
        }
        
        
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public ModelAndView create() {
        return new ModelAndView("addUser", "biddingUser", new Form());
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public View create(Form form) throws IOException {
        BiddingUser user = new BiddingUser(form.getUsername(),
                form.getPassword(), form.getRoles()
        );
        biddingUserRepo.save(user);
        return new RedirectView("/user/list", true);
    }
    
    @RequestMapping(value = "register", method = RequestMethod.GET)
    public ModelAndView register() {
        return new ModelAndView("register", "biddingUser", new Form());
    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public View register(Form form) throws IOException {
        BiddingUser user = new BiddingUser(form.getUsername(),
                form.getPassword(), form.getRoles()
        );
        biddingUserRepo.save(user);
        return new RedirectView("/login", true);
    }

    @RequestMapping(value = "delete/{username}", method = RequestMethod.GET)
    public View deleteItem(@PathVariable("username") String username) {
        biddingUserRepo.delete(biddingUserRepo.findOne(username));
        return new RedirectView("/user/list", true);
    }
    
    @RequestMapping(value = "edit/{username}", method = RequestMethod.GET)
    public ModelAndView editUser(@PathVariable("username") String username) {
        return new ModelAndView("editUser", "editUserForm", new Form());
    }
    
    @RequestMapping(value = "edit/{username}", method = RequestMethod.POST)
    public View editUser(@PathVariable("username") String username, Form form, HttpServletRequest request) {
        String oPwd=request.getParameter("oldPwd");
        BiddingUser b=biddingUserRepo.findOne(username);
        if(b!=null){
            if(oPwd.equals(b.getPassword()) && form.getPassword()!=null){
                b.setPassword(form.getPassword());
                biddingUserRepo.delete(username);
                biddingUserRepo.save(b);
                return new RedirectView("/user/list?success", true);
            }else{
                return new RedirectView("/user/list?fail", true);
            }
        }else{
            return new RedirectView("/user/list?noUser", true);
        }
    }
}
