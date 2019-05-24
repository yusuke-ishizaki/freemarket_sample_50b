// imageCount = 0;
// $(function() {
//     function build_MIDHTML(Categories) {
//         let html = `<option value="">---</option>`;
//         $.each(Categories, function(i, category) {
//             html += `<option value="${category.id}" data-ancestry="${
//                 category.ancestry
//                 }">${category.name}</option>`;
//         });
//         return html;
//     }
//
//     function build_SMALLHTML(Categories) {
//         let html = `<option value="">---</option>`;
//         $.each(Categories, function(i, category) {
//             html += `<option value="${category.id}">${category.name}</option>`;
//         });
//         return html;
//     }
//     function buildItemImage(file) {
//         var reader = new FileReader();
//         reader.onload = function() {
//             imageCount += 1;
//             var img = new Image(114, 116);
//             img.src = reader.result;
//             var imageColumn, imageRow, navColumn, navRow;
//             if (imageCount > 5) {
//                 imageColumn = parseInt(imageCount % 5);
//             } else {
//                 imageColumn = parseInt(imageCount);
//             }
//             if (imageCount >= 5) {
//                 navColumn = (imageCount % 5) + 1;
//             } else {
//                 navColumn = imageCount + 1;
//             }
//             imageRow = parseInt(imageCount / 6 + 1);
//             navRow = parseInt(imageCount / 5 + 1);
//
//             var html_frame = `
//         <div class="image-box" style="grid-column:${imageColumn}/${imageColumn +
//             1}; grid-row:${imageRow}/${imageRow + 1};">
//         </div>`;
//             var html_command = `
//         <div class="commands" style="display:flex">
//           <div class"commands__edit" style="height:44px; width:57px;
//            line-height:48px; text-align:center; border:1px solid #f5f5f5;">編集</div>
//           <div class"commands__delete" style="height:44px; width:57px; line-height:48px; text-align:center; border:1px solid #f5f5f5;">削除</div>
//         </div>
//         `;
//
//             $(".image-input-box").append(html_frame);
//             $(".image-input-box .image-box")
//                 .last()
//                 .append(img)
//                 .append(html_command);
//
//             if (imageCount >= 10) {
//                 $(".drag-and-drop").hide();
//             }
//             $(".drag-and-drop")
//                 .css("grid-column", `${navColumn}/6`)
//                 .css("grid-row", `${navRow}/${navRow + 1}`);
//         };
//         reader.readAsDataURL(file);
//     }
//
//     //category-select_box
//     $("#selectitembox").change(function() {
//         let large_id = $(this).val();
//         $.ajax({
//             url: "/api/items/new",
//             type: "get",
//             data: {
//                 select_item_0: large_id
//             },
//             dataType: "json"
//         })
//             .done(function(midCategories) {
//                 console.log(midCategories);
//                 let midCategories_html = build_MIDHTML(midCategories);
//                 $("#selectitembox1").empty();
//                 $("#selectitembox1").append(midCategories_html);
//             })
//             .fail(function() {
//                 alert("error.");
//             });
//         if ($(this).val() !== "") {
//             $("#selectitembox1").show();
//         } else {
//             $("#selectitembox1").hide();
//             $("#selectitembox2").hide();
//             $("#selectitembox1").val("");
//             $("#selectitembox2").val("");
//         }
//     });
//     $("#selectitembox1").change(function() {
//         let large_id = $("#selectitembox").val();
//         let mid_id = $(this).val();
//         $.ajax({
//             url: "/api/items/new",
//             type: "get",
//             data: {
//                 select_item_0: large_id,
//                 select_item_1: mid_id
//             },
//             dataType: "json"
//         })
//             .done(function(smallCategories) {
//                 console.log(smallCategories);
//                 let smallCategories_html = build_SMALLHTML(smallCategories);
//                 $("#selectitembox2").empty();
//                 $("#selectitembox2").append(smallCategories_html);
//             })
//             .fail(function() {
//                 alert("error.");
//             });
//         if ($(this).val() !== "") {
//             $("#selectitembox2").show();
//         } else {
//             $("#selectitembox2").hide();
//             $("#selectitembox2").val("");
//         }
//         //category-select_boxここまで
//
//         //active-storage 画像表示
//         $("#image_upload").on("change", function() {
//             var files = this.files;
//             if (files.length + imageCount > 10) {
//                 alert("10個より多くの画像は投稿できません.");
//                 return false;
//             }
//             $.each(files, function(i, file) {
//                 buildItemImage(file);
//             });
//         });
//
//         //active-storage 画像表示 end
//
//         $(".commands__delete").on("click", function(e) {
//             alert("消す");
//             this.parent().delete();
//         });
//
//         //
//         $(".image-box__bottom__image").on("mouseover", function() {
//             $(".image-box__pickup img").attr(
//                 "src",
//                 $(this)
//                     .children("img")
//                     .attr("src")
//             );
//             $(".image-box__bottom__image").removeClass(
//                 "image-box__bottom__image--active"
//             );
//             $(this).addClass("image-box__bottom__image--active");
//         });
//     });
// });



