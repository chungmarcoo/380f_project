package ouhk.comps380f.service;

import java.io.IOException;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import ouhk.comps380f.exception.AttachmentNotFound;
import ouhk.comps380f.exception.PollNotFound;
import ouhk.comps380f.exception.PollChooseOptionNotFound;
import ouhk.comps380f.model.Poll;

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
    
    
    /*public List<Lecture> getLectures();

    public void updateLecture(long id, String subject,
            String body, List<MultipartFile> attachments)
            throws IOException, LectureNotFound;

    public void deleteAttachment(long lectureId, String name)
            throws AttachmentNotFound;*/
}
