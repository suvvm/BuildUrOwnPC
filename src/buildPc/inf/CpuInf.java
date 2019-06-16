package buildPc.inf;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import buildPc.util.DB;

public class CpuInf {
	private int id;
	private String cpuName;
	private String cpuSlot;
	private int core_number;
	private double cpu_frequency;
	private boolean bits64;
	private int price;
	private int stock;
	private String imgPath;
	
	public static CpuInf getInf(int id) {
		String sql = "SELECT * FROM cpu_inf WHERE id = "+id+"";
		try {
			ResultSet rSet = DB.executeQuery(sql);
			if(rSet.next()) {
				CpuInf cpuInf = new CpuInf(rSet.getInt("id"), rSet.getString("cpuName"), rSet.getString("cpuSlot"), rSet.getInt("core_number"),
						rSet.getDouble("cpu_frequency"), rSet.getBoolean("bits64"), rSet.getInt("price"), rSet.getInt("stock"), rSet.getString("imgPath"));
				return cpuInf;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static List<CpuInf> getInf() {	//获取全部cpu信息
		String sql = "SELECT * FROM cpu_inf";	
		try {
			List<CpuInf> cpuList = new ArrayList();
			ResultSet rSet = DB.executeQuery(sql);
			while(rSet.next()) {
				cpuList.add(new CpuInf(rSet.getInt("id"), rSet.getString("cpuName"), rSet.getString("cpuSlot"), rSet.getInt("core_number"),
						rSet.getDouble("cpu_frequency"), rSet.getBoolean("bits64"), rSet.getInt("price"), rSet.getInt("stock"), rSet.getString("imgPath")));
			}
			if (cpuList.size() == 0)
				return null;
			else 
				return cpuList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public CpuInf() {
		// TODO 自动生成的构造函数存根
	}

	public CpuInf(int id, String cpuName, String cpuSlot, int core_number, double cpu_frequency, boolean bits64,
			int price, int stock, String imgPath) {
		super();
		this.id = id;
		this.cpuName = cpuName;
		this.cpuSlot = cpuSlot;
		this.core_number = core_number;
		this.cpu_frequency = cpu_frequency;
		this.bits64 = bits64;
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
	public String getCpuName() {
		return cpuName;
	}
	public void setCpuName(String cpuName) {
		this.cpuName = cpuName;
	}
	public String getCpuSlot() {
		return cpuSlot;
	}
	public void setCpuSlot(String cpuSlot) {
		this.cpuSlot = cpuSlot;
	}
	public int getCore_number() {
		return core_number;
	}
	public void setCore_number(int core_number) {
		this.core_number = core_number;
	}
	public double getCpu_frequency() {
		return cpu_frequency;
	}
	public void setCpu_frequency(double cpu_frequency) {
		this.cpu_frequency = cpu_frequency;
	}
	public boolean isBits64() {
		return bits64;
	}
	public void setBits64(boolean bits64) {
		this.bits64 = bits64;
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
