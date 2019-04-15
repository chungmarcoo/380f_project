package ouhk.comps380f.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "poll")
public class Poll implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long poll_id;

    @Column(name = "question")
    private String question;

    private String chooseoption1;
    private String chooseoption2;
    private String chooseoption3;
    private String chooseoption4;

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
