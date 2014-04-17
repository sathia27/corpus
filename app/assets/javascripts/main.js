$(document).ready(function(){
  $('#word_search').autocomplete({
      source: '/words.json?search=true',
      open: function(event, ui) {
        $(this).autocomplete("widget").css({
          "width": $("#word_search").width()+20,
        });
      },
      select: function(event, ui) {
        var url = ui.item.id;
        if(url != '#') {
            location.href = '/words/' + url;
        }
      },
  });
});
