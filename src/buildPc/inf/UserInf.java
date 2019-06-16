package buildPc.inf;

import com.sun.xml.rpc.processor.modeler.j2ee.xml.string;

import buildPc.util.MD5;

public class UserInf {
	private int uId;
	private String rName;
	private String pNum;
	private String email;
	private String username;
	private String password;
	private boolean isAdmin;
	
	public UserInf() {
	}
	
	public UserInf(int uId, String rName, String pNum, String email, String username, String password, boolean isAdmin) {
		this.rName = rName;
		this.pNum = pNum;
		this.email = email;
		this.username = username;
		this.password = MD5.getMd5(password);
		this.isAdmin = isAdmin;
	}
	
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getpNum() {
		return pNum;
	}
	public void setpNum(String pNum) {
		this.pNum = pNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isAdmin() {
		return isAdmin;
	}
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	
}
