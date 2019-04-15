package ouhk.comps380f.service;

import java.util.List;
import ouhk.comps380f.model.Poll;
import ouhk.comps380f.model.PollComment;
import ouhk.comps380f.exception.PollCommentNotFound;

public interface PollService {

    public long createPoll(String question, String chooseoption1,String chooseoption2,String chooseoption3,String chooseoption4) throws Exception;
    
    public List<Poll> getPolls();
    
    public Poll getPoll(long poll_id);
    
    public void ansPoll(long poll_id,String userName,String chooseoption) throws Exception;
    
    public void delPollAns(long id,String userName) throws Exception;
    
    public long countAllByPollId(long poll_id);
    
    public long countAllByPollIdAndChooseOption(long poll_id,String chooseoption);

    public String findChooseOptionByPollIdAndUsername(long poll_id,String userName);
    
    public void delPoll(long poll_id) throws Exception;
    
    public long createComment(String username, String cm, long poll_id) throws Exception;

    public List<PollComment> getComment(long poll_id);

    public void delComment(long id) throws PollCommentNotFound;

    public void delAllComment(long pollId) throws PollCommentNotFound;
}
