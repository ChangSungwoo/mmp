package com.mymovieprice.mmp.member.model;

public class MemberCondition {
	
	String userType;
	String providerCd;
	String loginId;
	String loginPwd;
	String userNickNm;
	
	String userNm;
	String userGrade;
	private String creId;
	private String updId;
	
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getProviderCd() {
		return providerCd;
	}
	public void setProviderCd(String providerCd) {
		this.providerCd = providerCd;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getLoginPwd() {
		return loginPwd;
	}
	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}
	public String getUserNickNm() {
		return userNickNm;
	}
	public void setUserNickNm(String userNickNm) {
		this.userNickNm = userNickNm;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}
	public String getCreId() {
		return creId;
	}
	public void setCreId(String creId) {
		this.creId = creId;
	}
	public String getUpdId() {
		return updId;
	}
	public void setUpdId(String updId) {
		this.updId = updId;
	}

}
