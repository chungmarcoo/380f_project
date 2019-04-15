package ouhk.comps380f.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ouhk.comps380f.dao.CommentRepository;
import ouhk.comps380f.model.Comment;
import ouhk.comps380f.model.Lecture;
import ouhk.comps380f.exception.CommentNotFound;

@Service
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentRepository commentRepo;

    @Override
    @Transactional
    public List<Comment> getComment(long lectureId) {
        return commentRepo.findAllByLectureId(lectureId);
    }

    @Override
    @Transactional(rollbackFor = CommentNotFound.class)
    public void delComment(long id) throws CommentNotFound {
        Comment deletedComment = commentRepo.findOne(id);
        if (deletedComment == null) {
            throw new CommentNotFound();
        }
        commentRepo.delete(deletedComment);
    }

    @Override
    @Transactional(rollbackFor = CommentNotFound.class)
    public void delAllComment(long lectureId) throws CommentNotFound {
        List<Comment> deletedAllComment = commentRepo.findAllByLectureId(lectureId);
        if (deletedAllComment == null) {
            throw new CommentNotFound();
        }
        commentRepo.delete(deletedAllComment);
    }

    @Override
    @Transactional
    public long createComment(String userName, String cm,
            long lecture_id) throws Exception {
        Comment comment = new Comment();
        Lecture lecture = new Lecture();

        comment.setUsername(userName);
        comment.setComment(cm);
        lecture.setId(lecture_id);
        comment.setLecture_id(lecture_id);
        comment.setLecture(lecture);

        Comment savedComment = commentRepo.save(comment);
        return savedComment.getId();
    }

}
