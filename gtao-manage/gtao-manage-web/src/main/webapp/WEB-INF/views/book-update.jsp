<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="padding:10px 10px 10px 10px">
	<form id="content" method="post">
	    <table cellpadding="5">
	        <tr>
	            <td>书名:</td>
	            <td><input class="easyui-textbox" type="text" name="title" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>作者:</td>
	            <td><input class="easyui-textbox" type="text" name="author" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>出版社:</td>
	            <td><input class="easyui-textbox" type="text" name="chubanshe" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>页数:</td>
	            <td><input class="easyui-textbox" type="text" name="pages" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	function submitForm(){
		if(!$('#content').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		$.post("/rest/book/update",$("#content").serialize(), function(data){
			console.log(data);
			if(data == 200){
				$.messager.alert('提示','新增书籍成功!');
				$('#bookAdd').window('close');
				$("#bookList").datagrid("reload");
				clearForm();
			}else{
				$.messager.alert('提示','新增书籍失败!');
			}
		});
	}
	function clearForm(){
		$('#content').form('reset');
	}
</script>