<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Khan Academy Mind App</title>
  <!-- HTML5 support for IE6-8 support of HTML elements -->
  <!--[if lt IE 9]>
     <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <link href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
     <!-- Header -->
    <header class="info" id="overview">
       <div class="inner">
          <div class="container">
             <h1>Homework Helper from Gale|Cengage</h1>
          </div>
       </div>
    </header>
    <div class="span7">
        <form name="search" action="" class="form-stacked">
              <fieldset>
                 <div class="clearfix">
                    <label for="query">Khan Academy Video Playlist?</label>
                    <div class="input">
                       <input class="xlarge" id="query" name="query" type="text" />
                    </div>
                 </div>
                 </br>
              </fieldset>
              <div class="actions">
                 <button id="submitSearch" type="submit" class="btn primary">Search</button>
              </div>
        </form>
    </div>
</body>
</html>