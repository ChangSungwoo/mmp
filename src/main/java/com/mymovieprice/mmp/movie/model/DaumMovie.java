package com.mymovieprice.mmp.movie.model;

import java.util.ArrayList;

public class DaumMovie {


	String title;
	String link;
	String engTitle;
	String ogrTitle;
	
	String director;
	String actor;
	String openInfo;
	
	private ArrayList<DaumMovie> list = new ArrayList<DaumMovie>();
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getEngTitle() {
		return engTitle;
	}
	public void setEngTitle(String engTitle) {
		this.engTitle = engTitle;
	}
	public String getOgrTitle() {
		return ogrTitle;
	}
	public void setOgrTitle(String ogrTitle) {
		this.ogrTitle = ogrTitle;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getOpenInfo() {
		return openInfo;
	}
	public void setOpenInfo(String openInfo) {
		this.openInfo = openInfo;
	}

	/**
	 * @return the list
	 */
	public ArrayList<DaumMovie> getList() {
		return list;
	}
	
}
