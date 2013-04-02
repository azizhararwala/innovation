<%@page import="com.gale.craftday.homeworkhelper.PlayListFetcher"%>
<html>
<head>
      <!-- HTML5 support for IE6-8 support of HTML elements -->
      <!--[if lt IE 9]>
         <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
      <![endif]-->
      <link href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css" rel="stylesheet" />

	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>	
</head>

<body>
<iframe  height="100%" width="100%" src="http://localhost:8080/QuizzleyRender?url=<%= request.getParameter("url") %>"></iframe>
</body>
</html>
