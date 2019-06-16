package buildPc.util;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import buildPc.inf.CpuInf;
import buildPc.inf.GraphicsInf;
import buildPc.inf.MainboardInf;
import buildPc.inf.MechanicsInf;
import buildPc.inf.MemoryChipInf;
import buildPc.inf.RadiatorInf;
import buildPc.inf.SSDInf;
import buildPc.inf.UserAssemble;

public class AddProductTools {
	/**
	 * 
	 * @param 传入主板与当前会话信息
	 * @return 成功更新session信息返回true 否则返回false
	 */
	public static boolean addProduct(MainboardInf mainboard, int id, int uid, HttpSession session) {
		try {
			ResultSet rSet = DB.executeQuery("SELECT * FROM mainboard_inf WHERE id ="+id+"");
			if (rSet.next()) {
				mainboard = new MainboardInf(id, rSet.getString("mName"), rSet.getString("brand"),
						rSet.getString("platform"), rSet.getString("chipset"), rSet.getBoolean("integratedGraphics"), rSet.getInt("mDotTwoNum"), 
						rSet.getInt("sataNum"), rSet.getString("cpuSlot"), rSet.getString("ramSlot"), rSet.getInt("ramSlotNum"),
						rSet.getInt("hdmi"), rSet.getInt("dvi"), rSet.getInt("vga"), rSet.getInt("pic"),
						rSet.getInt("dp"), rSet.getInt("usb2"), rSet.getInt("usb3"), rSet.getString("networkcard"),
						rSet.getString("networkInterface"), rSet.getInt("price"), rSet.getInt("stock"), rSet.getString("imgPath"));
				if(null == session.getAttribute("assemble")) {
					UserAssemble userAssemble = new UserAssemble();
					userAssemble.setMainboard(mainboard);
					userAssemble.setId(uid);
					session.setAttribute("assemble", userAssemble);
					return true;
				}else {
					UserAssemble userAssemble = (UserAssemble) session.getAttribute("assemble");
					userAssemble.setMainboard(mainboard);
					session.setAttribute("assemble", userAssemble);
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * 
	 * @param 传入cpu与当前会话信息
	 * @return 成功更新session信息返回true 否则返回false
	 */
	public static boolean addProduct(CpuInf cpu ,int id, int uid, HttpSession session) {
		try {
			ResultSet rSet = DB.executeQuery("SELECT * FROM cpu_inf WHERE id ="+id+"");
			if (rSet.next()) {
				cpu = new CpuInf(rSet.getInt("id"), rSet.getString("cpuName"), rSet.getString("cpuSlot"), rSet.getInt("core_number"),
						rSet.getDouble("cpu_frequency"), rSet.getBoolean("bits64"), rSet.getInt("price"), rSet.getInt("stock"), rSet.getString("imgPath"));
				if (null == session.getAttribute("assemble")) {
					UserAssemble userAssemble = new UserAssemble();
					userAssemble.setCpu(cpu);
					userAssemble.setId(uid);
					session.setAttribute("assemble", userAssemble);
					return true;
				}else {
					UserAssemble userAssemble = (UserAssemble) session.getAttribute("assemble");
					userAssemble.setCpu(cpu);
					session.setAttribute("assemble", userAssemble);
					return true;
				}
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} 
		return false;
	}
	/**
	 * 
	 * @param 传入显卡类型与显卡id与当前会话信息
	 * @return 成功更新session信息返回true 否则返回false
	 */
	public static boolean addProduct(GraphicsInf graphics, int id, int uid, HttpSession session) {
		try {
			ResultSet rSet = DB.executeQuery("SELECT * FROM graphics_inf WHERE id ="+id+"");
			if (rSet.next()) {
				graphics = new GraphicsInf(rSet.getInt("id"), rSet.getString("gName"),
						rSet.getString("brand"), rSet.getDouble("directX"),
						rSet.getString("OpenGL"), rSet.getString("Interface"), rSet.getString("maxResolution"),
						rSet.getInt("price"),rSet.getInt("stock"), rSet.getString("imgPath"));
				if (null == session.getAttribute("assemble")) {
					UserAssemble userAssemble = new UserAssemble();
					List<GraphicsInf> graphicsList = new ArrayList();
					graphicsList.add(graphics);
					userAssemble.setId(uid);
					userAssemble.setGraphics(graphicsList);
					session.setAttribute("assemble", userAssemble);
					return true;
				}else {
					UserAssemble userAssemble = (UserAssemble) session.getAttribute("assemble");
					List<GraphicsInf> graphicsList = userAssemble.getGraphics();
					if(null == graphicsList)
						graphicsList = new ArrayList();
					graphicsList.add(graphics);
					userAssemble.setGraphics(graphicsList);
					session.setAttribute("assemble", userAssemble);
					return true;
				}
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} 
		return false;
	}
	/**
	 * @param 传入机械硬盘信息与当前会话信息
	 * @return 成功更新session信息返回true 否则返回false
	 */
	public static boolean addProduct(MechanicsInf mechanics, int id, int uid, HttpSession session) {
		try {
			ResultSet rSet = DB.executeQuery("SELECT * FROM mechanics_inf WHERE id ="+id+"");
			if (rSet.next()) {
				mechanics = new MechanicsInf(rSet.getInt("id"), rSet.getString("mecName"), rSet.getString("brand"), rSet.getString("Interface"), rSet.getInt("speed"),
						rSet.getInt("capacity"), rSet.getInt("cache"), rSet.getInt("price"),rSet.getInt("stock"), rSet.getString("imgPath"));
				if(null == session.getAttribute("assemble")) {
					UserAssemble userAssemble = new UserAssemble();
					List<MechanicsInf> mechanicsList = new ArrayList();
					mechanicsList.add(mechanics);
					userAssemble.setMechanics(mechanicsList);
					userAssemble.setId(uid);
					session.setAttribute("assemble", userAssemble);
					return true;
				}else {
					UserAssemble userAssemble = (UserAssemble) session.getAttribute("assemble");
					List<MechanicsInf> mechanicsList = userAssemble.getMechanics();
					if (null == mechanicsList) {
						mechanicsList = new ArrayList();
					}
					mechanicsList.add(mechanics);
					userAssemble.setMechanics(mechanicsList);
					session.setAttribute("assemble", userAssemble);
					return true;
				}
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * @param 传入内存信息与当前会话信息
	 * @return 成功更新session信息返回true 否则返回false
	 */
	public static boolean addProduct(MemoryChipInf memoryChip, int id, int uid, HttpSession session) {
		try {
			ResultSet rSet = DB.executeQuery("SELECT * FROM memorychip WHERE id ="+id+"");
			if (rSet.next()) {
				memoryChip = new MemoryChipInf(rSet.getInt("id"), rSet.getString("mName"),rSet.getString("brand"),rSet.getInt("capacity"),
						rSet.getString("bf"), rSet.getInt("price"),rSet.getInt("stock"), rSet.getString("imgPath"));
				if(null == session.getAttribute("assemble")) {
					UserAssemble userAssemble = new UserAssemble();
					List<MemoryChipInf> memoryChipList = new ArrayList();
					memoryChipList.add(memoryChip);
					userAssemble.setId(uid);
					userAssemble.setMemoryChip(memoryChipList);
					session.setAttribute("assemble", userAssemble);
					return true;
				}else {
					UserAssemble userAssemble = (UserAssemble) session.getAttribute("assemble");
					List<MemoryChipInf> memoryChipList = userAssemble.getMemoryChip();
					if (null == memoryChipList) {
						memoryChipList = new ArrayList();
					}
					memoryChipList.add(memoryChip);
					userAssemble.setMemoryChip(memoryChipList);
					session.setAttribute("assemble", userAssemble);
					return true;
				}
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * @param 传入散热器信息与当前会话信息
	 * @return 成功更新session信息返回true 否则返回false
	 */
	public static boolean addProduct(RadiatorInf radiator, int id, int uid, HttpSession session) {
		try {
			ResultSet rSet = DB.executeQuery("SELECT * FROM radiator WHERE id ="+id+"");
			if (rSet.next()) {
				radiator = new RadiatorInf(rSet.getInt("id"), rSet.getString("rName"), rSet.getString("heatDissipation"), 
						rSet.getString("noise"), rSet.getInt("price"), rSet.getInt("stock"), rSet.getString("imgPath"));
				if(null == session.getAttribute("assemble")) {
					UserAssemble userAssemble = new UserAssemble();
					userAssemble.setRadiator(radiator);
					userAssemble.setId(uid);
					session.setAttribute("assemble", userAssemble);
					return true;
				}else {
					UserAssemble userAssemble = (UserAssemble) session.getAttribute("assemble");
					userAssemble.setRadiator(radiator);
					session.setAttribute("assemble", userAssemble);
					return true;
				}
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * @param 传入SSD信息与当前会话信息
	 * @return 成功更新session信息返回true 否则返回false
	 */
	public static boolean addProduct(SSDInf ssd, int id, int uid, HttpSession session) {
		try {
			ResultSet rSet = DB.executeQuery("SELECT * FROM ssd_inf WHERE id ="+id+"");
			if (rSet.next()) {
				ssd = new SSDInf(rSet.getInt("id"), rSet.getString("ssdName"), rSet.getString("brand"), rSet.getString("Interface"), 
						rSet.getInt("capacity"),rSet.getInt("price"), rSet.getInt("stock"), rSet.getString("imgPath"));
				if(null == session.getAttribute("assemble")) {
					UserAssemble userAssemble = new UserAssemble();
					List<SSDInf> ssdList = new ArrayList();
					ssdList.add(ssd);
					userAssemble.setSsd(ssdList);
					userAssemble.setId(uid);
					session.setAttribute("assemble", userAssemble);
					return true;
				}else {
					UserAssemble userAssemble = (UserAssemble) session.getAttribute("assemble");
					List<SSDInf> ssdList = userAssemble.getSsd();
					if (null == ssdList) {
						ssdList = new ArrayList();
					}
					ssdList.add(ssd);
					userAssemble.setSsd(ssdList);
					session.setAttribute("assemble", userAssemble);
					return true;
				}
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return false;
	}
	public static boolean addProduct(String ptype, int id, int uid, int number, HttpSession session) {
		if (ptype.equals("CpuInf")) {
			CpuInf cpu = new CpuInf();
			if (addProduct(cpu, id, uid, session)) {
				number--;
				boolean flag = true;
				while(number-- > 0) {
					flag = addProduct(cpu, id, uid, session);
				}
				if (flag) {
					return true;
				}
			}
				
		} else if (ptype.equals("GraphicsInf")) {
			GraphicsInf graphics = new GraphicsInf();
			if (addProduct(graphics, id, uid, session)) 
				return true;
		}else if (ptype.equals("MainboardInf")) {
			MainboardInf mainboard = new MainboardInf();
			if (addProduct(mainboard, id, uid, session)) {
				number--;
				boolean flag = true;
				while(number-- > 0) {
					flag = addProduct(mainboard, id, uid, session);
				}
				if (flag) {
					return true;
				}
			}
		}else if (ptype.equals("MechanicsInf")) {
			MechanicsInf mechanics = new MechanicsInf();
			if (addProduct(mechanics, id, uid, session)) {
				number--;
				boolean flag = true;
				while(number-- > 0) {
					flag = addProduct(mechanics, id, uid, session);
				}
				if (flag) {
					return true;
				}
			}
		}else if (ptype.equals("MemoryChipInf")) {
			MemoryChipInf memoryChip = new MemoryChipInf();
			if (addProduct(memoryChip, id, uid, session)) {
				number--;
				boolean flag = true;
				while(number-- > 0) {
					flag = addProduct(memoryChip, id, uid, session);
				}
				if (flag) {
					return true;
				}
			}
		}else if (ptype.equals("RadiatorInf")) {
			RadiatorInf radiator = new RadiatorInf();
			if (addProduct(radiator, id, uid, session)) {
				return true;
			}
		}else if (ptype.equals("SSDInf")) {
			SSDInf ssd = new SSDInf();
			if (addProduct(ssd, id, uid, session)) {
				number--;
				boolean flag = true;
				while(number-- > 0) {
					flag = addProduct(ssd, id, uid, session);
				}
				if (flag) {
					return true;
				}
			}
		}
		return false;
	}
	/**
	 * @param 传入表名与更新id
	 * @return 成功减少库存返回true否则返回false
	 */
	public static boolean subStock(String table, int id) {
		try {
			DB.executeQuery("UPDATE "+table+" SET stock=stock-1 WHERE id="+id+"");
			return true;
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * @param 传入表名与查询id
	 * @return 有库存返回true否则返回false
	 */
	public static boolean judgeStock(String table, int id, int number) {
		try {
			ResultSet rSet = DB.executeQuery("SELECT * FROM "+table+" WHERE id="+id+"");
			if (rSet.next()) {
				if (rSet.getInt("stock") > number) {
					return true;
				}
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return false;
	}

}
