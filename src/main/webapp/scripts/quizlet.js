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
	var spaceUrl = 'http://localhost:8080/QuizzleyRender?url=http://quizlet.com/' + set.id + '/spacerace/';
	var scatterUrl = 'http://localhost:8080/QuizzleyRender?url=http://quizlet.com/' + set.id + '/scatter/';

	//var spaceUrl= 'http://quizlet.com/' + set.id + '/spacerace/';
	//var scatterUrl= 'http://quizlet.com/' + set.id + '/scatter/';
    return  '<tr class="row">' +
                Quizlet.td('<a target="_blank" href="'+ set.url + '">' + set.title + '</a>') +
                Quizlet.td(set.description) +
                Quizlet.td('<a href="'+ spaceUrl + '"><img src="playspace.png"></img></a>') +
                Quizlet.td('<a href="'+ scatterUrl + '"><img width="32" height="32" src="playscatter.png"></img></a>') +
            '</tr>';
}

Quizlet.td = function(text) {
    return '<td>' + text + '</td>';
}
Quizlet.playGameDialog = function() {
    $("#playGame").dialog({ title:"Play Game", dialogClass:"no-close"});
}