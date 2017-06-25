$(".icon_wrap .icon").click(function(){
  if($(this).hasClass("non_active")){ // クリックされた要素がclickedクラスだったら
    $(this).removeClass("non_active");
    $(this).addClass("active");
  }else{
    $(this).removeClass("active");
    $(this).addClass("non-active");
  }
});
