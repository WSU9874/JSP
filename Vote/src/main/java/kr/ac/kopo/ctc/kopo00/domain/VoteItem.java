package kr.ac.kopo.ctc.kopo00.domain;

public class VoteItem {
	private int id;
	private String name;
	private int tupyoId;
	private int age;
	private int huboId;
	private int rate;
	private int count;
	private String oneName;
	
	public String getOneName() {
		return oneName;
	}
	public void setOneName(String oneName) {
		this.oneName = oneName;
	}
	public int getHuboId() {
		return huboId;
	}
	public void setHuboId(int huboId) {
		this.huboId = huboId;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getTupyoId() {
		return tupyoId;
	}
	public void setTupyoId(int tupyoId) {
		this.tupyoId = tupyoId;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
