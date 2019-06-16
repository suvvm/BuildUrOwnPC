<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
        <form action="../AddmemorychipServlet" method="post" enctype="multipart/form-data">
            <div class="formgroup">
                <label for="mName">内存名:</label>
                <input type="text" name="mName" id="mName" required>
            </div>
            <div class="formgroup">
                <label for="brand">品牌:</label>
                <input type="text" name="brand" id="brand" required>
            </div> 
             <div class="formgroup">
                <label for="capacity">容量(GB):</label>
                <input type="number" name="capacity" id="capacity" required>
            </div> 
            <div class="formgroup">
                <label for="bf">插槽:</label>
            </div>
            <div class="formgroup">
                <select id="bf" name="bf">
					<option value="DDR3">DDR3</option>
					<option value="DDR4">DDR4</option>
				</select>
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