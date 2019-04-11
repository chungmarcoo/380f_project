package ouhk.comps380f.controller;

import java.security.Principal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import ouhk.comps380f.model.Attachment;
import ouhk.comps380f.model.Item;
import ouhk.comps380f.view.DownloadingView;

@Controller
@RequestMapping("/")
public class IndexController {

    @RequestMapping(value="/")
    public String index() {
        return "index";
    }
    
    @RequestMapping(value = "/{itemId}", method = RequestMethod.GET)
    public String view(@PathVariable("itemId") long itemId,ModelMap model) {
        Item item = ItemController.itemDatabase.get(itemId);
        if (item == null) {
            return "redirect:/";
        }
        model.addAttribute("itemId", Long.toString(itemId));
        model.addAttribute("item", item);
        return "indexView";
    }
    
    @RequestMapping(value = "/{itemId}/attachment/{attachment:.+}", method = RequestMethod.GET)
    public View download(@PathVariable("itemId") long itemId, @PathVariable("attachment") String name) {
        Item item = ItemController.itemDatabase.get(itemId);
        if (item != null) {
            Attachment attachment = item.getAttachment(name);
            if (attachment != null) {
                return new DownloadingView(attachment.getName(), attachment.getMimeContentType(), attachment.getContents());
            }
        }
        return new RedirectView("/", true);
    }

    @RequestMapping("login")
    public String login() {
        return "login";
    }

}
