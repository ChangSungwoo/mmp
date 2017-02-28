package com.mymovieprice.mmp.common.web;

public class PagingHelper {
    private int startRow;
    private int linePerPage;
  
    public PagingHelper(int page, int linePerPage) {
        this.linePerPage = linePerPage;
        this.startRow = (page-1)*linePerPage;
    }
  
    public int getStartRow() {
        return startRow;
    }
    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }
    public int getLinePerPage() {
        return linePerPage;
    }
    public void setLinePerPage(int linePerPage) {
        this.linePerPage = linePerPage;
    }
}
