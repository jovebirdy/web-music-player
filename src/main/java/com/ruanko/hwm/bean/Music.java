package com.ruanko.hwm.bean;

import java.util.Date;

public class Music implements Comparable<Music>{
    private Integer id;

    private String musicname;

    private Date uploadtime;

    private Integer playcounts;

    private String img;

    private String lyr;

    private String musictime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMusicname() {
        return musicname;
    }

    public void setMusicname(String musicname) {
        this.musicname = musicname == null ? null : musicname.trim();
    }

    public Date getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(Date uploadtime) {
        this.uploadtime = uploadtime;
    }

    public Integer getPlaycounts() {
        return playcounts;
    }

    public void setPlaycounts(Integer playcounts) {
        this.playcounts = playcounts;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public String getLyr() {
        return lyr;
    }

    public void setLyr(String lyr) {
        this.lyr = lyr == null ? null : lyr.trim();
    }

    public String getMusictime() {
        return musictime;
    }

    public void setMusictime(String musictime) {
        this.musictime = musictime == null ? null : musictime.trim();
    }

	public int compareTo(Music o) {
		return o.getPlaycounts().compareTo(this.getPlaycounts());  
	}
	
	@Override
	public String toString() {
		return this.id.toString();
	}
}