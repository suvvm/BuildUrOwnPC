<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
        <form action="../AddcpuServlet" method="post" enctype="multipart/form-data">
            <div class="formgroup">
                <label for="cpuName">CPU名:</label>
                <input type="text" name="cpuName" id="cpuName" required>
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
                <label for="core_number">核数:</label>
                <input type="number" name="core_number" id="core_number" required>
            </div> 
            <div class="formgroup">
                <label for="cpu_frequency">主频:</label>
                <input type="text" name="cpu_frequency" id="cpu_frequency" required>
            </div>
            
            <div class="formgroup">
                <label for="bits64">64位支持:</label>
                <input type="number" name="bits64" id="bits64" required>
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