package ouhk.comps380f.service;

import java.util.List;
import ouhk.comps380f.exception.CommentNotFound;
import ouhk.comps380f.model.Comment;

public interface CommentService {

    public long createComment(String userName, String cm,
            long lecture_id) throws Exception;
    
    public List<Comment> getComment(long lectureId);
    
    public void delComment(long id) throws CommentNotFound;
    
    public void delAllComment(long lectureId) throws CommentNotFound;
}
