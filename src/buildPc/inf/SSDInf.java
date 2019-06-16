package buildPc.inf;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import buildPc.util.DB;

public class SSDInf {
	private int id;
	private String ssdName;
	private String brand;
	private String Interface;
	private int capacity;
	private int price;
	private int stock;
	private String imgPath;
	
	public static SSDInf getInf(int id) {
		String sql = "SELECT * FROM SSD_inf WHERE id = "+id+"";
		try {
			ResultSet rSet = DB.executeQuery(sql);
			if(rSet.next()) {
				SSDInf ssd = new SSDInf();
				ssd.setId(id);
				ssd.setSsdName(rSet.getString("ssdName"));
				ssd.setBrand(rSet.getString("brand"));
				ssd.setInterface(rSet.getString("Interface"));
				ssd.setCapacity(rSet.getInt("capacity"));
				ssd.setPrice(rSet.getInt("price"));
				ssd.setStock(rSet.getInt("stock"));
				ssd.setImgPath(rSet.getString("imgPath"));
				return ssd;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static List<SSDInf> getInf() {	//获取全部ssd信息
		String sql = "SELECT * FROM ssd_inf";
		List<SSDInf> ssdList = new ArrayList();
		try {
			ResultSet rSet = DB.executeQuery(sql);
			while(rSet.next()) {
				ssdList.add(new SSDInf(rSet.getInt("id"), rSet.getString("ssdName"), rSet.getString("brand"), rSet.getString("Interface"), rSet.getInt("capacity"),rSet.getInt("price"), rSet.getInt("stock"), rSet.getString("imgPath")));
			}
			if (ssdList.size() == 0)
				return null;
			else 
				return ssdList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public SSDInf() {
		// TODO 自动生成的构造函数存根
	}
	public SSDInf(int id, String ssdName, String brand, String Interface, int capacity, int price, int stock, String imgPath) {
		this.id = id;
		this.ssdName = ssdName;
		this.brand = brand;
		this.Interface = Interface;
		this.capacity = capacity;
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
	public String getSsdName() {
		return ssdName;
	}
	public void setSsdName(String ssdName) {
		this.ssdName = ssdName;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getInterface() {
		return Interface;
	}
	public void setInterface(String interface1) {
		Interface = interface1;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
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
