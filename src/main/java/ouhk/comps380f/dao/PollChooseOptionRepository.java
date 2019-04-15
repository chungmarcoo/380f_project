package ouhk.comps380f.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ouhk.comps380f.model.PollChooseOption;

public interface PollChooseOptionRepository extends JpaRepository<PollChooseOption, Long> {

    @Query("SELECT p FROM PollChooseOption p WHERE p.poll_id = ?1 AND p.userName = ?2")
    public PollChooseOption findByPollIdAndUsername(long poll_id, String userName);

    @Query("Select count(p) From PollChooseOption p WHERE p.poll_id=?1")
    public long countAllByPollId(long poll_id);

    @Query("Select count(p) From PollChooseOption p Where p.poll_id=?1 And p.chooseoption = ?2")
    public long countAllByPollIdAndChooseOption(long poll_id, String chooseoption);

    @Query("Select p From PollChooseOption p Where p.poll_id = ?1")
    public List<PollChooseOption> findAnsPollByPollId(long poll_id);
    
    @Query("Select chooseoption From PollChooseOption p Where p.poll_id = ?1 And p.userName=?2")
    public String findChooseOptionByPollIdAndUsername(long poll_id, String userName);
}
