$(document).ready(function(){
  let page = 1
  $(window).scroll(function () {
    if ($(window).scrollTop() + $(window).height() == $(document).height()) {
      page += 1;
      $.get(`/?page=${page}`);
    }
  });
})