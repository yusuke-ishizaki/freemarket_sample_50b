$(document).ready(function(){
    $('.detail__img-child').on('click',function(){
        url = $(this).attr('src');
        console.log(url)
        $('.detail__img-parent').attr('src', url);    
    });
});