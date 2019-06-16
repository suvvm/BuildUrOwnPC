package buildPc.inf;

import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Protocol.GetProfilerEventHandlerInstanceFunction;

import buildPc.util.DB;

public class UserAssemble {
	private int id;
	private CpuInf cpu;
	private MainboardInf mainboard;
	private RadiatorInf radiator;
	private List<MemoryChipInf> memoryChip;
	private List<GraphicsInf> graphics;
	private List<MechanicsInf> mechanics;
	private List<SSDInf> ssd;
	public UserAssemble() {
		// TODO 自动生成的构造函数存根
	}
	public UserAssemble(int id,CpuInf cpu, MainboardInf mainboard, RadiatorInf radiator, List<MemoryChipInf> memoryChip,
			List<GraphicsInf> graphics, List<MechanicsInf> mechanics, List<SSDInf> ssd) {
		super();
		this.id = id;
		this.cpu = cpu;
		this.mainboard = mainboard;
		this.radiator = radiator;
		this.memoryChip = memoryChip;
		this.graphics = graphics;
		this.mechanics = mechanics;
		this.ssd = ssd;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public CpuInf getCpu() {
		return cpu;
	}
	public void setCpu(CpuInf cpu) {
		this.cpu = cpu;
	}
	public MainboardInf getMainboard() {
		return mainboard;
	}
	public void setMainboard(MainboardInf mainboard) {
		this.mainboard = mainboard;
	}
	public RadiatorInf getRadiator() {
		return radiator;
	}
	public void setRadiator(RadiatorInf radiator) {
		this.radiator = radiator;
	}
	public List<MemoryChipInf> getMemoryChip() {
		return memoryChip;
	}
	public void setMemoryChip(List<MemoryChipInf> memoryChip) {
		this.memoryChip = memoryChip;
	}
	public List<GraphicsInf> getGraphics() {
		return graphics;
	}
	public void setGraphics(List<GraphicsInf> graphics) {
		this.graphics = graphics;
	}
	public List<MechanicsInf> getMechanics() {
		return mechanics;
	}
	public void setMechanics(List<MechanicsInf> mechanics) {
		this.mechanics = mechanics;
	}
	public List<SSDInf> getSsd() {
		return ssd;
	}
	public void setSsd(List<SSDInf> ssd) {
		this.ssd = ssd;
	}
	public int getPrice() {
		int price = 0;
		if(null != mainboard) {
			price += mainboard.getPrice();
		}
		if(null != cpu) {
			price += cpu.getPrice();
		}
		if(null != radiator) {
			price += radiator.getPrice();
		}
		if(null != graphics) {
			for(GraphicsInf g : graphics) {
				price += g.getPrice();
			}
		}
		if(null != mechanics) {
			for(MechanicsInf mec : mechanics) {
				price += mec.getPrice();
			}	
		}
		if(null != memoryChip) {
			for(MemoryChipInf mem : memoryChip) {
				price += mem.getPrice();
			}
		}
		if(null != ssd) {
			for(SSDInf s : ssd) {
				price += s.getPrice();
			}
		}
		return price;
	}
	public boolean takingout() {
		try {
			if (null != cpu) {
				DB.executeUpdate("UPDATE cpu_inf SET stock=stock-1 WHERE id="+cpu.getId()+"");	
			}
			if (null != mainboard) {
				DB.executeUpdate("UPDATE mainboard_inf SET stock=stock-1 WHERE id="+mainboard.getId()+"");
	
			}
			if (null != radiator) {
				DB.executeUpdate("UPDATE radiator SET stock=stock-1 WHERE id="+radiator.getId()+"");
			}
			if (null != graphics) {
				for(GraphicsInf g : graphics) {
					DB.executeUpdate("UPDATE graphics_inf SET stock=stock-1 WHERE id="+g.getId()+"");
				}
			}
			if (null != mechanics) {
				for(MechanicsInf m : mechanics) {
					DB.executeUpdate("UPDATE mechanics_inf SET stock=stock-1 WHERE id="+m.getId()+"");
				}
			}
			if (null != memoryChip) {
				for(MemoryChipInf m : memoryChip) {
					DB.executeUpdate("UPDATE memorychip SET stock=stock-1 WHERE id="+m.getId()+"");
				}
			}
			if (null != ssd) {
				for(SSDInf s : ssd) {
					DB.executeUpdate("UPDATE ssd_inf SET stock=stock-1 WHERE id="+s.getId()+"");
				}
			}
			return true;
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return false;
	}
}
