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

// files_array = [];


// var fileReader = new FileReader() ;
// fileReader.onload = function ( event ) {
//   event.preventDefault();
//   // 何故か、dataTransferがうまくいかなかったので、originalEventから読み込んでいます。
//   // ここで、イベントによって得たファイルを配列で取り込んでいます。
// files = event.originalEvent.dataTransfer.files;
//   // 画像のファイルを一つづつ、先ほどの画像管理用の配列に追加する。
// for (var i=0; i<files.length; i++) {
//   files_array.push(files[i]);
//   var fileReader = new FileReader();
//   // ファイルが読み込まれた際に、行う動作を定義する。
//   fileReader.onload = function( event ) {
//     // 画像のurlを取得します。
//     var loadedImageUri = event.target.result;
//     // 取得したURLを利用して、ビューにHTMLを挿入する。
//     $(buildImage(loadedImageUri)).appendTo(".sell-upload-items-container__preview ul").trigger("create");
//     console.log(files_array[0])
//   };
//   // ファイルの読み込みを行う。
//   fileReader.readAsDataURL(files[i]);
// }
// }








// 画像を管理するための配列を定義する。
files_array = [];

$(document).on('change','input[type= "file"]',function(event){
  //inputのdata-imageを取得。
  var num = parseInt($(this).attr('image_upload'));   
  //inputの親要素のsell-upload-box-drop-boxを取得。
  // var parent = $(this).parent()
  //親要素のsell-upload-box-drop-boxをnoneする。
  // parent.css('display','none');
  //inputに入っているimageを取得する。
  var file = $(this).prop('files')[0];
  var reader = new FileReader();
  //loadImageUriにimageのurlを代入している。
  //num-=1をすることで、inputと同じ番号を作っている。
  //imagelistにpreviewリストとnum-=1で作った番号を代入している。
  //ul(preview)にli(imagelist)を渡している。



//   files = event.originalEvent.dataTransfer.files;
//   // 画像のファイルを一つづつ、先ほどの画像管理用の配列に追加する。
// for (var i=0; i<files.length; i++) {
//   files_array.push(files[i]);
//   var fileReader = new FileReader();
//   // ファイルが読み込まれた際に、行う動作を定義する。
//   fileReader.onload = function( event ) {
//     // 画像のurlを取得します。
//     var loadedImageUri = event.target.result;
//     // 取得したURLを利用して、ビューにHTMLを挿入する。
//     $(buildImage(loadedImageUri)).appendTo(".sell-upload-items-container__preview ul").trigger("create");
//     console.log(files_array[1])
//   };
//   // ファイルの読み込みを行う。
//   fileReader.readAsDataURL(files[i]);
// }



  reader.onload = (function(file) {
    return function(e) {
      var loadedImageUri = e.target.result;
      num-=1
      var imagelist = buildImage(loadedImageUri,num);
      $('.sell-upload-items-container__preview ul').append(imagelist);    
    };
  })(file);
  reader.readAsDataURL(file);
  //1を足すことで、次のinputの番号を作っている。
  num += 1
  //上で作った番号を渡して新しいinputを作成してinputFileに代入している。
  var inputFile = buildInput(num);
  //sell-upload-box-containerの一番最後に代入している。
  // parent.after(inputFile);

  //ここでリストが10個以上あれば、全てのinputを隠す。
  //これで10枚以上の画像を遅れなくしている。
  var list = $('.sell-upload-item');    
  if(list.length >= 9){
      $('.sell-upload-items-container__guide').css('display','none');   
   }
   console.log(files_array[0])
});
















  
  // 通常のドラッグオーバイベントを止める。
$('.sell-upload-items-container__guide').on('dragover',function(e){
  e.preventDefault();
});
  // ドロップ時のイベントの作成
$('.sell-upload-items-container__guide').on('drop',function(event){
  event.preventDefault();
    // 何故か、dataTransferがうまくいかなかったので、originalEventから読み込んでいます。
    // ここで、イベントによって得たファイルを配列で取り込んでいます。
  files = event.originalEvent.dataTransfer.files;
    // 画像のファイルを一つづつ、先ほどの画像管理用の配列に追加する。
  for (var i=0; i<files.length; i++) {
    files_array.push(files[i]);
    var fileReader = new FileReader();
    // ファイルが読み込まれた際に、行う動作を定義する。
    fileReader.onload = function( event ) {
      // 画像のurlを取得します。
      var loadedImageUri = event.target.result;
      // 取得したURLを利用して、ビューにHTMLを挿入する。
      $(buildImage(loadedImageUri)).appendTo(".sell-upload-items-container__preview ul").trigger("create");
      console.log(files_array[1])
    };
    // ファイルの読み込みを行う。
    fileReader.readAsDataURL(files[i]);
  }
});


// div配下のaタグがクリックされた際に、イベントを発生させる。
$(document).on('click','.sell-upload-items-container__preview a', function(){
    // index関数を利用して、クリックされたaタグが、div内で何番目のものか特定する。
    var index = $(".sell-upload-items-container__preview a").index(this);
    // クリックされたaタグの順番から、削除すべき画像を特定し、配列から削除する。
    files_array.splice(index - 1, 1);
    // クリックされたaタグが含まれるli要素をHTMLから削除する。
    $(this).parent().parent().parent().remove();
});


// submitボタンが押された際のイベント
$('#new_item').on('submit', function(e){
    e.preventDefault();
    // そのほかのform情報を以下の記述でformDataに追加
    // var formData = new FormData($(this).get(0));
    formData = new FormData($('#new_item').get(0));
    // ドラッグアンドドロップで、取得したファイルをformDataに入れる。
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
    // .done(function(data){
    //   alert('出品成功！');
    //   console.dir(arguments);
    // })
    // .fail(function(XMLHttpRequest, textStatus, errorThrown){
    //   alert('やり直せ！　カスが！！');
    // });
});
});

