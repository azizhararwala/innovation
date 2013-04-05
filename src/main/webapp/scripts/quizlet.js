var Quizlet= {};

Quizlet.render= function(searchResults) {
	var sets = searchResults.sets;
    for (var i=0, n=sets.length; i<n; i++) {
        var row = Quizlet.formatPlayItem(sets[i]);
        $('#quizly').append(row);
    }
}
//TODO: need to modify url to prod before demo
Quizlet.formatPlayItem = function(set) {
	var spaceUrl = 'http://innovation.ahararwa.cloudbees.net/QuizzleyRender?url=http://quizlet.com/' + set.id + '/spacerace/';
	var scatterUrl = 'http://innovation.ahararwa.cloudbees.net/QuizzleyRender?url=http://quizlet.com/' + set.id + '/scatter/';
	var flashCardUrl = 'http://innovation.ahararwa.cloudbees.net/QuizzleyRender?url=' + set.url;

    return  '<tr class="row">' +
	    Quizlet.td('<a class="game btn-link" data-url="'+ flashCardUrl + '">' + set.title + '</a>') +
	    Quizlet.td(set.description) +
	    Quizlet.td('<button type="button" class="btn btn-primary game" data-url="'+ spaceUrl + '">Play</button>') +
	    Quizlet.td('<button type="button" class="game btn btn-primary" data-url="'+ scatterUrl + '">Play</button>') +
	    '</tr>';
}

Quizlet.attachedPlayGameClickEvent = function() {
	$("#renderQuizlet").delegate(".game", "click", Quizlet.clickGame);
}

Quizlet.clickGame = function(e) {
	e.preventDefault();
	var url = $(this).data('url');
	Quizlet.openGame(url, 'play Game');
}

Quizlet.openGame = function (source, title) {
	$('#playGameFrame').attr('src', source);
	$('#playGame').dialog("option", "title", title);
	$('#playGame').dialog("open");
	$('.ui-widget-overlay').click(function () { $('#playGame').dialog('close'); });
}


Quizlet.td = function(text) {
    return '<td>' + text + '</td>';
}
Quizlet.playGameDialog = function() {
    $("#playGame").dialog({ title:"Play Game", dialogClass:"no-close"});
}