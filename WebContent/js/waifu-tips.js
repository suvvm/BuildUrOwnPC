String.prototype.render = function (context) {
    var tokenReg = /(\\)?\{([^\{\}\\]+)(\\)?\}/g;

    return this.replace(tokenReg, function (word, slash1, token, slash2) {
        if (slash1 || slash2) {
            return word.replace('\\', '');
        }

        var variables = token.replace(/\s/g, '').split('.');
        var currentObject = context;
        var i, length, variable;

        for (i = 0, length = variables.length; i < length; ++i) {
            variable = variables[i];
            currentObject = currentObject[variable];
            if (currentObject === undefined || currentObject === null) return '';
        }
        return currentObject;
    });
};

var re = /x/;
console.log(re);
re.toString = function() {
    showMessage('控制台！', 5000, true);
    return '';
};
//将复制事件注册到所有html控件
$(document).on('copy', function (){
    showMessage('请随便复制，只要加上出处就ok辣！', 5000, true);
});
//前往首页
$('.waifu-tool .fui-home').click(function (){
    window.location = "http://localhost:8080/BuildPc/pages/index.jsp"
});
//切换看板娘
$('.waifu-tool .fui-eye').click(function (){
    loadOtherModel();
});
//念诗
$('.waifu-tool .fui-chat').click(function (){
	showMessage('苟利国家生死以，岂因祸福避趋之！', 3000, true);
});
//换装
$('.waifu-tool .fui-user').click(function (){
    loadRandModel();
    showMessage('我的新衣服好看吗？', 3000, true);
});
//去我李某的博客园首页
$('.waifu-tool .fui-info-circle').click(function (){
    window.open('https://www.cnblogs.com/suvvm/');
});
//关闭看板娘
$('.waifu-tool .fui-cross').click(function (){
    sessionStorage.setItem('waifu-dsiplay', 'none');
    showMessage('愿你有一天能与重要的人重逢', 1300, true);
    window.setTimeout(function() {$('.waifu').hide();}, 1300);
});

$('.waifu-tool .fui-photo').click(function (){
    showMessage('照相吗，茄子', 5000, true);
    window.Live2D.captureName = 'Live2D.png';
    window.Live2D.captureFrame = true;
});

function waifuWelcome(){
    var text;
    var SiteIndexUrl = 'http://localhost:8080/BuildPc/pages/index.jsp';  // 手动指定主页


    if (window.location.href == SiteIndexUrl) {      // 首页骚话
        var now = (new Date()).getHours();
        if (now > 23 || now <= 5) {
            text = '这么晚了，又到了爆肝的……，不不不，杜绝爆肝，杜绝脱发，上床苟命';
        } else if (now > 5 && now <= 7) {
            text = '真是不容易呀，这个点居然能起来';
        } else if (now > 7 && now <= 11) {
            text = '上午好！快乐的工作与学习吧';
        } else if (now > 11 && now <= 14) {
            text = '中午了，是不是又肝了一整个上午，快去觅食吧！';
        } else if (now > 14 && now <= 17) {
            text = '可恶啊，这个时间段是一天最容易疲惫的时间呢！';
        } else if (now > 17 && now <= 19) {
            text = '傍晚了！快去食饭，健康最重要啦';
        } else if (now > 19 && now <= 21) {
            text = '晚上好，白天过的快乐吗？';
        } else if (now > 21 && now <= 23) {
            text = '这个时间可是suvvm最亢奋的时间段呢~';
        } else {
            text = '嗨~ 不要盯总时着网页看，与我一同快乐吧~';
        }
    } else {	//否则获取来源页进行处理 毕竟还是想往服务器上挂的，不过鄙人莫得域名，免费域名据说不能被搜索引擎搜到
        if(document.referrer !== ''){
            var referrer = document.createElement('a'); //动态创建个a标签
            referrer.href = document.referrer;
            //document的referrer属性可返回载入当前文档的文档的 URL 
            var domain = referrer.hostname.split('.')[1];
            if (window.location.hostname == referrer.hostname) {
            	if(document.title.split(' - ')[0] == "JSP Page" )
            		text = '可恶呀，出错了呢！';
            	else
            		text = '欢迎阅读<span style="color:#0099cc;">『' + document.title.split(' - ')[0] + '』</span>';
            } else if (domain == 'baidu') {
                text = 'Hello! 百度来的同志<br>欢迎您的光临';
            } else if (domain == 'so') {
                text = 'Hello! 来自360搜索的同志<br>欢迎您的光临';
            }else if (domain == 'bing') {
                text = 'Hello! 来自必应的同志<br>欢迎您的光临';
            }else if (domain == 'google') {
                text = 'Hello! 来自谷歌的同志<br>欢迎您的光临哟';
            }else if (domain == 'yahoo') {
                text = 'Hello! 来自雅虎的同志<br>欢迎您的光临哟';
            }else if (domain == 'sogou') {
                text = 'Hello! 来自搜狗的同志<br>欢迎您的光临哟';
            } else {
                text = 'Hello! 来自 <span style="color:#0099cc;">' + referrer.hostname + '</span> 的朋友';
            }
        } else {
            text = '欢迎阅读<span style="color:#0099cc;">『' + document.title.split(' - ')[0] + '』</span>';
        }
    }
    showMessage(text, 6000);
}

