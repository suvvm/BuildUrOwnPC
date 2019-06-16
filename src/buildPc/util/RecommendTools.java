package buildPc.util;

import java.util.List;
import java.util.Random;

import buildPc.inf.CpuInf;
import buildPc.inf.GraphicsInf;
import buildPc.inf.MainboardInf;
import buildPc.inf.MechanicsInf;
import buildPc.inf.MemoryChipInf;
import buildPc.inf.RadiatorInf;
import buildPc.inf.SSDInf;

public class RecommendTools {
	public static MainboardInf recMainboard(int rflag) {
		if (rflag == 1) {	//便宜
			MainboardInf minPrice = null;
			int nowPrice = Integer.MAX_VALUE;
			List<MainboardInf> mainboardList = MainboardInf.getInf();
			for (MainboardInf m : mainboardList) {
				if (m.getPrice() < nowPrice) {
					nowPrice = m.getPrice();
					minPrice = m;
				}
			}
			return minPrice;
		}else if (rflag == 3) {	//贵
			MainboardInf maxPrice = null;
			int nowPrice = 0;
			List<MainboardInf> mainboardList = MainboardInf.getInf();
			for (MainboardInf m : mainboardList) {
				if (m.getPrice() > nowPrice) {
					nowPrice = m.getPrice();
					maxPrice = m;
				}
			}
			return maxPrice;
		}else {	//随机
			List<MainboardInf> mainboardList = MainboardInf.getInf();
			Random random = new Random();
			int n = random.nextInt(mainboardList.size());
			return mainboardList.get(n);
		}
	}
	
	public static CpuInf recCpu(MainboardInf mainboard, int rflag) {
		if (rflag == 1) {	//便宜
			List<CpuInf> cpuList = CpuInf.getInf();
			CpuInf minPrice = null;
			int nowPrice = Integer.MAX_VALUE;
			for (CpuInf c : cpuList) {
				if (c.getPrice() < nowPrice && c.getCpuSlot().equals(mainboard.getCpuSlot())) {
					minPrice = c;
					nowPrice = c.getPrice();
				}
			}
			return minPrice;
		}else if (rflag == 3) {	//贵
			List<CpuInf> cpuList = CpuInf.getInf();
			CpuInf maxPrice = null;
			int nowPrice = 0;
			for (CpuInf c : cpuList) {
				if (c.getPrice() > nowPrice && c.getCpuSlot().equals(mainboard.getCpuSlot())) {
					maxPrice = c;
					nowPrice = c.getPrice();
				}
			}
			return maxPrice;
		}else if (rflag == 0) {	//高性能
			List<CpuInf> cpuList = CpuInf.getInf();
			CpuInf maxHz = null;
			double nowHz = 0;
			for (CpuInf c : cpuList) {
				if (c.getCpu_frequency() > nowHz && JudgeAssembleTools.judgeCup(mainboard, c)) {
					maxHz = c;
					nowHz = c.getCpu_frequency();
				}
			}
			return maxHz;
		}else {
			List<CpuInf> cpuList = CpuInf.getInf();
			Random random = new Random();
			int n = random.nextInt(cpuList.size());
			int t = 100;
			while (!JudgeAssembleTools.judgeCup(mainboard, cpuList.get(n)) && t-- > 0) {
				n = random.nextInt(cpuList.size());
			}
			if (t <= 0) {
				return null;
			}
			return cpuList.get(n);
		}
	}
	
	public static RadiatorInf recRadiator(int rflag) {
		if (rflag == 1) {	//便宜
			RadiatorInf minPrice = null;
			int nowPrice = Integer.MAX_VALUE;
			List<RadiatorInf> radiatorList = RadiatorInf.getInf();
			for (RadiatorInf m : radiatorList) {
				if (m.getPrice() < nowPrice) {
					nowPrice = m.getPrice();
					minPrice = m;
				}
			}
			return minPrice;
		}else if (rflag == 3) {	//贵
			RadiatorInf maxPrice = null;
			int nowPrice = 0;
			List<RadiatorInf> radiatorList = RadiatorInf.getInf();
			for (RadiatorInf m : radiatorList) {
				if (m.getPrice() > nowPrice) {
					nowPrice = m.getPrice();
					maxPrice = m;
				}
			}
			return maxPrice;
		}else {	//随机
			List<RadiatorInf> radiatorList = RadiatorInf.getInf();
			Random random = new Random();
			int n = random.nextInt(radiatorList.size());
			return radiatorList.get(n);
		}
	}
	
