package buildPc.inf;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import buildPc.util.DB;

public class MechanicsInf {
	private int id;
	private String mecName;
	private String brand;
	private String Interface;
	private int speed;
	private int capacity;
	private int cache;
	private int price;
	private int stock;
	private String imgPath;
	
	public static MechanicsInf getInf(int id) {
		String sql = "SELECT * FROM Mechanics_inf WHERE id = "+id+"";
		try {
			ResultSet rSet = DB.executeQuery(sql);
			if(rSet.next()) {
				MechanicsInf mechanics = new MechanicsInf(id, rSet.getString("mecName"), rSet.getString("brand"), rSet.getString("Interface"), rSet.getInt("speed"),
						rSet.getInt("capacity"), rSet.getInt("cache"), rSet.getInt("price"),rSet.getInt("stock"), rSet.getString("imgPath"));
				return mechanics;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static List<MechanicsInf> getInf() {	//获取全部内存信息
		String sql = "SELECT * FROM Mechanics_inf";	
		try {
			List<MechanicsInf> mechanicsList = new ArrayList();
			ResultSet rSet = DB.executeQuery(sql);
			while(rSet.next()) {
				mechanicsList.add(new MechanicsInf(rSet.getInt("id"), rSet.getString("mecName"), rSet.getString("brand"), rSet.getString("Interface"), rSet.getInt("speed"),
						rSet.getInt("capacity"), rSet.getInt("cache"), rSet.getInt("price"),rSet.getInt("stock"), rSet.getString("imgPath")));
			}
			if (mechanicsList.size() == 0)
				return null;
			else 
				return mechanicsList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public MechanicsInf() {
		// TODO 自动生成的构造函数存根
	}
	public MechanicsInf(int id, String mecName, String brand, String Interface, int speed,
			int capacity, int cache, int price, int stock, String imgPath) {
		this.id = id;
		this.mecName = mecName;
		this.brand = brand;
		this.Interface = Interface;
		this.speed = speed;
		this.capacity = capacity;
		this.cache = cache;
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
	public String getMecName() {
		return mecName;
	}
	public void setMecName(String mecName) {
		this.mecName = mecName;
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
	public int getSpeed() {
		return speed;
	}
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getCache() {
		return cache;
	}
	public void setCache(int cache) {
		this.cache = cache;
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
