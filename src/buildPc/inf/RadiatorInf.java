package buildPc.inf;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.persistence.descriptors.invalidation.DailyCacheInvalidationPolicy;

import buildPc.util.DB;

public class RadiatorInf {
	private int id;
	private String rName;
	private String heatDissipation;
	private String noise;
	private int price;
	private int stock;
	private String imgPath;
	
	public static RadiatorInf getInf(int id) {	//根据id获得散热器信息
		String sql = "SELECT * FROM Radiator WHERE id = "+id+"";
		try {
			ResultSet rSet = DB.executeQuery(sql);
			if(rSet.next()) {
				RadiatorInf radiator = new RadiatorInf();
				radiator.setId(id);
				radiator.setrName(rSet.getString("rName"));
				radiator.setHeatDissipation(rSet.getString("heatDissipation"));
				radiator.setNoise(rSet.getString("noise"));
				radiator.setPrice(rSet.getInt("price"));
				radiator.setStock(rSet.getInt("stock"));
				radiator.setImgPath(rSet.getString("imgPath"));
				return radiator;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static List<RadiatorInf> getInf() {	//获取全部散热器信息
		String sql = "SELECT * FROM radiator";
		List<RadiatorInf> radiatorList = new ArrayList();
		try {
			ResultSet rSet = DB.executeQuery(sql);
			while(rSet.next()) {
				radiatorList.add(new RadiatorInf(rSet.getInt("id"), rSet.getString("rName"), rSet.getString("heatDissipation"), rSet.getString("noise"), rSet.getInt("price"), rSet.getInt("stock"), rSet.getString("imgPath")));
			}
			if (radiatorList.size() == 0)
				return null;
			else 
				return radiatorList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public RadiatorInf() {
		// TODO 自动生成的构造函数存根
	}
	
	public RadiatorInf(int id, String rName, String heatDissipation, String noise, int price, int stock, String imgPath) {
		this.id = id;
		this.rName = rName;
		this.heatDissipation = heatDissipation;
		this.noise = noise;
		this.price = price;
		this.stock = stock;
		this.imgPath = imgPath;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getHeatDissipation() {
		return heatDissipation;
	}
	public void setHeatDissipation(String heatDissipation) {
		this.heatDissipation = heatDissipation;
	}
	public String getNoise() {
		return noise;
	}
	public void setNoise(String noise) {
		this.noise = noise;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
	
}
