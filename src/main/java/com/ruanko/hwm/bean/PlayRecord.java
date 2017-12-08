package com.ruanko.hwm.bean;

import java.util.Date;

public class PlayRecord {
    private Integer id;

    private Integer userid;

    private Integer musicid;

    private Date playtime;

    private Integer playcounts;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getMusicid() {
        return musicid;
    }

    public void setMusicid(Integer musicid) {
        this.musicid = musicid;
    }

    public Date getPlaytime() {
        return playtime;
    }

    public void setPlaytime(Date playtime) {
        this.playtime = playtime;
    }

    public Integer getPlaycounts() {
        return playcounts;
    }

    public void setPlaycounts(Integer playcounts) {
        this.playcounts = playcounts;
    }
}