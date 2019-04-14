package ouhk.comps380f.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ouhk.comps380f.dao.PollRepository;
import ouhk.comps380f.dao.PollChooseOptionRepository;
import ouhk.comps380f.model.Poll;
import ouhk.comps380f.model.PollChooseOption;
import ouhk.comps380f.exception.PollChooseOptionNotFound;

@Service
public class PollServiceImpl implements PollService {

    @Resource
    private PollRepository pollRepo;

    @Resource
    private PollChooseOptionRepository pollChooseOptionRepo;

    @Override
    @Transactional
    public List<Poll> getPolls() {
        return pollRepo.findAll();
    }

    @Override
    @Transactional
    public Poll getPoll(long poll_id) {
        return pollRepo.findOne(poll_id);
    }

    @Override
    @Transactional
    public long countAllByPollId(long poll_id) {
        return pollChooseOptionRepo.countAllByPollId(poll_id);
    }

    @Override
    @Transactional
    public long countAllByPollIdAndChooseOption(long poll_id, String chooseoption) {
        return pollChooseOptionRepo.countAllByPollIdAndChooseOption(poll_id, chooseoption);
    }

    @Override
    @Transactional
    public String findChooseOptionByPollIdAndUsername(long poll_id, String userName) {
        return pollChooseOptionRepo.findChooseOptionByPollIdAndUsername(poll_id, userName);
    }

    @Override
    @Transactional
    public long createPoll(String question, String chooseoption1, String chooseoption2,
            String chooseoption3, String chooseoption4) throws Exception {
        Poll poll = new Poll();

        poll.setQuestion(question);
        poll.setChooseOption1(chooseoption1);
        poll.setChooseOption2(chooseoption2);
        poll.setChooseOption3(chooseoption3);
        poll.setChooseOption4(chooseoption4);

        Poll savedPoll = pollRepo.save(poll);
        return savedPoll.getPoll_id();
    }

    @Override
    @Transactional
    public void ansPoll(long poll_id, String userName, String chooseoption) throws Exception, PollChooseOptionNotFound {
        PollChooseOption pollChooseOption = new PollChooseOption();

        pollChooseOption.setPoll_id(poll_id);
        pollChooseOption.setUsername(userName);
        pollChooseOption.setChooseOption(chooseoption);
        //delPollAns(poll_id,userName);
        PollChooseOption deletedPollAns = pollChooseOptionRepo.findByPollIdAndUsername(poll_id, userName);
        if (deletedPollAns == null) {
            PollChooseOption savedPollChooseOption = pollChooseOptionRepo.save(pollChooseOption);
        } else {
            pollChooseOptionRepo.delete(deletedPollAns);
            PollChooseOption savedPollChooseOption = pollChooseOptionRepo.save(pollChooseOption);
        }

    }

    @Override
    @Transactional(rollbackFor = PollChooseOptionNotFound.class)
    public void delPollAns(long poll_id, String userName) throws Exception {
        PollChooseOption deletedPollAns = pollChooseOptionRepo.findByPollIdAndUsername(poll_id, userName);
        if (deletedPollAns == null) {
            throw new Exception();
        }
        pollChooseOptionRepo.delete(deletedPollAns);
    }

    @Override
    @Transactional(rollbackFor = PollChooseOptionNotFound.class)
    public void delPoll(long poll_id) throws Exception {
        Poll deletedPoll = pollRepo.findPollByPollId(poll_id);
        List<PollChooseOption> deletedPollAns = pollChooseOptionRepo.findAnsPollByPollId(poll_id);
        if (deletedPollAns == null) {
            throw new Exception();
        }
        pollChooseOptionRepo.delete(deletedPollAns);
        pollRepo.delete(deletedPoll);
    }

    /*(@Override
    @Transactional(rollbackFor = LectureNotFound.class)
    public void updateLecture(long id, String subject,
            String body, List<MultipartFile> attachments)
            throws IOException, LectureNotFound {
        Lecture updatedLecture = lectureRepo.findOne(id);
        if (updatedLecture == null) {
            throw new LectureNotFound();
        }

        updatedLecture.setSubject(subject);
        updatedLecture.setBody(body);

        for (MultipartFile filePart : attachments) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setLecture(updatedLecture);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                updatedLecture.getAttachments().add(attachment);
            }
        }
        lectureRepo.save(updatedLecture);
    }*/
}
