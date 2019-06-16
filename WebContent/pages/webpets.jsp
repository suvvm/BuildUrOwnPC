<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> <!--wc3标准 xml命名空间 -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Live2D</title>
    <link rel="stylesheet" type="text/css" href="../css/waifu.css"/>
    <script src="../js/jquery.min.js"></script>
</head>
<body>
    <link rel="stylesheet" type="text/css" href="../css/waifu.css">
    <div class="waifu" id="waifu">
        <div class="waifu-tips" style="opacity: 1;"></div>
        <canvas id="live2d" width="280" height="250" class="live2d"></canvas>
        <div class="waifu-tool">
            <span class="fui-home"></span>
            <span class="fui-chat"></span>
            <span class="fui-eye"></span>
            <span class="fui-user"></span>
            <span class="fui-photo"></span>
            <span class="fui-info-circle"></span>
            <span class="fui-cross"></span>
        </div>
    </div>
    <script src="../js/live2d.js"></script>
    <script src="../js/waifu-tips.js"></script>
    <script type="text/javascript">initModel()</script>
</body>
</html>
<link rel="stylesheet" type="text/css" href="../css/flat-ui.min.css"/>
  