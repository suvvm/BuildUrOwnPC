package buildPc.inf;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import buildPc.util.DB;

public class GraphicsInf {
	private int id;
	private String gName;
	private String brand;
	private double directX;
	private String OpenGL;
	private String Interface;
	private String maxResolution;
	private int price;
	private int stock;
	private String imgPath;
	
	public static GraphicsInf getInf(int id) {
		String sql = "SELECT * FROM Graphics_inf WHERE id = "+id+"";
		try {
			ResultSet rSet = DB.executeQuery(sql);
			if(rSet.next()) {
				GraphicsInf graphics = new GraphicsInf();
				graphics.setId(id);
				graphics.setgName(rSet.getString("gName"));
				graphics.setBrand(rSet.getString("brand"));
				graphics.setDirectX(rSet.getDouble("directX"));
				graphics.setOpenGL(rSet.getString("OpenGL"));
				graphics.setInterface(rSet.getString("Interface"));
				graphics.setMaxResolution(rSet.getString("maxResolution"));
				graphics.setPrice(rSet.getInt("price"));
				graphics.setStock(rSet.getInt("stock"));
				graphics.setImgPath(rSet.getString("imgPath"));
				return graphics;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static List<GraphicsInf> getInf() {	//获取全部显卡信息
		String sql = "SELECT * FROM Graphics_inf";	
		try {
			List<GraphicsInf> graphicsList = new ArrayList();
			ResultSet rSet = DB.executeQuery(sql);
			while(rSet.next()) {
				graphicsList.add(new GraphicsInf(rSet.getInt("id"), rSet.getString("gName"),
						rSet.getString("brand"), rSet.getDouble("directX"),
						rSet.getString("OpenGL"), rSet.getString("Interface"), rSet.getString("maxResolution"),
						rSet.getInt("price"),rSet.getInt("stock"), rSet.getString("imgPath")));
			}
			if (graphicsList.size() == 0)
				return null;
			else 
				return graphicsList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public GraphicsInf() {
		// TODO 自动生成的构造函数存根
	}
	public GraphicsInf(int id, String gName, String brand, double directX, String openGL, String interface1,
			String maxResolution, int price, int stock, String imgPath) {
		this.id = id;
		this.gName = gName;
		this.brand = brand;
		this.directX = directX;
		OpenGL = openGL;
		Interface = interface1;
		this.maxResolution = maxResolution;
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
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public double getDirectX() {
		return directX;
	}
	public void setDirectX(double directX) {
		this.directX = directX;
	}
	public String getOpenGL() {
		return OpenGL;
	}
	public void setOpenGL(String openGL) {
		OpenGL = openGL;
	}
	public String getInterface() {
		return Interface;
	}
	public void setInterface(String interface1) {
		Interface = interface1;
	}
	public String getMaxResolution() {
		return maxResolution;
	}
	public void setMaxResolution(String maxResolution) {
		this.maxResolution = maxResolution;
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
