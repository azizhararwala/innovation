<%@page import="com.gale.craftday.homeworkhelper.PlayListFetcher"%>
<html>
<head>
      <!-- HTML5 support for IE6-8 support of HTML elements -->
      <!--[if lt IE 9]>
         <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
      <![endif]-->
      <link href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css" rel="stylesheet" />

	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript" src="scripts/khan.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var json= <%=PlayListFetcher.fetchList()%>;
			Khan.render(json);
		});
	</script>
</head>

<body>
<h2>Khan Academy Play List</h2>
<div>
  <table border="1" cellspacing="0" id="playList">
  	<tr class="row">
  		<th width="25%">Topic</th>
  		<th width="25%">Sub-Topic</th>
  		<th width="50%">Description</th>
  	</tr>
  
  </table>
</div>
</body>
</html>
