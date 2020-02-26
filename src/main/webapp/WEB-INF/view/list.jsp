<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resource/css/index3.css"/>
<script type="text/javascript" src="/resource/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	function fenye(pageNum) {
		$("[name=pageNum]").val(pageNum);
		$("form").submit();
	}

	//全选/全不选
	function choose(own){
		$("[name=check]").attr("checked",own.checked);
	}
	
	function morder(orderName) {
		var orderMethod='${mVO.orderMethod}';
		
		orderMethod=orderMethod=='desc'?'asc':'desc';
		
		location.href="/selects?orderName="+orderName+"&orderMethod="+orderMethod;		
	}
	
	
	 function del() {
		 var ids=$("[name=check]:checked").map(function() {
			return this.value;
		}).get().join();
		 
		$.post(
			"del",
			{ids:ids},
			function(flag) {
				if (flag) {
					alert("删除成功");
					location="/selects";
				} else {
					alert("删除失败");
				}
			}
		)
	}
</script>
</head>
<body>
<form action="/selects" method="post">
	<input type="hidden" name="pageNum">
	影片名称:<input type="text" name="name" value="${movieVO.name}"> &nbsp;上映时间:<input type="text" name="t1"  value="${movieVO.t1}">至<input type="text" name="t2" value="${movieVO.t2}"><br>
	导演:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="actor"    value="${movieVO.actor}"> &nbsp;价格:<input type="text" 	name="p1"   value="${movieVO.p1}">-<input type="text" name="p2" value="${movieVO.p2}"><br>
	电影年代:<input type="text" name="years"value="${movieVO.years}"> &nbsp;电影时长:<input type="text" name="l1"  value="${movieVO.l1}">-<input type="text" name="l2" value="${movieVO.l2}"><br>
	<button>查询</button>
	<input type="button" value="删除影片" onclick="del()">
</form>
<table>
		<tr>			
			<td>
				<input type="checkbox" onclick="choose(this)" />
			</td>
			<td>序号</td>
			<td>电影名称</td>
			<td>导演</td>			
			<td>上映日期</td>
			<td><a href="javascript:morder('longtime')">电影时长</a></td>
			<td><a href="javascript:morder('price')">价格</a></td>	
			<td><a href="javascript:morder('years')">年代</a></td>
			<td>类型</td>
			<td>区域</td>
			<td>状态</td>
			

		</tr>
		<c:forEach items="${page.list}" var="movie" varStatus="i">
			<tr>	
				<td>
					<input type="checkbox" name="check"  value="${movie.id}" />
				</td>
				<td>${i.count+page.startRow-1 }</td>
				<td>${movie.name }</td>
				<td>${movie.actor }</td>				
				<td>${movie.uptime }</td>
				<td>${movie.longtime }</td>
				<td>${movie.price }</td>
				<td>${movie.years }</td>
				<td>${movie.type }</td>
				<td>${movie.area }</td>
				<td>${movie.status }</td>				
			</tr>
			
		</c:forEach>

		<tr>
			<td colspan="12">
				<button onclick="fenye(1)">首页</button>
				<button onclick="fenye(${page.prePage==0?1:page.prePage})">上一页</button>
				<button onclick="fenye(${page.nextPage==0?page.pages:page.nextPage})">下一页</button>
				<button onclick="fenye(${page.pages})">尾页</button>
				第${page.pageNum}/${page.pages}页，共${page.total}条
				
			</td>
		</tr>
	</table>

</body>
</html>