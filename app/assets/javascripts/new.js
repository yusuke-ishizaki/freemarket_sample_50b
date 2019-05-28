$(document).ready(function(){

// プレビューに挿入するHTMLの作成
function buildImage(loadedImageUri,num){
    var html =
    `<li class="sell-upload-item id=${num}">
      <figure class="sell-upload-figure landscape">
      <img class="img__append" src=${loadedImageUri}>
      </figure>
      <div class="item__images__container__preview__box">
        <div class="item__images__container__preview__box__edit" >
          編集
        </div>
        <div class="item__images__container__preview__box__delete">
          <a class="box__delete">削除</a>
        </div>
      </div>
    </li>`
    return html
};

function buildInput(num){
  var input = `
  <div class="sell-upload-box-drop-box">
  <div class="sell-upload-drop-file">
  <label for="product_product_images_attributes_${num}_image" id="delete-${num}">
  <p>クリックしてファイルをアップロード</p>
  <input name="product[product_images_attributes][${num}][image]" class="image-file" data-image=${num} type="file" id="product_product_images_attributes_${num}_image"></label>
  </div>
  </div>`
  return input;
};


files_array = [];

$(document).on('change','input[type= "file"]',function(event){
  var num = parseInt($(this).attr('image_upload'));   
  var file = $(this).prop('files')[0];
  var reader = new FileReader();

  reader.onload = (function(file) {
    return function(e) {
      var loadedImageUri = e.target.result;
      num-=1
      var imagelist = buildImage(loadedImageUri,num);
      $('.sell-upload-items-container__preview ul').append(imagelist);    
    };
  })(file);
  reader.readAsDataURL(file);
  num += 1
  var inputFile = buildInput(num);
  var list = $('.sell-upload-item');    
  if(list.length >= 9){
      $('.sell-upload-items-container__guide').css('display','none');   
   }
   console.log(files_array[0])
});


$('.sell-upload-items-container__guide').on('dragover',function(e){
  e.preventDefault();
});
$('.sell-upload-items-container__guide').on('drop',function(event){
  event.preventDefault();
  files = event.originalEvent.dataTransfer.files;
  for (var i=0; i<files.length; i++) {
    files_array.push(files[i]);
    var fileReader = new FileReader();
    fileReader.onload = function( event ) {
      var loadedImageUri = event.target.result;
      $(buildImage(loadedImageUri)).appendTo(".sell-upload-items-container__preview ul").trigger("create");
      console.log(files_array[1])
    };
    fileReader.readAsDataURL(files[i]);
  }
});

$(document).on('click','.sell-upload-items-container__preview a', function(){
    var index = $(".sell-upload-items-container__preview a").index(this);
    files_array.splice(index - 1, 1);
    $(this).parent().parent().parent().remove();
});


$('#new_item').on('submit', function(e){
    e.preventDefault();
    formData = new FormData($('#new_item').get(0));
    files_array.forEach(function(file){
     formData.append('product[images][]', file)
    });
    for (value of formData.entries()) { 
      console.log(value); 
    }
    $.ajax({
      url:         '/product',
      type:        "POST",
      data:        formData,
      contentType: false,
      processData: false,
      dataType:   'json',
    })
});
});

