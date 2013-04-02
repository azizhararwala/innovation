var INNOVATION = {}; (function($) {

    INNOVATION.askHomeworkHelper = {
        init: init
    };

    function init() {
        bindClearEvents();
        $('#submitSearch').click(searchAndGetResults);
        bindVideo();
    }

    function bindClearEvents() {
        $('#query').focus(clearPreviousResults);
        $('#contentSets').focus(clearPreviousResults);
        $('#displayGroups').focus(clearPreviousResults);

        function clearPreviousResults() {
            $('#error').empty();
            $('#searchResultsHeader').empty();
            $('#searchResultsList').empty();
            return false;
        }
    }

    function searchAndGetResults() {

        var userSearchQuery = $('#query').val();

        if (userSearchQuery === '') {
            $('#error').html('<div class="row"><div class="span5">&nbsp;</div><div class="span7"><h3>Search Term required.<br/>Please search on another topic.</h3></div></div>');
        } else {

            $.getJSON("/HeySmartGuy/search?query=" + userSearchQuery, function(json) {
                $('#searchResultsHeader').html('<div class="row"><div class="span12"><h2>Search Results</h2></div></div>');
                $('#searchResultsList').append('<div class="row"><div class="span12"><table id="searchResultsTable" class="bordered-table zebra-striped"><thead><tr><th>Title</th><th>Publication</th><th>Description</th></tr></thead><tbody></tbody></table></div></div>');
                if (json !== '') {
                    $.each(json.searchResults, function(i, result) {
                        $('#searchResultsTable tbody').append('<tr><td><a href="javascript://" class="image-caption" data-video_url="' + 
                        		result.videoPath + '" onclick="showVideo(this);">' + 
                        		result.imageCaption + '</a></td><td>' + result.videoPath + '</td><td>' + result.subjectIndexing + '...</td></tr>');
                    });
                } else {
                    $('#searchResultsList').html('<div class="row"><h3>Tell them your dog ate your homework.<h3></div>');
                }
            });
            bindVideo();
        }
        return false;
    }
    
    function bindVideo() {
    	$('.image-caption').on('click', function() {
    		var url= this.data('video_url');
    		alert(url);
    	});
    }
    
    function showVideo(el) {
    	alert(el.data('video_url'));
    }

})(jQuery);

$(document).ready(function() {
    INNOVATION.askHomeworkHelper.init();
});