package ouhk.comps380f.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import ouhk.comps380f.model.Attachment;
import ouhk.comps380f.model.Item;
import ouhk.comps380f.view.DownloadingView;
import ouhk.comps380f.model.BidPrice;
import ouhk.comps380f.model.Comment;

@Controller
@RequestMapping("item")
public class ItemController {

    private volatile long ITEM_ID_SEQUENCE = 1;
    public static Map<Long, Item> itemDatabase = new Hashtable<>();
    private Map<String,BidPrice> biddingPriceForm = new Hashtable<>();
    private Map<String,Comment> commentForm = new Hashtable<>();
    private Map<String,BidPrice> bidderWinnerForm = new Hashtable<>();
    
    
    @RequestMapping(value = {"", "list"}, method = RequestMethod.GET)
    public String list(ModelMap model) {
        model.addAttribute("itemDatabase", itemDatabase);
        return "list";
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public ModelAndView create() {
        return new ModelAndView("add", "itemForm", new Form());
    }
    
    @RequestMapping(value = "view/{itemId}", method = RequestMethod.GET)
    public ModelAndView view(@PathVariable("itemId") long itemId, ModelMap model, Principal principal) {
        Item item = this.itemDatabase.get(itemId);
        if (item == null) {
            return new ModelAndView("list");
        }
        if(principal != null) {
            model.addAttribute("username", principal.getName());
        }
        model.addAttribute("itemId", Long.toString(itemId));
        model.addAttribute("item", item);
        ModelAndView modelAndView = new ModelAndView("view");
        Form biddingPriceForm = new Form();
        Form commentForm = new Form();
        Form bidderWinnerForm = new Form();
        modelAndView.addObject("biddingPriceForm", biddingPriceForm);
        modelAndView.addObject("commentForm", commentForm);
        modelAndView.addObject("bidderWinnerForm", bidderWinnerForm);
        return modelAndView;
    }

    public static class Form {

        private String subject;
        private String expectedPrice;
        private String description;
        private String status;
        private int noOfBids;
        private List<MultipartFile> attachments;
        private String bidPrice;
        private String comment;
        private String winnerName;

        public String getSubject() {
            return subject;
        }

        public void setSubject(String subject) {
            this.subject = subject;
        }

        public String getExpectedPrice() {
            return expectedPrice;
        }

        public void setExpectedPrice(String expectedPrice) {
            this.expectedPrice = expectedPrice;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        public int getNoOfBids() {
            return noOfBids;
        }

        public void setNoOfBids(int noOfBids) {
            this.noOfBids = noOfBids;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public List<MultipartFile> getAttachments() {
            return attachments;
        }

        public void setAttachments(List<MultipartFile> attachments) {
            this.attachments = attachments;
        }

        public String getBidPrice() {
            return bidPrice;
        }

        public void setBidPrice(String bidPrice) {
            this.bidPrice = bidPrice;
        }

        public String getComment() {
            return comment;
        }

        public void setComment(String comment) {
            this.comment = comment;
        }

        public String getWinnerName() {
            return winnerName;
        }

        public void setWinnerName(String winnerName) {
            this.winnerName = winnerName;
        }
        
        

    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public View create(Form form, Principal principal) throws IOException {
        Item item = new Item();
        item.setId(this.getNextItemId());
        item.setCustomerName(principal.getName());
        item.setSubject(form.getSubject());
        item.setExpectedPrice(form.getExpectedPrice());
        item.setStatus("Available");
        item.setWinnerPrice("");
        item.setNoOfBids(0);
        item.setDescription(form.getDescription());
        
        for (MultipartFile filePart : form.getAttachments()) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null && attachment.getContents().length > 0) {
                item.addAttachment(attachment);
            }
        }
        
        this.itemDatabase.put(item.getId(), item);
        return new RedirectView("/item/view/" + item.getId(), true);
    }

    private synchronized long getNextItemId() {
        return this.ITEM_ID_SEQUENCE++;
    }
    

    @RequestMapping(value = "/{itemId}/attachment/{attachment:.+}", method = RequestMethod.GET)
    public View download(@PathVariable("itemId") long itemId,
            @PathVariable("attachment") String name) {
        Item item = this.itemDatabase.get(itemId);
        if (item != null) {
            Attachment attachment = item.getAttachment(name);
            if (attachment != null) {
                return new DownloadingView(attachment.getName(),
                        attachment.getMimeContentType(), attachment.getContents());
            }
        }
        return new RedirectView("/item/list", true);
    }

    @RequestMapping(
            value = "/{itemId}/delete/{attachment:.+}",
            method = RequestMethod.GET
    )
    public String deleteAttachment(@PathVariable("itemId") long itemId,
            @PathVariable("attachment") String name) {
        Item item = this.itemDatabase.get(itemId);
        if (item != null) {
            if (item.hasAttachment(name)) {
                item.deleteAttachment(name);
            }
        }
        return "redirect:/item/edit/" + itemId;
    }
    

    @RequestMapping(value = "edit/{itemId}", method = RequestMethod.GET)
    public ModelAndView showEdit(@PathVariable("itemId") long itemId,
            Principal principal, HttpServletRequest request) {
        Item item = this.itemDatabase.get(itemId);
        if (item == null
                || (!request.isUserInRole("ROLE_ADMIN")
                && !principal.getName().equals(item.getCustomerName()))) {
            return new ModelAndView(new RedirectView("/item/list", true));
        }
        ModelAndView modelAndView = new ModelAndView("edit");
        modelAndView.addObject("itemId", Long.toString(itemId));
        modelAndView.addObject("item", item);

        Form itemForm = new Form();
        itemForm.setSubject(item.getSubject());
        itemForm.setExpectedPrice(item.getExpectedPrice());
        itemForm.setStatus(item.getStatus());
        itemForm.setDescription(item.getDescription());
        modelAndView.addObject("itemForm", itemForm);

        return modelAndView;
    }

    @RequestMapping(value = "edit/{itemId}", method = RequestMethod.POST)
    public View edit(@PathVariable("itemId") long itemId, Form form,
            Principal principal, HttpServletRequest request)
            throws IOException {
        Item item = this.itemDatabase.get(itemId);
        if (item == null
                || (!request.isUserInRole("ROLE_ADMIN")
                && !principal.getName().equals(item.getCustomerName()))) {
            return new RedirectView("/item/list", true);
        }
        
        item.setSubject(form.getSubject());
        item.setExpectedPrice(form.getExpectedPrice());
        item.setStatus(form.getStatus());
        item.setDescription(form.getDescription());

        for (MultipartFile filePart : form.getAttachments()) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null && attachment.getContents().length > 0) {
                item.addAttachment(attachment);
            }
        }
        this.itemDatabase.put(item.getId(), item);
        return new RedirectView("/item/view/" + item.getId(), true);
    }

