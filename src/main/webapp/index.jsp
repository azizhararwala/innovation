<%@page import="com.gale.craftday.homeworkhelper.PlayListFetcher"%>
<html>
<head>
      <!-- HTML5 support for IE6-8 support of HTML elements -->
      <!--[if lt IE 9]>
         <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
      <![endif]-->
      <link href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css" rel="stylesheet" />

	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript" src="scripts/quizlet.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			var json= <%=PlayListFetcher.fetchQuizletSearchResults()%>;
			Quizlet.render(json);
		});
	</script>
</head>

<body>
<div>
  <table border="1" cellspacing="0" id="quizly">
  	<tr class="row">
		<th width="25%">Title</th>
  		<th width="25%">Description</th>
  		<th width="25%">Space Game</th>
  		<th width="25%">Scatter Game</th>
  	</tr>

  </table>
</div>
</body>
</html>