function showMessage(text, timeout, flag){	//让看板娘脑袋上显示骚话
    //如果flag为true 或键名为waifu-text的值为空或不存在 
	if(flag || sessionStorage.getItem('waifu-text') === '' || sessionStorage.getItem('waifu-text') === null){
        if(Array.isArray(text)) text = text[Math.floor(Math.random() * text.length + 1)-1];
        if(flag) sessionStorage.setItem('waifu-text', text); //如果flag为true就创建一个名为waifu-text值为传入的text的键值对
        $('.waifu-tips').stop();
        //把当前正在执行的动画停了
        $('.waifu-tips').html(text).fadeTo(200, 1);
        if (timeout === undefined) timeout = 5000;
        hideMessage(timeout);
    }
}

function hideMessage(timeout){	//对话消失
    $('.waifu-tips').stop().css('opacity',1);
    if (timeout === undefined) timeout = 5000;
    window.setTimeout(function() {sessionStorage.removeItem('waifu-text')}, timeout);
    //延迟5秒隐藏
    $('.waifu-tips').delay(timeout).fadeTo(200, 0);
}
//下面塞了json字符串 
var waifuJson = {
    "mouseover": [
        {
            "selector": ".footer",
            "text": ["注意版权哟"]
        },
        {
            "selector": "#index",
            "text": ["这里链接着网站的首页呢~"]
        },
        {
            "selector": "#webInf",
            "text": ["快来看看本站的介绍吧~"]
        },
        {
            "selector": "#assemble",
            "text": ["点击这里可以开始组装电脑呢~"]
        },
        {
            "selector": "#partsInf",
            "text": ["看看配件的信息可以更好的选择配件哟~"]
        },
        {
            "selector": "#myAssmnle",
            "text": ["如果您已经登录了的话可以从这里看到您的组装信息哟~"]
        },
        {
            "selector": "#logout",
            "text": ["要注销账户吗？您一定已经下单付款了吧？谢谢惠顾~"]
        },
        {
            "selector": "#login",
            "text": ["还没有登录吗？快来登录吧，如果没有账户的话也可以从这里建立哟~"]
        },
        {
            "selector": "#errorInf",
            "text": ["徐英豪先生可真是一个臭腚眼呢~"]
        },
        {
            "selector": "#loginSub",
            "text": ["快快登录吧~"]
        },
        {
            "selector": "#rememberme",
            "text": ["要记住登录信息吗？"]
        },
        {
            "selector": "#toRegister",
            "text": ["要注册吗？"]
        },
        {
        	"selector": "#radiator",
        	"text": ["要看一看散热器吗？"],
        },
        {
        	"selector": "#ssd",
        	"text": ["要看一看固态硬盘吗？"]
        },{
        	"selector": "#graphics",
        	"text": ["要看一看显卡吗？"]
        },
        {
        	"selector": "#echanics",
        	"text" : ["要看一看鸡巴吗?"]
        },
        {
        	"selector": "#cpu",
        	"text": ["要看一看cpu吗?"]
        },
        {
        	"selector" : "#memorychip",
        	"text": ["要看一看内存条吗？"]
        },
        {
        	"selector" : "#mainBoard",
        	"text":["要看一看主板吗?"]
        },
        {
        	"selector" : "#recommend",
        	"text":["要我为你推荐一款电脑吗?"]
        }
    ],
    "click": [
        {
            "selector": ".waifu #live2d",
            "text": ["不要乱点啦~", "点击这里好像不能让你变强哟", "再点我可就要报警了", "你就这么喜欢点我吗？", "‘(*>﹏<*)′ (*+﹏+*) ~ó﹏ò｡)"]
        }
    ],
    "seasons": [
        {
            "date": "01/01",
            "text": "<span style=\"color:#0099cc;\">元旦</span>了呢，新的一年又开始了，今年是{year}年~"
        },
        {
            "date": "02/14",
            "text": "<span style=\"color:#0099cc;\">情人节</span>，{year}洋人找对象的节日"
        },
        {
            "date": "03/08",
            "text": "今天是<span style=\"color:#0099cc;\">妇女节</span>！"
        },
        {
            "date": "03/12",
            "text": "今天是<span style=\"color:#0099cc;\">植树节</span>，要保护环境呀"
        },
        {
            "date": "04/01",
            "text": "悄悄告诉你一个秘密~<span style=\"background-color:#34495e;\">你被删库了~ 愚人节快乐</span>"
        },
        {
            "date": "05/01",
            "text": "今天是<span style=\"color:#0099cc;\">五一劳动节</span>，既然是劳动节，过什么假期呀，起来肝~"
        },
        {
            "date": "06/01",
            "text": "<span style=\"color:#0099cc;\">儿童节</span>了呢，今天我们都是大宝宝~"
        },
        {
            "date": "09/03",
            "text": "<span style=\"color:#0099cc;\">中国人民抗日战争胜利纪念日</span>小鬼子在历史上的今天被打跑了呢"
        },
        {
            "date": "09/10",
            "text": "<span style=\"color:#0099cc;\">教师节</span>，在学校要给老师问声好呀~"
        },
        {
            "date": "10/01",
            "text": "<span style=\"color:#0099cc;\">国庆节</span>，是祖国的生日呢"
        },
        {
            "date": "11/05-11/12",
            "text": "今年的<span style=\"color:#0099cc;\">双十一</span>可惜suvvm莫得钱，更莫得对象~"
        },
        {
            "date": "12/25",
            "text": "今天不止是<span style=\"color:#0099cc;\">圣诞节</span> 老毛子在今天解体了呢，而且明天是毛主席生日呢"
        },
        {
            "date": "12/25",
            "text": "今天是<span style=\"color:#0099cc;\">毛主席生日呢</span> "
        }
		
    ]
};

