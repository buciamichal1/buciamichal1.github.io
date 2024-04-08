$(function(){
    x = 0;
    $("#menu").click(function() {
        if (x == 0) {
            $('.categories').css({'visibility':'visible','display':'block'});
            $('.categories').stop().animate({'width': '30vh'}, 500);
            x = 1;
        } else {
            $('.categories').stop().animate({'width': '0vh'}, 500,function(){
            $('.categories').css({'visibility':'hidden','display':'none'});});
            x = 0;
        }
      });
    $(".category").click(function() {
        var category = $(this).data('category'); // Pobierz wartość atrybutu data-category klikniętej kategorii
        var subcategories = $('.subcategories[data-category="' + category + '"]'); // Znajdź podkategorie odpowiadające kategorii
        var subcategory = $('.subcategory[data-category="' + category + '"]'); 
        if (subcategories.css('display') == 'none') {
            $(".subcategory").not(subcategories).stop().animate({'height': '0vh'}, 500,function(){
            $(".subcategories").not(subcategories).css({'display':'none'});}); // Ukryj wszystkie podkategorie
            subcategories.css({'display':'block'});
            subcategory.stop().animate({'height': '5vh'}, 500);
        } else {
            subcategory.stop().animate({'height': '0vh'}, 500,function(){
            subcategories.css({'display':'none'});});
        }
      });
});

