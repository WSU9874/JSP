package kr.ac.kopo.ctc.kopo00.domain;

public class JegoItem {
	private long id;
	private String name;
	private long jego;
	private String jegoDate;
	private String newDate;
	private String content;
	private String picture;
	private int duplication;
	private long keyid;
	public long getKeyid() {
		return keyid;
	}
	public void setKeyid(long keyid) {
		this.keyid = keyid;
	}
	public long getDuplication() {
		return duplication;
	}
	public void setDuplication(int duplication) {
		this.duplication = duplication;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getJego() {
		return jego;
	}
	public void setJego(long jego) {
		this.jego = jego;
	}
	public String getJegoDate() {
		return jegoDate;
	}
	public void setJegoDate(String jegoDate) {
		this.jegoDate = jegoDate;
	}
	public String getNewDate() {
		return newDate;
	}
	public void setNewDate(String newDate) {
		this.newDate = newDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
}