	public static GraphicsInf recGraphics(MainboardInf mainboard, int rflag) {
		if (rflag == 1) {	//便宜
			GraphicsInf minPrice = null;
			int nowPrice = Integer.MAX_VALUE;
			List<GraphicsInf> graphicsList = GraphicsInf.getInf();
			for (GraphicsInf g : graphicsList) {
				if (JudgeAssembleTools.judgeGraphics(mainboard, g) && g.getPrice() < nowPrice) {
					nowPrice = g.getPrice();
					minPrice = g;
				}
			}
			return minPrice;
		}else if (rflag == 3) {	//贵
			GraphicsInf maxPrice = null;
			int nowPrice = 0;
			List<GraphicsInf> graphicsList = GraphicsInf.getInf();
			for (GraphicsInf g : graphicsList) {
				if (JudgeAssembleTools.judgeGraphics(mainboard, g) && g.getPrice() > nowPrice) {
					nowPrice = g.getPrice();
					maxPrice = g;
				}
			}
			return maxPrice;
		}else if (rflag == 0) {	//性能 本来向按显存排呢 结构我忽然发现 莫得记录显存
			GraphicsInf maxPrice = null;
			int nowPrice = 0;
			List<GraphicsInf> graphicsList = GraphicsInf.getInf();
			for (GraphicsInf g : graphicsList) {
				if (JudgeAssembleTools.judgeGraphics(mainboard, g) && g.getPrice() > nowPrice) {
					nowPrice = g.getPrice();
					maxPrice = g;
				}
			}
			return maxPrice;
		}else {	//随机
			List<GraphicsInf> graphicsList = GraphicsInf.getInf();
			Random random = new Random();
			int n = random.nextInt(graphicsList.size());
			int t = 100;
			while(!JudgeAssembleTools.judgeGraphics(mainboard, graphicsList.get(n)) && t-- > 0){
				n = random.nextInt(graphicsList.size());
			}
			if (t <= 0) {
				return null;
			}
			return graphicsList.get(n);
		}
	}
	
	public static MemoryChipInf recMemorychip(MainboardInf mainboard, int rflag) {
		if (rflag == 1) {	//便宜
			MemoryChipInf minPrice = null;
			int nowPrice = Integer.MAX_VALUE;
			List<MemoryChipInf> memoryChipList = MemoryChipInf.getInf();
			for (MemoryChipInf g : memoryChipList) {
				if (JudgeAssembleTools.judgeMemorychip(mainboard, g) && g.getPrice() < nowPrice) {
					nowPrice = g.getPrice();
					minPrice = g;
				}
			}
			return minPrice;
		}else if (rflag == 3) {	//贵
			MemoryChipInf maxPrice = null;
			int nowPrice = 0;
			List<MemoryChipInf> memoryChipList = MemoryChipInf.getInf();
			for (MemoryChipInf g : memoryChipList) {
				if (JudgeAssembleTools.judgeMemorychip(mainboard, g) && g.getPrice() > nowPrice) {
					nowPrice = g.getPrice();
					maxPrice = g;
				}
			}
			return maxPrice;
		}else if (rflag == 0) {	//性能 本来向按显存排呢 结构我忽然发现 莫得记录显存
			MemoryChipInf maxCapacity= null;
			int nowCapacity = 0;
			List<MemoryChipInf> memoryChipList = MemoryChipInf.getInf();
			for (MemoryChipInf g : memoryChipList) {
				if (JudgeAssembleTools.judgeMemorychip(mainboard, g) && g.getCapacity() > nowCapacity) {
					nowCapacity = g.getPrice();
					maxCapacity = g;
				}
			}
			return maxCapacity;
		}else {	//随机
			List<MemoryChipInf> memoryChipList = MemoryChipInf.getInf();
			Random random = new Random();
			int n = random.nextInt(memoryChipList.size());
			int t = 100;
			while(!JudgeAssembleTools.judgeMemorychip(mainboard, memoryChipList.get(n)) && t-- > 0){
				n = random.nextInt(memoryChipList.size());
			}
			if (t <= 0) {
				return null;
			}
			return memoryChipList.get(n);
		}
	}
	
