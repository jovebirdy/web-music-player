package com.ruanko.hwm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanko.hwm.bean.Comments;
import com.ruanko.hwm.dao.CommentsMapper;
import com.ruanko.hwm.service.ICommentService;
@Service
public class CommentServiceImpl implements ICommentService {

	@Resource
	private CommentsMapper commentsMapper;
	
	public void addComment(Comments comments) {
		commentsMapper.insert(comments);
	}

	public List<Comments> getCommentsListByMusicId(Integer musicid) {
		return commentsMapper.selectByMusicId(musicid);
	}

	public void updateComment(Comments comment) {
		commentsMapper.updateByPrimaryKey(comment);
	}

	public Comments getCommentsById(Integer commentid) {
		return commentsMapper.selectByPrimaryKey(commentid);
	}

}