    @RequestMapping(value = "delete/{itemId}", method = RequestMethod.GET)
    public String deleteItem(@PathVariable("itemId") long itemId) {
        if (this.itemDatabase.containsKey(itemId)) {
            this.itemDatabase.remove(itemId);
        }
        return "redirect:/item/list";
    }
    
    @RequestMapping(value = "/view/{itemId}", method = RequestMethod.POST)
    public View biddingPrice(@PathVariable("itemId") long itemId, Form form,
            Principal principal, HttpServletRequest request) throws IOException {
        Item item = this.itemDatabase.get(itemId);
        String hidden=request.getParameter("hidden");
        if(hidden.equals("bid")){
            BidPrice bidPrice = new BidPrice();
            bidPrice.setBidder(principal.getName());
            bidPrice.setBidderPrice(form.getBidPrice());
            item.addBidPrices(bidPrice);
            item.setNoOfBids(item.getNoOfBids());
        }else if(hidden.equals("comment")){
            Comment comment = new Comment();
            comment.setName(principal.getName());
            comment.setContent(form.getComment());
            item.addComment(comment);
        }else if(hidden.equals("winner")){
            if(item.checkHasBidded(form.getWinnerName()) || form.getWinnerName().equals("No Winner")){
                item.setWinnerName(form.getWinnerName());
                item.setWinnerPrice(item.getBidPrice(form.getWinnerName()).getBidderPrice());
                item.setStatus("end");
            }
        }
        return new RedirectView("/item/view/" + item.getId(), true); 
    }
    
    @RequestMapping(value = "item/{itemId}/deleteComment",method = RequestMethod.GET)
    public View deleteComment(@PathVariable("itemId") long itemId, Form form,
            Principal principal, @PathVariable("comment") String name,  HttpServletRequest request) throws IOException {
        Item item = this.itemDatabase.get(itemId);
        if (item != null) {
            if (item.hasComment(name)) {
                item.deleteComment(name);
            }
        }
        return new RedirectView("/item/view/" + item.getId(), true);
    }
}
