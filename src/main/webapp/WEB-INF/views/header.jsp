<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${path}/css/bootstrap.min.css" rel="stylesheet">
<script src="${path}/js/jquery.js"></script>
<script src="${path}/js/bootstrap.min..js"></script>
<style>
.err {
	color: red;
	font-size: 16px;
}

.fix {
	position: fixed;
	bottom: 5px;
	right: 5px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('.tp').click(function() {
			$(window).scrollTop(0);
		});
// 		$('.mouseImg').hover(function() {
// 			$(this).animate({scale:'+=0.2'}, 300);
// 		}, function() {
// 			$(this).animate({scale:'-=0.2'}, 300);
// 		});
	});
</script>