package buildPc.inf;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import buildPc.util.DB;

public class ScoreInf {
	private int uid;
	private int pid;
	private int score;

	public ScoreInf() {
		// TODO 自动生成的构造函数存根
	}

	public ScoreInf(int uid, int pid, int score) {
		super();
		this.uid = uid;
		this.pid = pid;
		this.score = score;
	}

	public static List<ScoreInf> getInf() {
		String sql = "SELECT * FROM score";
		try {
			List<ScoreInf> scoreInfs = new ArrayList();
			ResultSet rSet = DB.executeQuery(sql);
			while(rSet.next()) {
				scoreInfs.add(new ScoreInf(rSet.getInt("uid"), rSet.getInt("pid"), rSet.getInt("score")));
			}
			if (scoreInfs.size() == 0) {
				return null;
			}else {
				return scoreInfs;
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return null;
	}

	public static double getInf(int pid) {
		String sql = "SELECT * FROM score WHERE pid="+pid+"";
		try {
			ResultSet rSet = DB.executeQuery(sql);
			int cnt = 0;
			double score = 0;
			while(rSet.next()) {
				cnt++;
				score += rSet.getInt("score");
			}
			if(cnt == 0) {
				return 5.0;
			}else {
				return score / cnt;
			}
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return 5.0;
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

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

}
