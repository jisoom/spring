/**
 * 아코디언 메뉴
 */
 
 $(".aco-tit").click(function () {
  $(this).next(".qna-txtBox").slideToggle();
  
  $(this).parent().siblings().find(".qna-txtBox").slideUp(500);
});