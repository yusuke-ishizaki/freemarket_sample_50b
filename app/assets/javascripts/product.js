// トップページのスライド部分を動かす記述です。
$(document).ready(function(){
  $('.slider').slick({
    infinite: true,
    dots: true,
    pauseOnFocus: false,
    pauseOnHover: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 3000,
    arrows: false,
  });
});
