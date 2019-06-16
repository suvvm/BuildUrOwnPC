<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
        <form action="../AddradiatorServlet" method="post" enctype="multipart/form-data">
            <div class="formgroup">
                <label for="rName">散热器名:</label>
                <input type="text" name="rName" id="rName" required>
            </div>
             <div class="formgroup">
                <label for="heatDissipation">冷却方式:</label>
            </div> 
            <div class="formgroup">
                <select id="heatDissipation" name="heatDissipation">
					<option value="风冷，水冷">风冷+水冷</option>
					<option value="风冷">风冷</option>
					<option value="水冷">水冷</option>
					<option value="风冷，热管">风冷+热管</option>
				</select>
            </div>
            <div class="formgroup">
                <label for="noise">噪音:</label>
                <input type="text" name="noise" id="noise" required>
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