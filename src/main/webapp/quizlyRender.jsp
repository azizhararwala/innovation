<%@page import="com.gale.craftday.homeworkhelper.PlayListFetcher"%>
<html>
<head>
</head>
	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var page = <%=PlayListFetcher.fetchQuizletPage(request.getParameter("url"))%>;
			$('#render_quizly').html(page);
		});
	</script>
<body>
<h2>Quizzley</h2>
<div id="render_quizly">
</div>
</body>
</html>
