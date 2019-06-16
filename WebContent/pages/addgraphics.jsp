<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
        <form action="../AddgraphicsServlet" method="post" enctype="multipart/form-data">
            <div class="formgroup">
                <label for="gName">显卡名:</label>
                <input type="text" name="gName" id="gName" required>
            </div>
            <div class="formgroup">
                <label for="brand">品牌:</label>
                <input type="text" name="brand" id="brand" required>
            </div> 
             <div class="formgroup">
                <label for="directX">directX支持版本:</label>
                <input type="text" name="directX" id="directX" required>
            </div> 
            <div class="formgroup">
                <label for="OpenGL">OpenGL支持版本:</label>
                <input type="text" name="OpenGL" id="OpenGL" required>
            </div> 
             <div class="formgroup">
                <label for="Interface">接口:</label>
            </div>
            <div class="formgroup">
                <select id="Interface" name="Interface">
					<option value="PCI Express 3.0 16X">PCI Express 3.0 16X</option>
					<option value="DP">DP</option>
					<option value="DVI">DVI</option>
				</select>
            </div>
           	<div class="formgroup">
                <label for="maxResolution">最高分辨率:</label>
                <input type="text" name="maxResolution" id="maxResolution" required>
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