function initModel(){	//初始化看板娘
    waifuWelcome();
    //获取modelId与modelTexturesId本地存储的值
    var modelId = localStorage.getItem('modelId');
    var modelTexturesId = localStorage.getItem('modelTexturesId');

    if (modelId == null) {

        // 首次访问加载 指定模型 指定材质 

        var modelId = 2;            // 模型 ID
        var modelTexturesId = 49;    // 材质 ID

    } loadModel(modelId, modelTexturesId);
    //对modelId与modelTexturesId进行本地持久化

    $.each(waifuJson.mouseover, function (index, tips){	//遍历上面的鼠标上移骚话json键值对  index为键tips为值
    	$(document).on("mouseover", tips.selector, function (){	//找到指定子元素后的处理
            var text = tips.text;
            //若tips有多个属性随机从其中选一个
            if(Array.isArray(tips.text)) text = tips.text[Math.floor(Math.random() * tips.text.length + 1)-1];
            text = text.render({text: $(this).text()});
            showMessage(text, 3000);
        });
    });
    $.each(waifuJson.click, function (index, tips){	//遍历上面的点击骚话json键值对 index为键tips为值
        $(document).on("click", tips.selector, function (){//找到指定子元素后的处理
            var text = tips.text;
            if(Array.isArray(tips.text)) text = tips.text[Math.floor(Math.random() * tips.text.length + 1)-1];
            text = text.render({text: $(this).text()});
            showMessage(text, 3000, true);
        });
    });
    $.each(waifuJson.seasons, function (index, tips){	//上述日期json
        var now = new Date();
        var after = tips.date.split('-')[0];
        var before = tips.date.split('-')[1] || after;

        if((after.split('/')[0] <= now.getMonth()+1 && now.getMonth()+1 <= before.split('/')[0]) &&
            (after.split('/')[1] <= now.getDate() && now.getDate() <= before.split('/')[1])){
            var text = tips.text;
            if(Array.isArray(tips.text)) text = tips.text[Math.floor(Math.random() * tips.text.length + 1)-1];
            text = text.render({year: now.getFullYear()});
            showMessage(text, 6000, true);
        }
    });
}

function loadModel(modelId, modelTexturesId){	//加载live2d模型
    localStorage.setItem('modelId', modelId);
    if (modelTexturesId === undefined) modelTexturesId = 0;
    localStorage.setItem('modelTexturesId', modelTexturesId);
    //巨佬将其窃取的一些live2d模型打包再了一个json中放在网上，尊重大佬劳动，就不荡下来了，还不用担心侵权
    loadlive2d('live2d', '//api.fghrsh.net/live2d/get/?id='+modelId+'-'+modelTexturesId, console.log('live2d','模型 '+modelId+'-'+modelTexturesId+' 加载完成'));
}

function loadRandModel(){	//换装
    var modelId = localStorage.getItem('modelId');
    var modelTexturesId = localStorage.getItem('modelTexturesId');

    var modelTexturesRandMode = 'rand';     // 可选 'rand'(随机), 'switch'(递增)

    $.ajax({
        cache: false,
        url: '//api.fghrsh.net/live2d/'+modelTexturesRandMode+'_textures/?id='+modelId+'-'+modelTexturesId,
        dataType: "json",
        success: function (result){
            loadModel(modelId, result.textures['id']);
        }
    });
}

function loadOtherModel(){	//换人
    var modelId = localStorage.getItem('modelId');

    var modelTexturesRandMode = 'switch';     // 可选 'rand'(随机), 'switch'(递增)

    $.ajax({
        cache: false,
        url: '//api.fghrsh.net/live2d/'+modelTexturesRandMode+'/?id='+modelId,
        dataType: "json",
        success: function (result){
            loadModel(result.model['id']);
            showMessage(result.model['message'], 3000, true);
        }
    });
}
