package buildPc.inf;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import buildPc.util.DB;

public class MemoryChipInf {
	private int id;
	private String mName;
	private String brand;
	private int capacity;
	private String bf;
	private int price;
	private int stock;
	private String imgPath;
	
	public static MemoryChipInf getInf(int id) {
		String sql = "SELECT * FROM MemoryChip WHERE id = "+id+"";
		try {
			ResultSet rSet = DB.executeQuery(sql);
			if(rSet.next()) {
				MemoryChipInf memoryChip = new MemoryChipInf();
				memoryChip.setId(id);
				memoryChip.setmName(rSet.getString("mName"));
				memoryChip.setCapacity(rSet.getInt("capacity"));		
				memoryChip.setBf(rSet.getString("bf"));
				memoryChip.setPrice(rSet.getInt("price"));
				memoryChip.setStock(rSet.getInt("stock"));
				memoryChip.setImgPath(rSet.getString("imgPath"));
				return memoryChip;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static List<MemoryChipInf> getInf() {	//获取全部内存信息
		String sql = "SELECT * FROM MemoryChip";	
		try {
			List<MemoryChipInf> memoryChipList = new ArrayList();
			ResultSet rSet = DB.executeQuery(sql);
			while(rSet.next()) {
				memoryChipList.add(new MemoryChipInf(rSet.getInt("id"), rSet.getString("mName"),rSet.getString("brand"),rSet.getInt("capacity"),
						rSet.getString("bf"), rSet.getInt("price"),rSet.getInt("stock"), rSet.getString("imgPath")));
			}
			if (memoryChipList.size() == 0)
				return null;
			else 
				return memoryChipList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public MemoryChipInf() {
		// TODO 自动生成的构造函数存根
	}

	public MemoryChipInf(int id, String mName, String brand, int capacity, String bf, int price, int stock,
			String imgPath) {
		this.id = id;
		this.mName = mName;
		this.brand = brand;
		this.capacity = capacity;
		this.bf = bf;
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
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getBf() {
		return bf;
	}
	public void setBf(String bf) {
		this.bf = bf;
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
