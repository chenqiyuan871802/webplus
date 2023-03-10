/**
 * 核心JS公用组件接口
 */
var cxt=''
layui.define(['upload'], function (exports) {
    var setter = layui.setter,
        $ = layui.$,
        table = layui.table,
        upload = layui.upload,
        form = layui.form;
    cxt = localStorage.getItem("reqUrl");

    var webplus = {
        cxt: function () {
            if (webplus.isEmpty(cxt)) {
                var fullUrl = window.location.href;
                var httpPrefix = window.location.protocol + "//" + window.location.host + "/";
                var urlTmp = fullUrl.replace(httpPrefix, "");
                var len = urlTmp.indexOf("/");
                if (len > -1) {
                    urlTmp = urlTmp.substring(0, len + 1);
                } else {
                    urlTmp = urlTmp + "/"
                }
                cxt = httpPrefix + urlTmp
                webplus.setName('reqUrl', cxt)
            }

            return localStorage.getItem("reqUrl");
        },
        /**
         * 判断是否为空 @str 字符串
         */
        isEmpty: function (v) {
            switch (typeof v) {
                case 'undefined':
                    return true;
                case 'string':
                    if (webplus.trim(v).length == 0)
                        return true;
                    break;
                case 'boolean':
                    if (!v)
                        return true;
                    break;
                case 'number':
                    if (0 === v)
                        return true;
                    break;
                case 'object':
                    if (null === v)
                        return true;
                    if (undefined !== v.length && v.length == 0)
                        return true;
                    for (var k in v) {
                        return false;
                    }
                    return true;
                    break;
            }
            return false;

        },
        /**
         * 处理空置
         */
        removeEmpty: function (obj) {

            if (typeof (obj) == "undefined" || obj == "" || obj == null || obj == "null" || obj.length == 0) {
                return "";
            }
            return obj;
        },
        /**
         * 获取当前月第一天
         */
        getCurrentMonthFirstDay: function () {
        	var date = new Date();
        	var y = date.getFullYear();
        	var m = date.getMonth()+1;
            if(m<10){
            	return y+"-0"+m+"-01"
            }else{
            	return y+"-"+m+"-01"
            }
        },
        /**
         * 获取当前月第一天
         */
        getCurrentDay: function () {
        	var date = new Date();
        	var y = date.getFullYear();
        	var m = date.getMonth()+1;
        	var d=date.getDate()
        	var mStr=m
        	if(m<10){
        		mStr="0"+m;
        	}
        	var dStr=d;
        	if(d<10){
        		dStr="0"+d;
        	}
        	return y+"-"+mStr+"-"+dStr;
        },
        /**
         * 去掉空格字符串
         */
        trim: function (str) {

            return str.replace(/(^\s*)|(\s*$)/g, '');
        },
        /*
         * 根据名称获取
         */
        getName: function (name) {
            return localStorage.getItem(name);
        },
        /*
         * 设置本地缓存
         */
        setName: function (key, value) {
            localStorage.setItem(key, value);
            return true;
        },
        /**
         *获取token值,用于请求接口
         */
        getToken: function () {
            return localStorage.getItem("accessToken");
        },
        /**
         *删除token值
         */
        delToken: function () {
            localStorage.setItem("accessToken", '');
        },
        /**
         *删除登陆信息
         */
        clearLogin: function () {
            localStorage.setItem("accessToken", '');
            localStorage.setItem("loginAccount", '');
            localStorage.setItem("buttonGrant", '');
            sessionStorage.setItem('lockStatus', '');
            localStorage.setItem("reqUrl", "");
            
        },
        /**
         * 显示loading加载动画 num:1/2/3 1,2兼容ie10以上 3兼容ie8 parentElem 加载动画显示的区域 #id
         */
        showLoading: function (num, parentElem) {
            var index = num,
                elem = parentElem;
            if (webplus.isEmpty(num)) {
                index = 2;
            }
            $(elem).find(".loading-bg").remove();
            if (webplus.isEmpty(parentElem)) {
                elem = 'body';
                $(elem).append(webplus.loadingArr(index));
            } else {
                var str = elem.substring(1);
                $(elem).append(webplus.loadingArr(index));
            }
        },
        /*
         * 隐藏loading加载
         */
        hideLoading: function () {
            $("body").find('[loader-box="loader"]').remove();
        },
        /*
         * 点击分页按钮加载动画
         */
        pageSilderLoading: function () {
            $('.layui-laypage > a').click(function () {
                if (!webplus.isEmpty($(this).attr('class')) && $(this).attr('class').indexOf('layui-disabled') < 0) {
                    webplus.showLoading();
                }
            })
        },
        /*
         * 设表单高度
         */
        initTableAutoHeight: function () {
            //table box 区域
            var $table = $('body').find(".layui-card-body>.layui-table-view");

            //body高度
            var bodyH = $("body").outerHeight(true);
            //顶部查询form高度
            var formH = $('body').find(".layui-form").outerHeight(true);
            //table表头按钮组高度
            var tableToolH = $table.find(".layui-table-tool").outerHeight(true);
            //table表单头部高度
            var tableHeadH = $table.find(".layui-table-box>.layui-table-header").outerHeight(true);
            //table分页组高度
            var tablePageH = $table.find(".layui-table-page").outerHeight(true);
            //table合计组高度
            var tableTotalH = $table.find(".layui-table-total").outerHeight(true);

            if (webplus.isEmpty(tableToolH)) {
                tableToolH = 0;
            }
            if (webplus.isEmpty(tablePageH)) {
                tablePageH = 0;
            }
            if (webplus.isEmpty(tableTotalH)) {
                tableTotalH = 0;
            }
            //tableBody高度
            var tableBodyH = bodyH - formH - tableToolH - tableHeadH - tablePageH - tableTotalH - 15;

            $table.css({
                "height": bodyH - formH - 15 + "px"
            });
            $table.find(".layui-table-box>.layui-table-body").css({
                "height": tableBodyH + "px"
            });
            var fixedTableH = tableBodyH - 16;
            $table.find(".layui-table-box>.layui-table-fixed>.layui-table-body").css({
                "height": fixedTableH + "px"
            });
        },
        loadingArr: function (num) {
            var loader1 = '<div class="loading-bg" loader-box="loader">' +
                '<div id="loader1" class="spinner">' +
                '<div class="spinner-container container1">' +
                '<div class="circle1"></div>' +
                '<div class="circle2"></div>' +
                '<div class="circle3"></div>' +
                '<div class="circle4"></div>' + '</div>' +
                '<div class="spinner-container container2">' +
                '<div class="circle1"></div>' +
                '<div class="circle2"></div>' +
                '<div class="circle3"></div>' +
                '<div class="circle4"></div>' + '</div>' +
                '<div class="spinner-container container3">' +
                '<div class="circle1"></div>' +
                '<div class="circle2"></div>' +
                '<div class="circle3"></div>' +
                '<div class="circle4"></div>' + '</div>' + '</div>' +
                '</div>';
            var loader2 = '<div class="loading-bg" loader-box="loader">' +
                '<div id="loader2" class="spinner">' +
                '<div class="rect1"></div>' + '<div class="rect2"></div>' +
                '<div class="rect3"></div>' + '<div class="rect4"></div>' +
                '<div class="rect5"></div>' + '</div>' + '</div>';
            var loader3 = '<div class="loading-bg" loader-box="loader">' +
                '<div id="loader3" class="spinner">' + '</div>' +
                '</div>';
            switch (num) {
                case 1:
                    return loader1;
                    break;
                case 2:
                    return loader2;
                    break;
                case 3:
                    return loader3;
                    break;
                default:
                    return loader2;
                    break;
            }
        },
        /*
         * 成功信息提示框
         *@info  提示信息
         *@callback 回调函数
         */
        alertSuccess: function (info, callback) {
            if (!webplus.isEmpty(callback) && typeof (callback) === "function") {
                layer.msg(info, {
                    icon: 1,
                    time: 500
                }, function () {
                    callback();
                });
            } else {
                layer.msg(info, {
                    icon: 1,
                    time: 1000
                });
            }
        },

        /*
         * 失败信息提示框
         *@info  提示信息
         */
        alertWarn: function (info) {
            layer.alert(info, function (index) {
                layer.close(index);
            });
        },
        /*
         * 警告信息提示框
         * @info  提示信息
         */
        alertError: function (info) {
            layer.msg(info, {
                icon: 2,
                time: 1000
            });
        },
        /*
         *tip层提示
         * @obj
         * {
         *  logTips:  提示信息
         *  id:   对象
         * index: 1 成功提示  错误提示
         * }
         */
        alertTips: function (obj) {
            if (obj.index == 1) {
                layer.tips(obj.logTips, obj.id, {
                    tips: [3, '#67C23A'],
                    tipsMore: true,
                    time: 500
                });
            } else {
                layer.tips(obj.logTips, obj.id, {
                    tips: [3, '#f20'],
                    tipsMore: true,
                    time: 2000
                });
            }
        },
        /**
         * 检验编辑模式 当editMode=0 不能进行编辑、删除、更新
         * 只有超级管理员才能编辑
         */
        checkFormEditMode: function (formObj) {
            // 获取当前控件
            var selectIfKey = formObj.othis;
            // 获取当前所在行
            var parentTr = selectIfKey.parents("tr");
            var editMode = $(parentTr).find("[data-field=editMode]").find(".layui-table-cell").text();
            var loginAccount = webplus.getName("loginAccount");
            if (editMode == '0' && loginAccount != 'super') {
                formObj.elem.checked = !(formObj.elem.checked);
                form.render();
                webplus.alertError("当前数据模式为只读模式，只读数据不允编辑和删除等更新操作,只有超级管理员[super]才能处理");
                return false;
            }
            return true;
        },
        /**
         * 检验编辑模式 当editMode=0 不能进行编辑、删除、更新
         * 只有超级管理员才能编辑
         */
        checkRowEditMode: function (rowObj) {
            var editMode = rowObj.data.editMode;
            var loginAccount = webplus.getName("loginAccount");
            if (editMode == '0' && loginAccount != 'super') {
                webplus.alertError("当前数据模式为只读模式，只读数据不允编辑、删除、授权等操作,只有超级管理员[super]才能处理");
                return false;
            }
            return true;
        },
        /**
         * 初始化表格
         * searchForm表达搜索框Form的ID，默认值searchForm
         * searchSubmit 搜索框Form 中查询按钮的lay-filter 默认值searchSubmit
         * tableId 表格的编号 默认值dataList
         */
        init: function (url, cols, searchForm, searchSubmit, tableId, toolbar, trTool, params, height, callback) {
            if (webplus.initCheckToken()) { // 初始化检测token
                if (webplus.isEmpty(toolbar)) {
                    toolbar = "#toolbar";
                }
                if (webplus.isEmpty(trTool)) {
                    trTool = "#trTool";
                }
                webplus.initButtonGrant([toolbar, trTool]);
                webplus.initSearchForm(searchForm, searchSubmit, tableId);
                webplus.initTable(url, cols, tableId, toolbar, params, height, '', '', callback);
            };
            $("body").on("mouseenter mouseleave", ".layui-table>thead>tr>th,.layui-table>thead>tr>th>.layui-table-cell.span", function (event) {
                if (event.type == "mouseenter") {
                    let left = $(this).offset().left + 'px';
                    let top = $(this).offset().top + 'px';
                    let alertText = $(this).text();
                    if (!webplus.isEmpty(alertText)) {
                        webplus.setAlertContent(alertText, left, top);
                    }
                } else if (event.type == "mouseleave") {
                    $(".layui-table-tips").remove();
                };
            });



        },

        setAlertContent: function (content, left, top) {
            let $item = $(`
     	   <div class="layui-layer layui-layer-tips layui-table-tips" 
     	    type="tips" times="3" showtime="-1" contype="object" 
     	    style="z-index: 19891017;position: absolute;left: ${left};top: ${top};">
     	    <div id="" class="layui-layer-content"><div class="layui-table-tips-main" style="margin-top: -44px;overflow-y:auto">${content}</div>
     	   </div></div>`);
            $("body").append($item);
        },
        /**
         * 初始化搜索框
         */
        initSearchForm: function (searchForm, searchSubmit, tableId) {

            // 初始化下拉字典框
            webplus.initSelect(searchForm);
            webplus.showLoading();
            webplus.initFormOn(searchSubmit, tableId)
            webplus.initRowClickClass(tableId);

        },
        /**
         * 初始化单击按钮
         */
        initFormOn: function (searchSubmit, tableId) {
            if (webplus.isEmpty(searchSubmit)) {
                searchSubmit = 'searchSubmit'
            }
            if (webplus.isEmpty(tableId)) {
                tableId = 'dataList'
            }
            /* 加载表单 */
            form.on('submit(' + searchSubmit + ')', function (data) {
                //加载动画
                webplus.showLoading();
                webplus.loadTable(data.field, tableId);
            });
        },
        /**
         * 初始化单击按钮
         */
        initRowClickClass: function (tableId) {
            if (webplus.isEmpty(tableId)) {
                tableId = 'dataList'
            }
            table.on('row(' + tableId + ')', function (obj) {
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            });
        },
        /**
         * 初始化表格
         * url 加载数据url
         * cols
         * tableId,
         * limit 每页分页条数
         * limits
         */
        initTable: function (url, cols, tableId, toolbar, params, height, limit, limits, callback) {
            if (webplus.isEmpty(url)) {
                webplus.alertWarn("表格数据查询url不能为空");
                return false;
            }
            if (webplus.isEmpty(cols)) {
                webplus.alertWarn("表格列数据模型cols不能为空")
                return false;
            }
            if (url.indexOf(cxt) == -1) {
                url = cxt + url;
            }
            if (webplus.isEmpty(tableId)) {
                tableId = '#dataList';
            } else {
                if (tableId.indexOf("#") == -1) {
                    tableId = "#" + tableId;
                }
            }
            if (webplus.isEmpty(params)) {
                params = {};
            }
            if (webplus.isEmpty(limit)) {
                limit = 20;
            }
            if (webplus.isEmpty(limits)) {
                limits = [10, 20, 50, 100, 200];
            }
            if (webplus.isEmpty(toolbar)) {
                toolbar = "#toolbar";
            } else {
                if (toolbar == "-1") {
                    toolbar = "";
                } else {
                    if (toolbar.indexOf("#") == -1) {
                        toolbar = "#" + toolbar;
                    }
                }

            }
            var page=true;
            var isOpen = false;
            if (webplus.isEmpty(height)) {
                //height='full-67';
                isOpen = true;
            }else{
            	if(height=='auto'){
            		height='';
            		page=false;
            	}
            }
            var token=webplus.getToken();
            table.render({
                elem: tableId, //表id
                url: url,
                where: params,
                headers:{
                	'Authorization':token
                },
                method: 'post', //请求方式
                height: height, //控制表格高度
                toolbar: toolbar, //引入表头按钮
                defaultToolbar: [], //不开启工具栏['filter', 'print']    @@@@    filter: 显示筛选图标  print: 显示打印图标
                cellMinWidth: 80, //每列最小宽度
                loading: false,
                autoSort: false,
                page: page, //开启分页
                limit: limit, //默认一页显示20条信息
                limits: limits, //配置每页显示条数下拉框选项
                cols: cols,
                done: function (res) { //表格加载成功后执行的函数


                    //关闭动画
                    webplus.hideLoading();
                    //开启点击分页加载动画
                    webplus.pageSilderLoading();
                    if (res.appCode == '-2' || res.appCode == '-3') {
                        webplus.alertError('token校验不合法，系统将重置到登陆页面，错误信息：' + res.appMsg);
                        setTimeout(function () {
                            if (self != top) {
                                parent.parent.location.href = webplus.cxt();
                            } else {
                                window.location.href = webplus.cxt();
                            }


                        }, 1000)
                    }
                    //设置高度
                    if (isOpen) {
                        webplus.initTableAutoHeight();
                    }
                    if (typeof (callback) === "function") {
                        callback(res);
                    }
                }
            });
        },
        
        setTableTrColor:function(fieldName,where,tableId){
			if(webplus.isEmpty(tableId)){
				tableId='#dataList';
			}else{
				if(tableId.indexOf("#")==-1){
					tableId="#"+tableId;
				}
			}
			if(webplus.isEmpty(fieldName)){
				webplus.alertError('过滤字段不能为空');
				return false;
			}
			if(webplus.isEmpty(where) && Object.prototype.toString.call(where) !== '[Object Object]'(where)){
				webplus.alertError('过滤条件不能为空且必须是对象');
				return false;
			}
			
			$(tableId).next(".layui-form").find(".layui-table-body tbody>tr").each(function(i){
				var tdVal = $(this).find('[data-field='+fieldName+']').find("div").text();
				
				for(index in where){
					if(tdVal == index){
						$(this).find("td:not(:last-child)>div").css({"color":where[index]});
					}
				}
			});	
		},
        /**
         * 根据键值获取选择的数据
         * cellKey 列键
         * tableId 表格ID
         */
        getRowsValue: function (cellKey, tableId) {
            if (webplus.isEmpty(tableId)) {
                tableId = "dataList";
            }

            var rowsData = webplus.getRowsData(tableId);
            var arr = [];
            if (rowsData.length == 0) {
                return arr;
            }
            $.each(rowsData, function (i) {
                if (rowsData[i][cellKey] != undefined) {
                    arr.push(rowsData[i][cellKey]);
                }
            });
            return arr.join(',');
        },
        /**
         * 根据键值获取选择的数据
         * cellKey 列键
         * tableId 表格ID
         */
        getSingleRowData: function ( tableId) {
            if (webplus.isEmpty(tableId)) {
                tableId = "dataList";
            }

            var rowsData = webplus.getRowsData(tableId);
            var arr = [];
            if (rowsData.length == 0) {
                return {};
            }
            for(var i=0;i<rowsData.length;i++){
            	
            	return rowsData[i];
            }
        },
        
        /**
         * 根据键值获取选择的数据
         * cellKey 列键
         * tableId 表格ID
         */
        getSingleRowValue: function (cellKey, tableId) {
            if (webplus.isEmpty(tableId)) {
                tableId = "dataList";
            }

            var rowsData = webplus.getRowsData(tableId);
            var arr = [];
            if (rowsData.length == 0) {
                return '';
            }
            for(var i=0;i<rowsData.length;i++){
            	
            	return rowsData[i][cellKey];
            }
              
        },
        /**
         * 根据列表选择获取最后一次选择Value
         * cellKey 列键
         * only 唯一值
         * tableId 表格名称
         * 数据返回按照cellkey的返回
         */
        getRowsCheckedValue: function (only, cellKey, tableId, callBlack) {
            if (webplus.isEmpty(only)) {
                only = "informId";
            }
            if (webplus.isEmpty(tableId)) {
                tableId = "dataList";
            }
            let dataArr = []
            let lastData = []
            table.on('checkbox(dataList)', function (obj) {
                let checkRow = webplus.getRowsData(tableId)
                if (checkRow.length > 0) {
                    if (obj.checked) {
                        dataArr.push(obj.data)
                        lastData=[]
                        cellKey.forEach(item => {
                            let lastItem = dataArr[dataArr.length - 1][item] ? dataArr[dataArr.length - 1][item] : false
                            lastData.push(lastItem)
                        })
                        callBlack(lastData)
                    } else {
                        let checkedData = []
                        lastData=[]
                        dataArr.forEach(i => {
                            checkRow.map(m => {
                                if (i[only] == m[only]) {
                                    checkedData.push(m)
                                }
                            })
                        })
                        dataArr = checkedData
                        cellKey.forEach(item => {
                            let lastItem = dataArr[dataArr.length - 1][item] ? dataArr[dataArr.length - 1][item] : false
                            lastData.push(lastItem)
                        })
                        callBlack(lastData)
                    }
                }else{
                    lastData = []
                    cellKey.forEach(item=>{
                        lastData.push(false)
                    })
                    callBlack(lastData)
                }
            })
        },
        /***
         * 根据表格ID获取选择的行数据
         * tableId 表单编号
         */
        getRowsData: function (tableId) {
            if (webplus.isEmpty(tableId)) {
                tableId = "dataList";
            }
            var rowsData = table.checkStatus(tableId).data;
            return rowsData;
        },
        /**
         * 初始化登记表单
         * formId 表单ID
         * submitId 提交按钮
         */
        initForm: function (url, formId, submitId, callback, loadDataBack) {
            if (webplus.initCheckToken()) {
                if (webplus.isEmpty(formId)) {
                    formId = 'saveForm';
                }
                webplus.initSelect(formId, loadDataBack);
                webplus.submitFormData(url, submitId, callback);
            }
            $("body").on("mouseenter mouseleave", ".layui-form .layui-form-label", function (event) {
                if (event.type == "mouseenter") {
                    let left = $(this).offset().left + 'px';
                    let top = $(this).offset().top + 'px';
                    webplus.setAlertContent($(this).text(), left, top);
                } else if (event.type == "mouseleave") {
                    $(".layui-table-tips").remove();
                };
            });
        },
        /**
         * 表单提交数据函数
         * url 数据保存地址
         *
         */
        submitFormData: function (url, submitId, callback) {
            if (webplus.isEmpty(url)) {
                webplus.alertWarn("提交保存数据请求地址[url]不能为空");
                return false;
            }

            if (url.indexOf(cxt) == -1) {
                url = cxt + url;
            }
            if (webplus.isEmpty(submitId)) {
                submitId = 'saveSubmit';
            }
            form.on('submit(' + submitId + ')', function (data) {
                webplus.doAjax(url, data.field, '', '', '1', callback)
                //阻止表单默认提交
                return false;
            });

        },
        /**
         * 初始化树
         */
        initTree: function (url, setting, treeId, params, selectId) {
            if (webplus.isEmpty(url)) {
                webplus.alertWarn("ztree请求地址[url]不能为空");
                return false;
            }
            if (webplus.isEmpty(setting)) {
                webplus.alertWarn("ztree树配置[setting]不能为空");
                return false;
            }
            if (webplus.isEmpty(treeId)) {
                treeId = 'ztree';
            }
            if (treeId.indexOf("#") == -1) {
                treeId = "#" + treeId;
            }
            if (webplus.isEmpty(params)) {
                params = {};
            }
            webplus.doAjax(url, params, '', '0', '', function (data) {
                $(treeId).empty();
                var treeObj = $.fn.zTree.init($(treeId), setting, data);
                if (!webplus.isEmpty(selectId)) {
                    var selectNode = treeObj.getNodeByParam("id", selectId); //根据ID找到该节点
                    treeObj.selectNode(selectNode); //根据该节点选中
                }
            });
        },
        /**
         * 初始化select,加载字典项
         */
        initSelect: function (searchForm, loadDataBack) {
            if (webplus.isEmpty(searchForm)) {
                searchForm = '#searchForm'
            } else {
                if (searchForm.indexOf("#") == -1) {
                    searchForm = "#" + searchForm;
                }
            }
            var searchFormObj = $(searchForm);
            var $select = searchFormObj.find('select');
            var len=$select.length;
            if (len< 1) {

            	  if (typeof (loadDataBack) === "function"){
            		  
            		  loadDataBack();
            	  }
            	
            	return false;
            }
            $.each($select, function (index) {
                var _this = this;
                var dict = $(this).attr('lay-select-dict');
                var title = $(this).attr('lay-select-title');
                // lay-filter-code = '2,3' 过滤值以","分隔
                var filter = $(this).attr('lay-filter-code');
                // 默认选中的的option lay-select-code为option的value值
                var indexCode = $(this).attr('lay-select-code');
                // 是否禁用 true 禁用 false 不禁用 默认false
                var disabled = $(this).attr('lay-select-disabled');

                /*	if (webplus.isEmpty(index)) {
                        index = -1;
                    }*/
                if (webplus.isEmpty(title)) {
                    title = '请选择';
                }
                if (webplus.isEmpty(filter)) {
                    filter = '';
                }
                if (webplus.isEmpty(disabled)) {
                    disabled = false;
                }
                // 如果有配置属性select-dict
                if (!webplus.isEmpty(dict)) {
                    var params = {};
                    params.typeCode = dict;
                    params.filterCode = filter,
                 webplus.doAjax('system/common/listItem',params,'','','3', function (res) {
                	    var dataList=res.dataList;
                        var str = title == "NONE" ? '' : '<option value="">' + title + '</option>';
                        $.each(dataList, function (i) {
                            if (indexCode == dataList[i].itemCode) {
                                str += "<option selected value='" +
                                    dataList[i].itemCode + "'>" +
                                    dataList[i].itemName + "</option>";
                            } else {
                                str += "<option value='" + dataList[i].itemCode +
                                    "'>" + dataList[i].itemName + "</option>";
                            }
                        });
                        $(_this).html(str);
                        if (disabled) {
                            $(_this).prop("disabled", "disabled");
                        }
                        form.render('select');
                    }, 'json');
                }
                if(index=len){
                    if (typeof (loadDataBack) === "function"){
                		  
                		  loadDataBack();
                	  }
                 }
            });
            // 加载数据
            
        },
        /*
         *初始化表单
         *@table  表格对象
         *@params   Object
         *@tableId  表单ID  不要传 # 号
         *@tableUrl  String
         */
        loadTable: function (params, tableId, url) {
            if (webplus.isEmpty(params)) {
                params = {};
            }
            if (webplus.isEmpty(tableId)) {
                tableId = 'dataList';
            }
            if (webplus.isEmpty(url)) {
                table.reload(tableId, {
                	page: {
                		curr: 1
                	},
                    where: params
                });
            } else {

                if (url.indexOf(cxt) == -1) {
                    url = cxt + url;
                }
                table.reload(tableId, {
                    url: url,
                    page: {
                		curr: 1
                	},
                    where: params
                });
            }


        },
        /**
         * 刷新列表 reloadWay
         * 1：弹出框调用父页面刷新
         * 默认刷新当前的table
         */
        reloadTable: function (reloadWay, submitId) {
            if (reloadWay == '1') {

                //调用父页面的查询按钮刷新数据
                if (webplus.isEmpty(submitId)) {
                    parent.$("body").find('[lay-submit]').click();
                } else {
                    var findStr = '[lay-filter=' + submitId + ']'
                    parent.$("body").find(findStr).click();
                }

                setTimeout(function () {
                    parent.layer.closeAll();
                }, 500)

            } else if (reloadWay == '2') { //只关闭不刷新
                setTimeout(function () {
                    parent.layer.closeAll();
                }, 500)
            } else {
                if (webplus.isEmpty(submitId)) {
                    $("body").find('[lay-submit]').click();
                } else {
                    var findStr = '[lay-filter=' + submitId + ']';
                    $("body").find(findStr).click();
                }

            }

        },
        /**
         * 打开编辑窗口
         * url 请求地址
         * title 标题
         * width 宽度
         * height 长度
         */
        openEditWindow: function (url, title, rowObj, cellKey, paramKey, width, height) {
            webplus.openEditOrDetailWindow(url, title, rowObj, cellKey, paramKey, width, height);
        },
        /**
         * 打开详情窗口
         * url 请求地址
         * title 标题
         * width 宽度
         * height 长度
         */
        openDetailWindow: function (url, title, rowObj, cellKey, paramKey, width, height) {

            webplus.openEditOrDetailWindow(url, title, rowObj, cellKey, paramKey, width, height, '1');
        },
        /**
         * 打开修改或详情窗口
         */
        openEditOrDetailWindow: function (url, title, rowObj, cellKey, paramKey, width, height, openWay) {
            if (webplus.isEmpty(url)) {
                webplus.alertWarn("请求地址url不能为空");
                return false;
            }
            if (webplus.isEmpty(rowObj)) {
                webplus.alertWarn("列数据对象[rowObj]不能为空");
                return false;
            }
            if (webplus.isEmpty(cellKey)) {
                webplus.alertWarn("列键参数不能为空[cellKey]不能为空");
                return false;
            }
            if (webplus.isEmpty(paramKey)) {
                paramKey = "id";
            }
            var data = rowObj.data;
            var urlParam = paramKey + "=" + data[cellKey];
            if (url.indexOf("?") > -1) {
                url = url + "&" + urlParam;
            } else {
                url = url + "?" + urlParam;
            }
            webplus.openWindowBase(url, title, width, height, openWay);
        },

        /**
         * 获取多个数据打开
         * url 请求地址
         * title 标题
         * width 宽度
         * height 长度
         * openWay 打开方式
         */
        openMoreWindow: function (url, tableId, cellKey, paramKey, title, width, height, openWay) {
            if (webplus.isEmpty(url)) {
                webplus.alertWarn("请求地址url不能为空");
                return false;
            }
            if (webplus.isEmpty(cellKey)) {
                webplus.alertWarn("列键参数不能为空[cellKey]不能为空");
                return false;
            }
            if (webplus.isEmpty(paramKey)) {
                paramKey = "ids";
            }
            var values = webplus.getRowsValue(cellKey, tableId);
            if (webplus.isEmpty(values)) {
                webplus.alertError("请选择数据");
                return false;
            }
            if (url.indexOf("?") > -1) {
                url = url + "&" + paramKey + "=" + values;
            } else {
                url = url + "?" + paramKey + "=" + values;
            }

            webplus.openWindowBase(url, title, width, height, openWay);
        },
        /**
         /**
         * 打开窗口
         * url 请求地址
         * title 标题
         * width 宽度
         * height 长度
         */
        openWindow: function (url, title, width, height, openWay) {
            webplus.openWindowBase(url, title, width, height, openWay);
        },
        /**
         * 公用打开弹出模板
         * url 请求地址
         * title 标题
         * width 宽度
         * height 长度
         * openWay 1打开详情 默认打开增加、编辑
         */
        openWindowBase: function (url, title, width, height, openWay) {
            if (webplus.isEmpty(url)) {
                webplus.alertWarn("请求地址url不能为空");
                return false;
            }
            if (webplus.isEmpty(title)) {
                title = false;
            };
            if (webplus.isEmpty(width)) {
                width = ($(window).width() * 0.98);
            };
            if (webplus.isEmpty(height)) {
                height = ($(window).height() - 20);
            };
            if (url.indexOf("/") == 0) {
                if (url.indexOf(cxt) == -1) {
                    url = cxt + url;
                }
            }
            if (openWay == '1') {
                layer.open({
                    type: 2,
                    area: [width + 'px', height + 'px'], //配置宽高
                    shade: 0.4, //遮罩透明度
                    id: 'addinfo-iframe', //iframeID值
                    title: title, //弹出框头部信息
                    content: url, //打开的页面地址
                    btnAlign: 'c', //底部按钮居中
                    btn: ['取消'], //底部按钮信息
                    success: function (layero, index) {
                        //给底部按钮加上小图标和颜色
                        $("body").find(".layui-layer-btn0").html('<i class="layui-icon layui-icon-close"></i> 取消').css({
                            "backgroundColor": "#FF5722",
                            "color": "#fff",
                            "borderColor": "#ff5720"
                        });


                    },
                    yes: function (index) {
                        layer.close(index);
                    }
                });
            } else {
                layer.open({
                    type: 2,
                    area: [width + 'px', height + 'px'], //配置宽高
                    shade: 0.4, //遮罩透明度
                    id: 'addinfo-iframe', //iframeID值
                    title: title, //弹出框头部信息
                    content: url, //打开的页面地址
                    btnAlign: 'c', //底部按钮居中
                    btn: ['确定', '取消'], //底部按钮信息
                    success: function (layero, index) {
                        //给底部按钮加上小图标和颜色
                        $("body").find(".layui-layer-btn0").html('<i class="layui-icon layui-icon-ok"></i> 提交');
                        $("body").find(".layui-layer-btn1").html('<i class="layui-icon layui-icon-close"></i> 取消').css({
                            "backgroundColor": "#FF5722",
                            "color": "#fff",
                            "borderColor": "#ff5720"
                        });
                    },
                    yes: function (index) {
                        //点击提交按钮触发子页面的提交表单事件
                        $("#addinfo-iframe>iframe").contents().find('[lay-submit]').click();
                    },
                    btn2: function (index) {
                        layer.close(index);
                    }
                });
            }

        },
        /**
         * 关闭当前窗口
         */
        closeCurrentWindow: function () {
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index); //关闭当前
        },
        /**
         * 删除列表的一行
         * rowObj 行对象
         * cellKey 列键
         * paramKey 参数键跟cellKey传值使用
         * params 参数数组
         * confirmMsg 确认信息
         * callback 回调函数
         */
        removeRow: function (url, rowObj, cellKey, paramKey, params, confirmMsg, callback) {
            if (webplus.isEmpty(rowObj)) {
                webplus.alertWarn("列数据对象[rowObj]不能为空");
                return false;
            }
            if (webplus.isEmpty(cellKey)) {
                webplus.alertWarn("列键参数不能为空[cellKey]不能为空");
                return false;
            }
            if (webplus.isEmpty(paramKey)) {
                paramKey = "id";
            }
            if (webplus.isEmpty(params)) {
                params = {};
            }
            if (webplus.isEmpty(confirmMsg)) {
                confirmMsg = '你确认删除当前数据吗？';
            }
            var data = rowObj.data;
            params[paramKey] = data[cellKey];
            webplus.doAjax(url, params, confirmMsg, '', '0', callback);

        },
        /**
         * 批量删除多行数据
         */
        batchRemoveRow: function (url, tableId, cellKey, paramKey, params, confirmMsg, callback) {
            if (webplus.isEmpty(cellKey)) {
                webplus.alertWarn("列键参数不能为空[cellKey]不能为空");
                return false;
            }
            if (webplus.isEmpty(paramKey)) {
                paramKey = "ids";
            }
            if (webplus.isEmpty(params)) {
                params = {};
            }
            if (webplus.isEmpty(confirmMsg)) {
                confirmMsg = '你确认删除当前数据吗？';
            }
            var values = webplus.getRowsValue(cellKey, tableId);
            if (webplus.isEmpty(values)) {
                webplus.alertError("请选择你要删除数据");
                return false;
            }
            params[paramKey] = values;
            webplus.doAjax(url, params, confirmMsg, '', '0', callback);
        },
        /**
         * 批量操作
         */
        batchOperate: function (url, tableId, cellKey, paramKey, params, confirmMsg, callback) {
            if (webplus.isEmpty(cellKey)) {
                webplus.alertWarn("列键参数不能为空[cellKey]不能为空");
                return false;
            }
            if (webplus.isEmpty(paramKey)) {
                paramKey = "ids";
            }
            if (webplus.isEmpty(params)) {
                params = {};
            }

            var values = webplus.getRowsValue(cellKey, tableId);
            if (webplus.isEmpty(values)) {
                webplus.alertError("请选择你要操作数据");
                return false;
            }
            params[paramKey] = values;
            webplus.doAjax(url, params, confirmMsg, '', '0', callback);
        },
        /**
         * 执行ajax方法
         * url    请求地址
         * params 请求参数数组
         * confirmMsg 是否执行确认操作
         * resultWay 完成方式 0 直接回调处理 默认当前处理
         * reloadWay 刷新方式 1父页面刷新列表 0默认刷新当前table列表
         * callback 回调函数
         */
        doAjax: function (url, params, confirmMsg, resultWay, reloadWay, callback) {
            if (webplus.isEmpty(confirmMsg)) {
                webplus.ajaxBase(url, params, '', '', function (data) {
                    webplus.doAjaxResult(data, resultWay, reloadWay, callback);
                })
            } else {
                layer.confirm(confirmMsg, function (index) {
                    layer.close(index);
                    webplus.ajaxBase(url, params, '', '', function (data) {

                        webplus.doAjaxResult(data, resultWay, reloadWay, callback);
                    })
                });
            }

        },
        /**
         * 处理ajax结果
         * data  返回结果集
         * resultWay 完成方式 0 直接回调处理 默认当前处理
         * reloadWay 是否刷新列表 1父页面刷新列表 0默认刷新当前table列表
         * callback 回调函数
         */
        doAjaxResult: function (data, resultWay, reloadWay, callback) {

            if (resultWay == '0') {
                if (data.appCode == '-2' || data.appCode == '-3') {
                    webplus.alertError('访问令牌非法，系统将重置到登陆页面，错误信息：' + data.appMsg);
                    setTimeout(function () {
                        if (self != top) {

                            parent.parent.location.href = webplus.cxt();
                        } else {
                            window.location.href = webplus.cxt();
                        }


                    }, 1000)
                } else {
                    if (typeof (callback) === "function") {

                        callback(data);
                    }
                }

            } else {
                if (data) {
                    if (data.appCode == "1") {
                        if (reloadWay == '3') { //不等于3的时候成功不提醒 这种一般使用开关按钮ajax
                            if (typeof (callback) === "function") {
                                callback(data);
                            }
                        } else {
                            webplus.alertSuccess(data.appMsg);
                            if (typeof (callback) === "function") {

                                callback(data);
                            } else {
                                if (!webplus.isEmpty(reloadWay)) {
                                    webplus.reloadTable(reloadWay);
                                }
                            }
                        }

                    } else if (data.appCode == "0") {
                        webplus.alertWarn(data.appMsg);
                    } else if (data.appCode == '-2' || data.appCode == '-3') {
                        webplus.alertError('访问令牌非法，系统将重置到登陆页面，错误信息：' + data.appMsg);
                        setTimeout(function () {
                            if (self != top) {
                                parent.parent.location.href = webplus.cxt();
                            } else {
                                window.location.href = webplus.cxt();
                            }


                        }, 1000)
                    } else {
                        webplus.alertError(data.appMsg);
                    }
                }

            }

        },
        /**
         * ajaxBase执行方法
         */
        ajaxBase: function (url, params, type, dataType, callback) {
            if (webplus.isEmpty(url)) {
                webplus.alertWarn("请求地址url不能为空");
                return false;
            }
            if (webplus.isEmpty(params)) {
                params = {};
            }
            if (webplus.isEmpty(type)) {
                type = 'post';
            }
            if (webplus.isEmpty(dataType)) {
                dataType = 'json';
            }
            cxt = webplus.cxt();
            if (url.indexOf(cxt) == -1) {
                url = cxt + url;
            }

            var token=webplus.getToken();
            $.ajax({
                type: type,
                headers:{
                	'Authorization':token
                },
                url: url,
                data: params,
                timeout: 30000,
                beforeSend: webplus.showLoading(),
                dataType: dataType,
                success: function (data) {
                    if (typeof (callback) === "function") {

                        callback(data);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    webplus.alertError('操作失败,网络超时或程序处理异常：' + textStatus);
                },
                complete: function () {
                    //隐藏动画
                    webplus.hideLoading();
                }
            })
        },
        //获取系统字典
        getDict: function (typeCode, filterCode, callback) {
            if (webplus.isEmpty(typeCode)) {
                webplus.alertWarn("字典类型[typeCode]参数不能为空");
                return false;
            }
            var params = {};
            params.typeCode = typeCode;
            params.filterCode = filterCode,
                webplus.doAjax('system/common/listItem', params, '', '0', '', function (data) {
                    if (typeof (callback) === "function") {

                        callback(data);
                    }
                })

        },
        /**
         *创建自定义下垃框
         *url 请求地址
         *params 参数
         *selectId 下垃框控件ID
         *valueKey 隐藏值的键
         *textKey 显示值的键
         *defaultValue 默认值
         *selectTitle 选择提示语
         *callback 回调函数
         */
        createCustomSelect: function (selectId, url, params, valueKey, textKey, defaultValue, selectTitle, callback) {
            if (webplus.isEmpty(url)) {
                webplus.alertWarn('url地址不能为空');
                return false;
            }
            if (webplus.isEmpty(selectId)) {
                webplus.alertWarn('下拉框控件ID不能为空');
                return false;
            } else {
                if (selectId.indexOf("#") == -1) {
                    selectId = "#" + selectId;
                }
            }
            if (webplus.isEmpty(params)) {
                params = {};
            }
            if (webplus.isEmpty(valueKey)) {
                webplus.alertWarn('下来框json的值（valueKey）不能为空');
                return false;
            }
            if (webplus.isEmpty(textKey)) {
                webplus.alertWarn('下来框json的显示值（textKey)不能为空');
                return false;
            }
            if (webplus.isEmpty(selectTitle)) {
                selectTitle = '请选择';
            }
            webplus.doAjax(url, params, '', '', '3', function (res) {
                var str = selectTitle == "NONE" ? '' : '<option value="">' + selectTitle + '</option>';
                var dataList = res.dataList;
                if (dataList) {
                    $.each(dataList, function (i) {
                        var data = dataList[i];
                        var value = data[valueKey];
                        var text = data[textKey];
                        if (webplus.isEmpty(defaultValue)) {
                            str += "<option value='" + value + "'>" + text + "</option>";
                        } else {
                            if (defaultValue == value) {
                                str += "<option selected value='" + value + "'>" + text + "</option>";
                            } else {
                                str += "<option value='" + value + "'>" + text + "</option>";
                            }

                        }

                    });
                }
                $(selectId).html(str);
                form.render('select');
                if (typeof (callback) === "function") {
                    callback(res);
                }
            })

        },
        // 初始化首页菜单事件
        initMain: function () {

            $("#LAY-system-side-menu>li").on('mouseenter', function () {
                if ($("#LAY_app").attr("class") == 'layadmin-side-shrink') {
                    var index = $("#LAY-system-side-menu>li").index(this);
                    $(this).find("dl").css(getNavPositionStyle(index));
                }
            });
            $("#LAY-system-side-menu>li").on('mouseleave', function () {
                if ($("#LAY_app").attr("class") == 'layadmin-side-shrink') {
                    $(this).find("dl").css({
                        'top': '0px'
                    });
                }
            });
            $("#LAY-system-side-menu>li>a").click(function (event) {
                $(this).next("dl").css({
                    'top': '0px'
                });
                $(this).parent("li").addClass('layui-nav-itemed').siblings("li").removeClass('layui-nav-itemed');

            });

            function getNavPositionStyle(index) {
                var top = 50;
                if (index > 0) {
                    top = parseInt(index * 40) + parseInt(top);
                }
                return {
                    'top': top + 'px'
                };
            }

            webplus.lockPage(false);
        },
        // 锁屏
        lockPage: function (c) {
            if (c || sessionStorage.getItem('lockStatus') === '1') {
                layer.prompt({
                    formType: 1,
                    closeBtn: 0,
                    title: '请输入登录密码解锁',
                    btn: ['解锁']
                }, function (value, index) {
                    var params = {};
                    params.password = hex_md5(value);;
                    webplus.doAjax("system/main/unlockScreen", params, "", "", "3", function (data) {
                        sessionStorage.removeItem('lockStatus');
                        layer.close(index);
                    });

                });
            }
        },
        // 检测token是否为空
        initCheckToken: function () {
            var token = webplus.getToken();
            if (webplus.isEmpty(token)) {
                webplus.alertWarn("非法访问，系统将重置到登陆页面")

                setTimeout(function () {
                    if (self != top) {
                        parent.parent.location.href = webplus.cxt();
                    } else {
                        window.location.href = webplus.cxt();
                    }


                }, 1000)
                return false;
            }
            return true;
        },
        /**
         * 根据id请求编辑数据,用于编辑页面请求最新数据，没有加载动画
         * paramObj  Object
         * @url  请求路径 (必填) String
         * @type 请求方式  默认POST  String
         * @params  请求参数 默认{} Object
         * @dataType 返回数据类型 默认JSON String
         */
        doEditAjax: function (paramObj) {
            if (webplus.isEmpty(paramObj.url)) {
                webplus.alertWarn("请求地址url不能为空");
                return false;
            }
            if (webplus.isEmpty(paramObj.params)) paramObj.params = {};
            if (webplus.isEmpty(paramObj.type)) paramObj.type = 'POST';
            if (webplus.isEmpty(paramObj.dataType)) paramObj.dataType = 'JSON';
            if (paramObj.url.indexOf(cxt) == -1) paramObj.url = cxt + paramObj.url;
            paramObj.params.token = webplus.getToken();
            $.ajax({
                type: paramObj.type,
                url: paramObj.url,
                data: paramObj.params,
                timeout: 30000,
                dataType: paramObj.dataType,
                success: function (data) {
                    if (typeof (paramObj.callback) === "function") paramObj.callback(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    webplus.alertError('操作失败,网络超时或程序处理异常：' + textStatus);
                }
            });
        },
        /**
         * 设置form表单值
         * formId 自定义属性lay-filter值 String
         * data 赋值数据 Object key必须与赋值标签的name值对应   Object
         * checkboxData  复选框对应值key  Array
         */
        setFormData: function (formId, data, checkboxData) {
            // 多选赋值
            if (!webplus.isEmpty(checkboxData)) {
                // checkbox赋值
                for (var i = 0; i < checkboxData.length; i++) {
                    if (data[checkboxData[i]].indexOf(",") > -1) {
                        var arr = data[checkboxData[i]].split(",");
                        for (var x = 0; x < arr.length; x++) {
                            $("input[name=" + checkboxData[i] + "-" + arr[x] + "]").attr('checked', true);
                        }
                    } else {
                        $("input[name=" + checkboxData[i] + "-" + data[checkboxData[i]] + "]").attr('checked', true);
                    }
                }
                //渲染表单
                form.render();
            }
            //表单初始赋值
            form.val(formId, data);
        },
        /*
         * 获取弹出框iframe   url传递的参数  例如：******?key=value&key=value
         * @return Object对象
         */
        getUrlType: function () {
            var str = location.search;
            if (str != undefined && str.indexOf("?") >= 0) {
                str = str.split("?")[1];
            } else {
                return false;
            }
            var obj = {};
            if (str.indexOf("&") > 0) {
                str = str.split("&");
                for (i in str) {
                    var res = str[i].split("=");
                    obj[res[0]] = res[1];
                }
            } else {
                var res = str.split("=");
                obj[res[0]] = res[1];
            }
            return obj;
        },
        // 设置权限控制按钮
        setGrantBtn: function ($othis, grantObj) {
            var fElem = "";
            if ($othis.find(".layui-btn-container").length > 0) {
                fElem = "button";
            } else {
                fElem = "a";
            }
            $.each($othis.find(fElem), function () {
                var grantCode = $(this).data("grant");
                if (grantObj[grantCode] !== 1) $(this).css({
                    "display": "none"
                });
            });
        },
        /**
         * 初始化授权按钮 toolIdArray 工具栏ID数组
         */
        initButtonGrant: function (toolIdArray) {
            var grantArr = localStorage.getItem("buttonGrant").split(",");
            var grantLen = grantArr.length;
            var grantObj = {};
            // 遍历权限值转换成对象
            for (var y = 0; y < grantLen; y++) {
                grantObj[grantArr[y]] = 1;
            }
            var idLen = toolIdArray.length;
            // 遍历id
            for (var x = 0; x < idLen; x++) {
                var toolId = toolIdArray[x];
                if (!webplus.isEmpty(toolId)) {
                    if (toolId.indexOf("#") == -1) {
                        toolId = "#" + toolId;
                    }
                    webplus.setGrantBtn($(toolId), grantObj);
                }

            }
        },
        number_format: function (number, decimals, dec_point, thousands_sep) {
            /* www.qdxw.net
             * 参数说明：
             * number：要格式化的数字
             * decimals：保留几位小数
             * dec_point：小数点符号
             * thousands_sep：千分位符号
             * */
            number = (number + '').replace(/[^0-9+-Ee.]/g, '');
            var n = !isFinite(+number) ? 0 : +number,
                prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
                sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
                dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
                s = '',
                toFixedFix = function (n, prec) {
                    var k = Math.pow(10, prec);
                    return '' + Math.ceil(n * k) / k;
                };

            s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
            var re = /(-?\d+)(\d{3})/;
            while (re.test(s[0])) {
                s[0] = s[0].replace(re, "$1" + sep + "$2");
            }

            if ((s[1] || '').length < prec) {
                s[1] = s[1] || '';
                s[1] += new Array(prec - s[1].length + 1).join('0');
            }
            return s.join(dec);
        },
        /**
         * 显示图片
         */
        showImage: function (imageSrcId, fid) {
            if (!webplus.isEmpty(fid)) {
                if (webplus.isEmpty(imageSrcId)) {
                    webplus.alertWarn("显示图片文件名(imageSrcId)不能为空");
                    return false;
                }

                if (imageSrcId.indexOf("#") == -1) {
                    imageSrcId = "#" + imageSrcId;
                }
                var imgSrc = webplus.cxt() + "/system/file/showImage?fid=" + fid;
                $(imageSrcId).attr("src", imgSrc);
                // let a = $(imageSrcId).attr("src");
                return imgSrc;
            }
            return '';
        },
        
        showDownload: function (imageSrcId, fid) {
            if (!webplus.isEmpty(fid)) {
                if (webplus.isEmpty(imageSrcId)) {
                    webplus.alertWarn("显示图片文件名(imageSrcId)不能为空");
                    return false;
                }

                if (imageSrcId.indexOf("#") == -1) {
                    imageSrcId = "#" + imageSrcId;
                }
                var imgSrc = webplus.cxt() + "/system/file/downloadFile?fid=" + fid;
                $(imageSrcId).attr("src", imgSrc);
                return imgSrc;
            }
            return '';
        },

        /**
         * 文件图片上传
         * uploadId 文件上传空间ID
         * param 参数
         * imageNameId 图片控件ID
         * iamgeSrcId 图片路径显示ID
         */
        uploadImage: function (uploadId, params, imageNameId, imageSrcId) {
            if (webplus.isEmpty(uploadId)) {
                webplus.alertWarn("上传控件ID(uploadId)不能为空");
                return false;
            }
            if (webplus.isEmpty(imageNameId)) {
                webplus.alertWarn("上传保存图片文件名ID(imageNameId)不能为空");
                return false;
            }
            if (webplus.isEmpty(imageSrcId)) {
                webplus.alertWarn("显示图片控件ID(imageSrcId)不能为空");
                return false;
            }
            if (webplus.isEmpty(params)) {
                params = {};
            }
            if (uploadId.indexOf("#") == -1) {
                uploadId = "#" + uploadId;
            }
            if (imageNameId.indexOf("#") == -1) {
                imageNameId = "#" + imageNameId;
            }
            if (imageSrcId.indexOf("#") == -1) {
                imageSrcId = "#" + imageSrcId;
            }
            upload.render({
                elem: uploadId,
                exts: 'jpg|png|jpeg',
                headers:{
                	'Authorization':webplus.getToken()
                },
                data: params,
                url: webplus.cxt() + '/system/file/uploadImage',
                done: function (data) {
                     
                    if (data.appCode == '1') {
                        webplus.alertSuccess('上传成功');
                        webplus.showImage(imageSrcId, data.fid);
                        $(imageNameId).val(data.fid);
                    } else {
                        webplus.alertError(data.appMsg);
                    }
                },
                error: function () {
                    webplus.alertError('上失败,网络超时或程序处理异常');
                }
            });


        },
        //上传文件
        uploadFile: function (uploadId, params,exts,callback) {
            if (webplus.isEmpty(uploadId)) {
                webplus.alertWarn("上传控件ID(uploadId)不能为空");
                return false;
            }
          
            if (webplus.isEmpty(params)) {
                params = {};
            }
            if (uploadId.indexOf("#") == -1) {
                uploadId = "#" + uploadId;
            }
            upload.render({
                elem: uploadId,
                exts: exts,
                headers:{
                	'Authorization':webplus.getToken()
                },
                data: params,
                url: webplus.cxt() + '/system/file/uploadFile',
                done: function (data) {
                	 if (data.appCode == '-2' || data.appCode == '-3') {
                         webplus.alertError('访问令牌非法，系统将重置到登陆页面，错误信息：' + data.appMsg);
                         setTimeout(function () {
                             if (self != top) {

                                 parent.parent.location.href = webplus.cxt();
                             } else {
                                 window.location.href = webplus.cxt();
                             }


                         }, 1000)
                     } else {
                    	 if (data.appCode == '1') {
                    		 if (typeof (callback) === "function") {

                                 callback(data);
                             }else{
                            	  webplus.alertSuccess('上传成功');
                             }
                         } else {
                             webplus.alertError(data.appMsg);
                         }
                         
                     }

                },
                error: function () {
                    webplus.alertError('上失败,网络超时或程序处理异常');
                }
            });


        },
        
        /**
         * 通用Excel下载 url地址，searchForm layui-form lay-filter参数
         */
        exportExcel: function (url, searchForm, fid, tableId, cellKey, paramKey) {
            if (webplus.isEmpty(url)) {
                webplus.alertWarn("请求地址url不能为空");
                return false;
            }
            if (webplus.isEmpty(searchForm)) {
                searchForm = 'searchForm'
            }
            var params = form.val(searchForm)

            if (!webplus.isEmpty(cellKey)) {
                if (webplus.isEmpty(paramKey)) {
                    paramKey = "ids";
                }
                var values = webplus.getRowsValue(cellKey, tableId);
                if (!webplus.isEmpty(values)) {
                    params[paramKey] = values;
                }
            }


            webplus.doAjax(url, params, "", "", "3", function (data) {
                window.location.href = webplus.cxt() + "/system/file/downloadExcelFile?fid=" + data.fid + "&fid=" + fid + "&token=" + webplus.getToken();

            });

        },
        /*
         * iframe公用弹框模板
         * @title   弹出框标题
         * @w   弹出框宽度
         * @h   弹出框高度
         * @url   内容路径
         * @data    数据用于编辑操作时赋值  Object
         */
        open_show: function (title, w, h, url, data, maxmin) {
            if (this.isEmpty(title)) {
                title = false;
            };
            if (this.isEmpty(w)) {
                w = ($(window).width() * 0.9);
            };
            if (this.isEmpty(h)) {
                h = ($(window).height() - 50);
            };
            if (this.isEmpty(url)) {
                html = '';
            };
            if (this.isEmpty(data)) {
                data = {};
            };
            if (this.isEmpty(maxmin)) {
                maxmin = false;
            };
            var token = webplus.getToken();
            if (url.indexOf("?") > -1) {
                url = url + "&token=" + token
            } else {
                url = url + "?token=" + token
            }
            layer.open({
                type: 2,
                area: [w + 'px', h + 'px'], //配置宽高
                shade: 0.4, //遮罩透明度
                id: 'addinfo-iframe', //iframeID值
                title: title, //弹出框头部信息
                content: url, //打开的页面地址
                btnAlign: 'c', //底部按钮居中
                maxmin: maxmin, //是否显示最大化按钮
                btn: ['确定', '取消'], //底部按钮信息
                success: function (layero, index) {
                    //给底部按钮加上小图标和颜色
                    $("body").find(".layui-layer-btn0").html('<i class="layui-icon layui-icon-ok"></i> 提交');
                    $("body").find(".layui-layer-btn1").html('<i class="layui-icon layui-icon-close"></i> 取消').css({
                        "backgroundColor": "#FF5722",
                        "color": "#fff",
                        "borderColor": "#ff5720"
                    });

                    //如果有数据
                    if (!webplus.isEmpty(data)) {
                        //得到iframe页的窗口对象，执行iframe页的方法：
                        var iframeWin = window[layero.find('iframe')[0]['name']];
                        /*
                         * 调用子页面的方法传值
                         *  @data    编辑的数据
                         */
                        iframeWin.parentData = data;
                    }

                },
                // end:function () {
                //     window.layui.table.reload('lockList',{page:{curr:1}});
                // },
                yes: function (index) {
                    //点击提交按钮触发子页面的提交表单事件
                    $("#addinfo-iframe>iframe").contents().find('[lay-submit]').click();
                },
                btn2: function (index) {
                    layer.close(index);
                }
            });
        },
        closePageOpenNewPage: function (url, name, flag, refresh, msg) {
            //关闭当前页面
            if (flag) {
                // 如果默认没有数据
                if (webplus.isEmpty(msg)) msg = '操作成功';
                // 提示信息
                webplus.alertSuccess(msg, function () {
                    // 给当前页面的iframe设置id标识
                    parent.layui.$("#LAY_app_tabs>div>ul.layui-tab-title>li.layui-this").attr("id", "closePage");
                    // 切换页签跳转到指定页面
                    parent.layui.index.openTabsPage(url, name);

                    // 判断 如果refresh为true 则刷新指定的页面
                    if (refresh) {
                        // 刷新
                        parent.layui.$('#LAY_app_body .layui-show .layadmin-iframe').contents().find('[lay-submit]').click();
                    }
                    // 关闭数据操作源页面标签
                    parent.layui.$("#LAY_app_tabs>div>ul.layui-tab-title>#closePage").find("i").click();
                });
            } else {
                // 切换页签跳转到指定页面
                parent.layui.index.openTabsPage(url, name);
            }
        },
        /**
         * 获取选中的勾选的表格数据
         * @param {Object} tableId
         */
        getCheckedTableData: function (cqType) {
            let checkStatus = table.checkStatus(cqType);
            return checkStatus.data;
        }

    }

    exports("webplus", webplus);
});