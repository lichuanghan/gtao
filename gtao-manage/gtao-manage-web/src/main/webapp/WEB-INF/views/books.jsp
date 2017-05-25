<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书籍列表</title>
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4/themes/icon.css" />
<script type="text/javascript" src="/js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
</head>
<body>
	<div>
    <table class="easyui-datagrid" id="bookList" title="书籍列表" 
	       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/rest/book/list',method:'get',toolbar:toolbar,pageSize:5,pageList:[2,5]">
	    <thead>
	    <!-- 
	    private String author;
	private String chubanshe;
	private String pages;
	private String title;
	     -->
	        <tr>
	        	<th data-options="field:'ck',checkbox:true"></th>
	        	<th data-options="field:'id',width:60">ID</th>
	            <th data-options="field:'author',width:200">作者名</th>
	            <th data-options="field:'chubanshe',width:100">出版社</th>
	            <th data-options="field:'pages',width:100">页数</th>
	            <th data-options="field:'title',width:100">书名</th>
	        </tr>
	    </thead>
	</table>
	</div>
	
<div id="bookAdd" class="easyui-window" title="新增书籍" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/rest/page/book-add'" style="width:800px;height:600px;padding:10px;">
        The window content.
</div>
<div id="bookUpdate" class="easyui-window" title="修改书籍" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/rest/page/book-update'" style="width:800px;height:600px;padding:10px;">
        The window content.
</div>


<script type="text/javascript">
function getSelectionsIds(){
	var bookList = $("#bookList");
	var sels = bookList.datagrid("getSelections");
	var ids = [];
	for(var i in sels){
		ids.push(sels[i].id);
	}
	ids = ids.join(",");
	return ids;
}
var toolbar = [{
    text:'新增',
    iconCls:'icon-add',
    handler:function(){
    	$('#bookAdd').window('open'); 
    	/* $.messager.alert('提示','暂未开放此功能!'); */
    }
},{
    text:'编辑',
    iconCls:'icon-edit',
    handler:function(){
    	/* $.messager.alert('提示','暂未开放此功能!'); */
    
    	var ids = getSelectionsIds();
    	
    	if(ids==""){
    		console.log(ids);
    		$.messager.alert('提示','未选中书籍!');
    		return ;
    	}else{
    		var arr = ids.split(",");
    		console.log(arr);
    		if(arr.length==1){
    			$('#bookUpdate').window('open'); 
    		}else{
    			$.messager.alert('提示','只能选择一本书!');
        		return ;
    		}
    	}
    	/* console.log(ids);
    	console.log(typeof(ids));
    	var arr = ids.split(",");
    	console.log(arr);
    	console.log(typeof(arr));
    	console.log(arr.length);
    	console.log(arr[0]);
    	if(arr.length==1){
    		if(arr[0]==""){
    			$.messager.alert('提示','未选中书籍!');
        		return ;
    		}
    	
    	/* $('#bookUpdate').window('open'); 
    	}else{
    		if(arr.length == 0){
        		$.messager.alert('提示','未选中书籍!');
        		return ;
        	}else if(arr.length >1){
        		$.messager.alert('提示','只能选一本书!');
        		return ;
        	}
    	} */
    }
},{
    text:'删除',
    iconCls:'icon-cancel',
    handler:function(){
    	/* $.messager.alert('提示','暂未开放此功能!'); */
    	
    	var ids = getSelectionsIds();
    	console.log(ids.length);
    	if(ids.length == 0){
    		$.messager.alert('提示','未选中书籍!');
    		return ;
    	}
    	$.messager.confirm('确认','确定删除ID为 '+ids+' 的书籍吗？',function(r){
    	    if (r){
            	$.post("/rest/book/delete",{'ids':ids,'_method':'delete'}, function(data){
        			if(data == 204){
        				$.messager.alert('提示','删除书籍成功!',undefined,function(){
        					$("#bookList").datagrid("reload");
        				});
        			}
        		});
    	    }
    	}); 
    }
},'-',{
    text:'导出',
    iconCls:'icon-remove',
    handler:function(){
    	$.messager.alert('提示','暂未开放此功能!');
    	/*var optins = $("#userList").datagrid("getPager").data("pagination").options;
    	var page = optins.pageNumber;
    	var rows = optins.pageSize;
    	$("<form>").attr({
    		"action":"/user/export/excel",
    		"method":"POST"
    	}).append("<input type='text' name='page' value='"+page+"'/>")
    	.append("<input type='text' name='rows' value='"+rows+"'/>").submit(); */
    }
}];
</script>
</body>
</html>