$(function(){
    const taxRate = 0.1

    $('.inputs-detail-price__form__input').on('keyup',function(e){
        var price = $(this).val();
        var valueType = $.type(price);


        if(price == ""){
            $('.tax').text("-");
            $('.profit').text("-");
        }else{
            if($.isNumeric(price)){
                if (price<300||price>9999999){
                    $('.tax').text("めるかり");
                    $('.profit').text("めるかり〜");
                }else{
                    tax = price*taxRate;
                    tax = Math.round(tax).toString();
                    profit = (price - tax).toString();
                    tax = tax.replace(/(\d)(?=(\d{3})+$)/g,"$1,");
                    profit = profit.replace(/(\d)(?=(\d{3})+$)/g,"$1,");
                    $('.tax').text("¥" + tax);
                    $('.profit').text("¥" + profit);
                }
            }else{
                $('.tax').text("文字入れてんじゃねーよ");
                $('.profit').text("帰れ！！");
            }

        }
    });
});