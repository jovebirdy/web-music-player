package com.ruanko.hwm.service;

import java.util.List;

import com.ruanko.hwm.bean.Comments;

public interface ICommentService {
	void addComment(Comments comments);
	
	List<Comments> getCommentsListByMusicId(Integer musicid);
	
	void updateComment(Comments comment);
	
	Comments getCommentsById(Integer commentid);
}
