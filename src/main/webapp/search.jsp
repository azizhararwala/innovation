<%@page import="com.gale.craftday.homeworkhelper.PlayListFetcher"%>
<!DOCTYPE HTML>
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
<h2>Delmar Health Care Video Search</h2>
      <section id="searchForm" />

         <div class="span7">
            <form name="search" action="/HeySmartGuy" class="form-stacked">
               <fieldset>
                  <div class="clearfix">
                     <label for="query">What topic do you need more information on?</label>
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
      </section>
      <section id="error">
      </section>
      <section id="searchResultsHeader">
      </section>
      <div id="video" style="display:none">
		<video width="320" height="240" controls="controls">
			<source src="" type="video/mp4" id="videoSource"></source>
				Your browser does not support the video tag.
		</video>
	</div>
      <section id="searchResultsList">
      </section>
      <footer class="footer">
         <div class="container">
            <p>
               Designed and built with learning and innovation in mind.
            </p>
         </div>
      </footer>
      <!-- Javascript -->
    	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
      <script type="text/javascript"  src="scripts/searchAndGetGalaxyResults.js"></script>      

</body>
</html>
