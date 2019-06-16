package buildPc.inf;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sun.xml.rpc.processor.modeler.j2ee.xml.deweyVersionType;

import buildPc.util.DB;

public class MainboardInf {
	private int id;
	private String mName;
	private String brand;
	private String platform;
	private String chipset;
	private boolean integratedGraphics;
	private int mDotTwoNum;
	private int sataNum;
	private String cpuSlot;
	private String ramSlot;
	private int ramSlotNum;
	private int hdmi;
	private int dvi;
	private int vga;
	private int pic;
	private int dp;
	private int usb2;
	private int usb3;
	private String networkcard;
	private String networkInterface;
	private int price;
	private int stock;
	private String imgPath;
	
	public static MainboardInf getInf(int id) {
		String sql = "SELECT * FROM mainboard_inf WHERE id = "+id+"";
		try {
			ResultSet rSet = DB.executeQuery(sql);
			if(rSet.next()) {		
				MainboardInf mainboard = new MainboardInf(rSet.getInt("id"), rSet.getString("mName"), rSet.getString("brand"), rSet.getString("platform"), 
						rSet.getString("chipset"), rSet.getBoolean("integratedGraphics"), rSet.getInt("mDotTwoNum"), 
						rSet.getInt("sataNum"), rSet.getString("cpuSlot"), rSet.getString("ramSlot"), rSet.getInt("ramSlotNum"), 
						rSet.getInt("hdmi"), rSet.getInt("dvi"), rSet.getInt("vga"), rSet.getInt("pic"), rSet.getInt("dp"), 
						rSet.getInt("usb2"), rSet.getInt("usb3"), rSet.getString("networkcard"), rSet.getString("networkInterface"),
						rSet.getInt("price"), rSet.getInt("stock"), rSet.getString("imgPath"));
				return mainboard;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static List<MainboardInf> getInf() {	//获取全部显卡信息
		String sql = "SELECT * FROM mainboard_inf";	
		try {
			List<MainboardInf> mainboardList = new ArrayList();
			ResultSet rSet = DB.executeQuery(sql);
			while(rSet.next()) {
				mainboardList.add(new MainboardInf(rSet.getInt("id"), rSet.getString("mName"), rSet.getString("brand"), rSet.getString("platform"), 
						rSet.getString("chipset"), rSet.getBoolean("integratedGraphics"), rSet.getInt("mDotTwoNum"), 
						rSet.getInt("sataNum"), rSet.getString("cpuSlot"), rSet.getString("ramSlot"), rSet.getInt("ramSlotNum"), 
						rSet.getInt("hdmi"), rSet.getInt("dvi"), rSet.getInt("vga"), rSet.getInt("pic"), rSet.getInt("dp"), 
						rSet.getInt("usb2"), rSet.getInt("usb3"), rSet.getString("networkcard"), rSet.getString("networkInterface"),
						rSet.getInt("price"), rSet.getInt("stock"), rSet.getString("imgPath")));
			}
			if (mainboardList.size() == 0)
				return null;
			else 
				return mainboardList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public MainboardInf() {
		// TODO 自动生成的构造函数存根
	}
	
	public MainboardInf(int id, String mName, String brand, String platform, String chipset, boolean integratedGraphics,
			int mDotTwoNum, int sataNum, String cpuSlot, String ramSlot, int ramSlotNum, int hdmi, int dvi, int vga,
			int pic, int dp, int usb2, int usb3, String networkcard, String networkInterface, int price, int stock,
			String imgPath) {
		this.id = id;
		this.mName = mName;
		this.brand = brand;
		this.platform = platform;
		this.chipset = chipset;
		this.integratedGraphics = integratedGraphics;
		this.mDotTwoNum = mDotTwoNum;
		this.sataNum = sataNum;
		this.cpuSlot = cpuSlot;
		this.ramSlot = ramSlot;
		this.ramSlotNum = ramSlotNum;
		this.hdmi = hdmi;
		this.dvi = dvi;
		this.vga = vga;
		this.pic = pic;
		this.dp = dp;
		this.usb2 = usb2;
		this.usb3 = usb3;
		this.networkcard = networkcard;
		this.networkInterface = networkInterface;
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
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	public String getChipset() {
		return chipset;
	}
	public void setChipset(String chipset) {
		this.chipset = chipset;
	}
	public boolean isIntegratedGraphics() {
		return integratedGraphics;
	}
	public void setIntegratedGraphics(boolean integratedGraphics) {
		this.integratedGraphics = integratedGraphics;
	}
	public int getmDotTwoNum() {
		return mDotTwoNum;
	}
	public void setmDotTwoNum(int mDotTwoNum) {
		this.mDotTwoNum = mDotTwoNum;
	}
	public int getSataNum() {
		return sataNum;
	}
	public void setSataNum(int sataNum) {
		this.sataNum = sataNum;
	}
	public String getCpuSlot() {
		return cpuSlot;
	}
	public void setCpuSlot(String cpuSlot) {
		this.cpuSlot = cpuSlot;
	}
	public String getRamSlot() {
		return ramSlot;
	}
	public void setRamSlot(String ramSlot) {
		this.ramSlot = ramSlot;
	}
	public int getRamSlotNum() {
		return ramSlotNum;
	}
	public void setRamSlotNum(int ramSlotNum) {
		this.ramSlotNum = ramSlotNum;
	}
	public int getHdmi() {
		return hdmi;
	}
	public void setHdmi(int hdmi) {
		this.hdmi = hdmi;
	}
	public int getDvi() {
		return dvi;
	}
	public void setDvi(int dvi) {
		this.dvi = dvi;
	}
	public int getVga() {
		return vga;
	}
	public void setVga(int vga) {
		this.vga = vga;
	}
	public int getPic() {
		return pic;
	}
	public void setPic(int pic) {
		this.pic = pic;
	}
	public int getDp() {
		return dp;
	}
	public void setDp(int dp) {
		this.dp = dp;
	}
	public int getUsb2() {
		return usb2;
	}
	public void setUsb2(int usb2) {
		this.usb2 = usb2;
	}
	public int getUsb3() {
		return usb3;
	}
	public void setUsb3(int usb3) {
		this.usb3 = usb3;
	}
	public String getNetworkcard() {
		return networkcard;
	}
	public void setNetworkcard(String networkcard) {
		this.networkcard = networkcard;
	}
	public String getNetworkInterface() {
		return networkInterface;
	}
	public void setNetworkInterface(String networkInterface) {
		this.networkInterface = networkInterface;
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
