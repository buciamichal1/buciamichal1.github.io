$(function(){
    x=0;
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
    
    });