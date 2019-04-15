package ouhk.comps380f.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import ouhk.comps380f.exception.PollCommentNotFound;
import ouhk.comps380f.exception.PollNotFound;
import ouhk.comps380f.service.PollService;

@Controller
@RequestMapping("lecture")
public class PollController {

    @Autowired
    private PollService pollService;

    public static class addPollForm {

        private long poll_id;
        private String question;
        private String chooseoption1, chooseoption2, chooseoption3, chooseoption4;

        public long getPoll_id() {
            return poll_id;
        }

        public void setPoll_id(long poll_id) {
            this.poll_id = poll_id;
        }

        public String getQuestion() {
            return question;
        }

        public void setQuestion(String question) {
            this.question = question;
        }

        public String getChooseOption1() {
            return chooseoption1;
        }

        public void setChooseOption1(String chooseoption1) {
            this.chooseoption1 = chooseoption1;
        }

        public String getChooseOption2() {
            return chooseoption2;
        }

        public void setChooseOption2(String chooseoption2) {
            this.chooseoption2 = chooseoption2;
        }

        public String getChooseOption3() {
            return chooseoption3;
        }

        public void setChooseOption3(String chooseoption3) {
            this.chooseoption3 = chooseoption3;
        }

        public String getChooseOption4() {
            return chooseoption4;
        }

        public void setChooseOption4(String chooseoption4) {
            this.chooseoption4 = chooseoption4;
        }

    }

    public static class ansPollForm {

        private long poll_id;
        private String userName;
        private String chooseoption;

        public long getPoll_id() {
            return poll_id;
        }

        public void setPoll_id(long poll_id) {
            this.poll_id = poll_id;
        }

        public String getUsername() {
            return userName;
        }

        public void setUsername(String userName) {
            this.userName = userName;
        }

        public String getChooseOption() {
            return chooseoption;
        }

        public void setChooseOption(String chooseoption) {
            this.chooseoption = chooseoption;
        }

    }
    public static class cmForm {

        private long id;
        private String username;
        private String comment;
        private long poll_id;

        public long getId() {
            return id;
        }

        public void setId(long id) {
            this.id = id;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getComment() {
            return comment;
        }

        public void setComment(String comment) {
            this.comment = comment;
        }

        public long getPoll_id() {
            return poll_id;
        }

        public void setPoll_id(long poll_id) {
            this.poll_id = poll_id;
        }

    }
    @RequestMapping(value = "poll/list", method = RequestMethod.GET)
    public String listPoll(ModelMap model) {
        model.addAttribute("pollDatabase", pollService.getPolls());
        return "poll";
    }

    @RequestMapping(value = "poll/list/addPoll", method = RequestMethod.GET)
    public ModelAndView createForm() {
        return new ModelAndView("addPoll", "pollForm", new addPollForm());
    }

    @RequestMapping(value = "poll/list/addPoll", method = RequestMethod.POST)
    public String addPollFrom(addPollForm form,
            ModelMap model, HttpServletRequest request) throws Exception {
        pollService.createPoll(form.getQuestion(), form.getChooseOption1(), form.getChooseOption2(), form.getChooseOption3(), form.getChooseOption4());
        return "redirect:/lecture/list";
    }

    @RequestMapping(value = "/poll/{poll_id}", method = RequestMethod.GET)
    public ModelAndView createAnsForm(@PathVariable("poll_id") long poll_id, ModelMap model, HttpServletRequest request) {
        long[] pollCount = new long[]{pollService.countAllByPollIdAndChooseOption(poll_id, pollService.getPoll(poll_id).getChooseOption1()),
        pollService.countAllByPollIdAndChooseOption(poll_id, pollService.getPoll(poll_id).getChooseOption2()),
        pollService.countAllByPollIdAndChooseOption(poll_id, pollService.getPoll(poll_id).getChooseOption3()),
        pollService.countAllByPollIdAndChooseOption(poll_id, pollService.getPoll(poll_id).getChooseOption4())};
        
        String[] pollOptions = new String[]{pollService.getPoll(poll_id).getChooseOption1(),
            pollService.getPoll(poll_id).getChooseOption2(),
            pollService.getPoll(poll_id).getChooseOption3(),
            pollService.getPoll(poll_id).getChooseOption4()}; 
        model.addAttribute("pollDatabase", pollService.getPoll(poll_id));
        model.addAttribute("pollAllCount", pollService.countAllByPollId(poll_id));
        model.addAttribute("pollCount", pollCount);
        model.addAttribute("pollOptions", pollOptions);
                model.addAttribute("poll_id", poll_id);
        model.addAttribute("pollCommentDatabase", pollService.getComment(poll_id));
        model.addAttribute("userVoted", pollService.findChooseOptionByPollIdAndUsername(poll_id, request.getUserPrincipal().getName()));
        return new ModelAndView("viewPoll", "ansPollForm", new ansPollForm());
    }

    @RequestMapping(value = "/poll/{poll_id}", method = RequestMethod.POST)
    public String ansPoll(@PathVariable("poll_id") long poll_id, ansPollForm form,
            ModelMap model, HttpServletRequest request) throws Exception {
        pollService.ansPoll(poll_id, request.getUserPrincipal().getName(), form.getChooseOption());
        return "redirect:/lecture/poll/{poll_id}";
    }

        @RequestMapping(value = "{pollId}/pollcomment", method = RequestMethod.GET)
    public ModelAndView createForm(@PathVariable("pollId") long pollId, ModelMap model) {
        return new ModelAndView("pollcomment", "pollCommentForm", new cmForm());
    }

    @RequestMapping(value = "{pollId}/pollcomment", method = RequestMethod.POST)
    public String addComment(@PathVariable("pollId") long pollId, cmForm form,
            ModelMap model, HttpServletRequest request) throws Exception {
        pollService.createComment(request.getUserPrincipal().getName(), form.getComment(), pollId);
        return "redirect:/lecture/poll/" + pollId;
    }

    @RequestMapping(value = "/poll/delete/{poll_id}", method = RequestMethod.GET)
    public String delPoll(@PathVariable("poll_id") long poll_id) throws Exception, PollCommentNotFound, PollNotFound  {
        pollService.delPoll(poll_id);
        pollService.delAllComment(poll_id);
        return "redirect:/lecture/list";
    }    
    
    @RequestMapping(value = {"/lecture/poll/deleteComment/{pollId}/{Id}", "poll/deleteComment/{pollId}/{Id}"}, method = RequestMethod.GET)
    public View delComment(@PathVariable("Id") long Id, @PathVariable("pollId") long poll_id)
            throws PollCommentNotFound {
        pollService.delComment(Id);
        return new RedirectView("/lecture/poll/" + poll_id, true);
    }
}