	public static MechanicsInf recMechanics(MainboardInf mainboard, int rflag) {
		if (rflag == 1) {	//便宜
			MechanicsInf minPrice = null;
			int nowPrice = Integer.MAX_VALUE;
			List<MechanicsInf> mechanicsList = MechanicsInf.getInf();
			for (MechanicsInf g : mechanicsList) {
				if (JudgeAssembleTools.judgeMechanicsInf(mainboard, g) && g.getPrice() < nowPrice) {
					nowPrice = g.getPrice();
					minPrice = g;
				}
			}
			return minPrice;
		}else if (rflag == 3) {	//贵
			MechanicsInf maxPrice = null;
			int nowPrice = 0;
			List<MechanicsInf> mechanicsList = MechanicsInf.getInf();
			for (MechanicsInf g : mechanicsList) {
				if (JudgeAssembleTools.judgeMechanicsInf(mainboard, g) && g.getPrice() > nowPrice) {
					nowPrice = g.getPrice();
					maxPrice = g;
				}
			}
			return maxPrice;
		}else if (rflag == 0) {	//性能 本来向按显存排呢 结构我忽然发现 莫得记录显存
			MechanicsInf maxCapacity= null;
			int nowCapacity = 0;
			List<MechanicsInf> mechanicsList = MechanicsInf.getInf();
			for (MechanicsInf g : mechanicsList) {
				if (JudgeAssembleTools.judgeMechanicsInf(mainboard, g) && g.getCapacity() > nowCapacity) {
					nowCapacity = g.getPrice();
					maxCapacity = g;
				}
			}
			return maxCapacity;
		}else {	//随机
			List<MechanicsInf> mechanicsList = MechanicsInf.getInf();
			Random random = new Random();
			int n = random.nextInt(mechanicsList.size());
			int t = 100;
			while(!JudgeAssembleTools.judgeMechanicsInf(mainboard, mechanicsList.get(n)) && t-- > 0){
				n = random.nextInt(mechanicsList.size());
			}
			if (t <= 0) {
				return null;
			}
			return mechanicsList.get(n);
		}
	}
	
	public static SSDInf recSSD(MainboardInf mainboard, int rflag) {
		if (rflag == 1) {	//便宜
			SSDInf minPrice = null;
			int nowPrice = Integer.MAX_VALUE;
			List<SSDInf> ssdList = SSDInf.getInf();
			for (SSDInf g : ssdList) {
				if (JudgeAssembleTools.judgeSSD(mainboard, g) && g.getPrice() < nowPrice) {
					nowPrice = g.getPrice();
					minPrice = g;
				}
			}
			return minPrice;
		}else if (rflag == 3) {	//贵
			SSDInf maxPrice = null;
			int nowPrice = 0;
			List<SSDInf> ssdList = SSDInf.getInf();
			for (SSDInf g : ssdList) {
				if (JudgeAssembleTools.judgeSSD(mainboard, g) && g.getPrice() > nowPrice) {
					nowPrice = g.getPrice();
					maxPrice = g;
				}
			}
			return maxPrice;
		}else if (rflag == 0) {	//性能 本来向按显存排呢 结构我忽然发现 莫得记录显存
			SSDInf maxCapacity= null;
			int nowCapacity = 0;
			List<SSDInf> ssdList = SSDInf.getInf();
			for (SSDInf g : ssdList) {
				if (JudgeAssembleTools.judgeSSD(mainboard, g) && g.getCapacity() > nowCapacity) {
					nowCapacity = g.getPrice();
					maxCapacity = g;
				}
			}
			return maxCapacity;
		}else {	//随机
			List<SSDInf> ssdList = SSDInf.getInf();
			Random random = new Random();
			int n = random.nextInt(ssdList.size());
			int t = 100;
			while(!JudgeAssembleTools.judgeSSD(mainboard, ssdList.get(n)) && t-- > 0){
				n = random.nextInt(ssdList.size());
			}
			if (t <= 0) {
				return null;
			}
			return ssdList.get(n);
		}
	}
}
