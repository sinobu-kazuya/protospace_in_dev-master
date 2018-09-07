$(function() {
  $('#prototype_captured_images_attributes_1_content').after('<span></span>');
  // type=fileのinputの後にspanを入れる

  // アップロードするファイルを選択
  $('#prototype_captured_images_attributes_1_content').change(function(e) {
    // type=fileのinputの入力内容が変更された時
    var file = $(this).prop('files')[0];
    //
    // 画像以外は処理を停止
    if (! file.type.match('image.*')) {
      // クリア
      $(this).val('');
      $('span').html('');
      return;
    }

    // 画像表示
    var reader = new FileReader();
    reader.onload = function() {
    console.log("読み込みが終わりました");
      var img_src = $('<img width=130 class=sub_image_1>').attr('src', reader.result);
      $(e.target).next().html(img_src);
    }
    reader.readAsDataURL(file);
  });
});
