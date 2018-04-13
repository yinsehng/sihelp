package com.neusoft.bean;

public class Jinfo {

	  private String NAME        ;//VARCHAR2(100),
	  private String CORPORATION ;//VARCHAR2(50),
	  private String ADDRESS     ;//VARCHAR2(200),
	  private String POSTALCODE  ;//VARCHAR2(20),
	  private String TYPE        ;//VARCHAR2(1),
	  private String TEL         ;//VARCHAR2(200)
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getCORPORATION() {
		return CORPORATION;
	}
	public void setCORPORATION(String cORPORATION) {
		CORPORATION = cORPORATION;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getPOSTALCODE() {
		return POSTALCODE;
	}
	public void setPOSTALCODE(String pOSTALCODE) {
		POSTALCODE = pOSTALCODE;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getTEL() {
		return TEL;
	}
	public void setTEL(String tEL) {
		TEL = tEL;
	}
	  
	  
}
