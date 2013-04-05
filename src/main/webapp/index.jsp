<%@page import="com.gale.craftday.homeworkhelper.PlayListFetcher"%>
<html>
<head>
      <!-- HTML5 support for IE6-8 support of HTML elements -->
      <!--[if lt IE 9]>
         <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
      <![endif]-->

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
    <link href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
	<script type="text/javascript" src="scripts/quizlet.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			var json= <%=PlayListFetcher.fetchQuizletSearchResults()%>;
			Quizlet.render(json);
			Quizlet.attachedPlayGameClickEvent();
			$('#playGame').dialog({ autoOpen: false, modal: true, title: "Play Game", width: 664, resizable: true });
		});
	</script>
</head>

<body>
<div id="renderQuizlet">
  <table class="table table-bordered table-striped" border="1" cellspacing="0" id="quizly">
  	<tr class="row">
		<th width="25%">Flash Card</th>
  		<th width="25%">Description</th>
  		<th width="25%">Space Game</th>
  		<th width="25%">Scatter Game</th>
  	</tr>
  </table>
	<div id="playGame">
	    <iframe id="playGameFrame" src="" width="640" height="360" frameborder="0" webkitallowfullscreen="" allowfullscreen=""></iframe>
	</div>
</div>
</body>
</html>
