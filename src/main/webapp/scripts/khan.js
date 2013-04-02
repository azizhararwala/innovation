var Khan= {};

Khan.render= function(playList) {
    for (var i=0, n=playList.length; i<n; i++) {
        var row= Khan.formatPlayItem(playList[i]);
        $('#playList').append(row);
    }
}

Khan.formatPlayItem = function(playItem) {
    var url= playItem.ka_url.replace(/\/#.*$/, "") + playItem.topic_page_url;
    
    return  '<tr class="row">' + 
                Khan.td(playItem.community_questions_title) + 
                Khan.td('<a href="'+ url + '">' + playItem.title + '</a>') + 
                Khan.td(playItem.description) + 
            '</tr>';
}

Khan.td = function(text) {
    return '<td>' + text + '</td>';
}