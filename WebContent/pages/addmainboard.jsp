<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
        <form action="../AddmainboardServlet" method="post" enctype="multipart/form-data">
            <div class="formgroup">
                <label for="mName">主板名:</label>
                <input type="text" name="mName" id="mName" required>
            </div>
            <div class="formgroup">
                <label for="brand">品牌:</label>
                <input type="text" name="brand" id="brand" required>
            </div> 
             <div class="formgroup">
                <label for="platform">平台:</label>
                <input type="text" name="platform" id="platform" required>
            </div> 
            <div class="formgroup">
                <label for="chipset">芯片组:</label>
                <input type="text" name="chipset" id="chipset" required>
            </div>
            <div class="formgroup">
                <label for="integratedGraphics">板载显卡:</label>
                <input type="number" name="integratedGraphics" id="integratedGraphics" required>
            </div>
            <div class="formgroup">
                <label for="mDotTowNum">M.2数量:</label>
                <input type="number" name="mDotTowNum" id="mDotTowNum" required>
            </div>
            <div class="formgroup">
                <label for="sataNum">SATA数量:</label>
                <input type="number" name="sataNum" id="sataNum" required>
            </div>
            <div class="formgroup">
                <label for="cpuSlot">CPU接口:</label>
			</div>
            <div class="formgroup">
                <select id="cpuSlot" name="cpuSlot">
					<option value="LGA">LGA</option>
					<option value="Socket AM4">Socket AM4</option>
				</select>
            </div>
            <div class="formgroup">
                <label for="ramSlot">内存接口:</label>
            </div>
            <div class="formgroup">
                <select id="ramSlot" name="ramSlot">
					<option value="DDR3">DDR3</option>
					<option value="DDR4">DDR4</option>
				</select>
            </div>
            <div class="formgroup">
                <label for="ramSlotNum">内存插槽数量:</label>
                <input type="number" name="ramSlotNum" id="ramSlotNum" required>
            </div>
            <div class="formgroup">
                <label for="hdmi">HDMI数量:</label>
                <input type="number" name="hdmi" id="hdmi" required>
            </div>
            <div class="formgroup">
                <label for="dvi">DVI数量:</label>
                <input type="number" name="dvi" id="dvi" required>
            </div>
            <div class="formgroup">
                <label for="vga">VGA数量:</label>
                <input type="number" name="vga" id="vga" required>
            </div>
            <div class="formgroup">
                <label for="pic">PIC数量:</label>
                <input type="number" name="pic" id="pic" required>
            </div>
            <div class="formgroup">
                <label for="dp">DP数量:</label>
                <input type="number" name="dp" id="dp" required>
            </div>
            <div class="formgroup">
                <label for="usb2">USB2.0数量:</label>
                <input type="number" name="usb2" id="usb2" required>
            </div>
            <div class="formgroup">
                <label for="usb3">USB3.0数量:</label>
                <input type="number" name="usb3" id="usb3" required>
            </div>
            <div class="formgroup">
                <label for="networkcard">板载网卡:</label>
                <input type="text" name="networkcard" id="networkcard" required>
            </div>
            <div class="formgroup">
                <label for="networkInterface">网络接口:</label>
                <input type="text" name="networkInterface" id="networkInterface" required>
            </div>
            <div class="formgroup">
                <label for="price">价格:</label>
                <input type="number" name="price" id="price" required>
            </div>
            <div class="formgroup">
                <label for="stock">库存:</label>
                <input type="number" name="stock" id="stock" required>
            </div>
            <div class="formgroup">                                                                                                                          
                <label for="img">图片:</label>
                <input type="file" name="img" id="img" required>
            </div>
            <div class="formgroup">
                <input type="submit" value=" 提交">
            </div>
        </form>
</body>
</html>