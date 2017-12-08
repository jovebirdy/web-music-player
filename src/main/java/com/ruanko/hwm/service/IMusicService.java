package com.ruanko.hwm.service;

import java.util.List;

import com.ruanko.hwm.bean.Music;

public interface IMusicService {
	public Music getMusicById(int musicId);
	
	public void addMusic(Music music);
	
	public List<Music> getAllMusic();
	
	public void deleteMusic(Integer id);
	
	public void updateMusic(Music music);
	
	//public List<Music> findMusicByUserId(Integer id);
}
