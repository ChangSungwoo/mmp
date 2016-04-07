package com.mymovieprice.mmp.movie.model;

import java.util.ArrayList;

public class DaumSearch {
	private String title;
	private String description;
	private String generator;
	private int totalCount;
	private int pageCount;
	private int result;
	private ArrayList<DaumMovie> items = new ArrayList<DaumMovie>();
	
	public String toString()
	{
		String outStr = "";
		outStr += "title" + ":" + title + "\n";
		outStr += "description" + ":" + description + "\n";
		outStr += "lastBuildDate" + ":" + generator + "\n";
		outStr += "totalCount" + ":" + totalCount + "\n";
		outStr += "pageCount" + ":" + pageCount + "\n";
		outStr += "result" + ":" + result + "\n";
		outStr += "itemsCount" + ":" + items.size() + "\n\n";
		
		for(int i=0;i < getItems().size();i++)
		{
			outStr += "item(" + i + ")\n";
			outStr += "item(" + i + ") title:" + items.get(i).getTitle() + "\n";
			outStr += "item(" + i + ") description:" + items.get(i).getLink() + "\n";
			outStr += "item(" + i + ") comment:" + items.get(i).getOgrTitle() + "\n";
			outStr += "item(" + i + ") author:" + items.get(i).getDirector() + "\n";
			outStr += "item(" + i + ") pubDate:" + items.get(i).getOpenInfo() + "\n\n";
		}
		return outStr;
	}
	
	/**
	 * @param Title the Title to set
	 */
	public String getTitle()
	{
		return this.title;
	}
	
	/**
	 * @param Title the Title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param lastBuildDate the lastBuildDate to set
	 */
	public void setGenerator(String generator) {
		this.generator = generator;
	}

	/**
	 * @return the lastBuildDate
	 */
	public String getGenerator() {
		return generator;
	}

	/**
	 * @param totalCount the totalCount to set
	 */
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	/**
	 * @return the totalCount
	 */
	public int getTotalCount() {
		return totalCount;
	}

	/**
	 * @param pageCount the pageCount to set
	 */
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	/**
	 * @return the pageCount
	 */
	public int getPageCount() {
		return pageCount;
	}

	/**
	 * @param result the result to set
	 */
	public void setResult(int result) {
		this.result = result;
	}

	/**
	 * @return the result
	 */
	public int getResult() {
		return result;
	}

	/**
	 * @return the items
	 */
	public ArrayList<DaumMovie> getItems() {
		return items;
	}
}
