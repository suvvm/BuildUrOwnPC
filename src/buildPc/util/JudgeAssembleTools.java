package buildPc.util;

import buildPc.inf.CpuInf;
import buildPc.inf.GraphicsInf;
import buildPc.inf.MainboardInf;
import buildPc.inf.MechanicsInf;
import buildPc.inf.MemoryChipInf;
import buildPc.inf.SSDInf;

public class JudgeAssembleTools {
	public static boolean judgeCup(MainboardInf mainboard, CpuInf cpu) {
		if (mainboard.getCpuSlot().equals(cpu.getCpuSlot())) {
			return true;
		}
		return false;
	}
	public static boolean judgeGraphics(MainboardInf mainboard, GraphicsInf graphics) {
		if (graphics.getInterface().equals("PCI Express 3.0 16X") && mainboard.getPic() > 0) {
			return true;
		}else if (graphics.getInterface().equals("DP") && mainboard.getDp() > 0) {
			return true;
		}else if (graphics.getInterface().equals("DVI") && mainboard.getDvi() > 0) {
			return true;
		}
		return false;
	}
	public static boolean judgeMemorychip(MainboardInf mainboard, MemoryChipInf memoryChip) {
		if (memoryChip.getBf().equals(mainboard.getRamSlot())) {
			return true;
		}
		return false;
	}
	public static boolean judgeMechanicsInf(MainboardInf mainboard, MechanicsInf mechanics) {
		if (mechanics.getInterface().equals("SATA") && mainboard.getSataNum() > 0) {
			return true;
		}
		return false;
	}
	public static boolean judgeSSD(MainboardInf mainboard, SSDInf ssd) {
		if (ssd.getInterface().equals("M.2") && mainboard.getmDotTwoNum() > 0) {
			return true;
		}else if(ssd.getInterface().equals("SATA") && mainboard.getSataNum() > 0) {
			return true;
		}else if (ssd.getInterface().equals("PIC") && mainboard.getPic() > 0) {
			return true;
		}
		return false;
	}
}
