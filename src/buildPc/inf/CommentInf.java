package buildPc.inf;

public class CommentInf {
	private int uid;
	private int pid;
	private String content;
	private boolean isshow;
	
	public CommentInf() {
		// TODO 自动生成的构造函数存根
	}
	public CommentInf(int uid, int pid, String content, boolean isshow) {
		super();
		this.uid = uid;
		this.pid = pid;
		this.content = content;
		this.isshow = isshow;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public boolean isIsshow() {
		return isshow;
	}
	public void setIsshow(boolean isshow) {
		this.isshow = isshow;
	}
	
}
