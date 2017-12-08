package com.ruanko.hwm.service;

import java.util.List;

import com.ruanko.hwm.bean.Music;
import com.ruanko.hwm.bean.Singer;

public interface ISingerService {
	public Singer getSingerById(int singerId);
	
	public void addSinger(Singer singer);
	
	public List<Singer> getAllSinger();
	
	public void deleteSinger(Integer id);
	
	public void updateSinger(Singer singer);
}
