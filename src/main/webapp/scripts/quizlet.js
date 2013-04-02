var Quizlet= {};

Quizlet.render= function(searchResults) {
	var sets = searchResults.sets;
    for (var i=0, n=sets.length; i<n; i++) {
        var row = Quizlet.formatPlayItem(sets[i]);
        $('#quizly').append(row);
    }
}

Quizlet.formatPlayItem = function(set) {	
//	var url = 'http://localhost:8080/quizlyRender.jsp?url=http://quizlet.com/' + set.id + '/spacerace/';
	
	var spaceUrl= 'http://quizlet.com/' + set.id + '/spacerace/';
	var scatterUrl= 'http://quizlet.com/' + set.id + '/scatter/';
    return  '<tr class="row">' + 
                Quizlet.td('<a target="_blank" href="'+ set.url + '">' + set.title + '</a>') + 
                Quizlet.td(set.description) +
                Quizlet.td('<a target="_blank" href="'+ spaceUrl + '"><img src="playspace.png"></img></a>') +
                Quizlet.td('<a target="_blank" href="'+ scatterUrl + '"><img width="32" height="32" src="playscatter.png"></img></a>') +
            '</tr>';
}

Quizlet.td = function(text) {
    return '<td>' + text + '</td>';
}