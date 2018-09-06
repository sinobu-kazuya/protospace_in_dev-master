$(document).on('turbolinks:load', function() {
  $(function(){
    function buildHTML(comment){
      var html = `<div class='media'>
                    <div class='media-left'>
                      <a href='/users/${comment.user_id}'>
                       <img alt='64x64' class='media-object' data-holder='{&quot;rendered&quot;:&quot;true&quot;}' data-src=${comment.user_avatar} style='width: 64px; height: 64px;'>
                      </a>
                    </div>
                    <div class='media-body'>
                      <h4 class='top-aligned-media media-heading'>
                      <strong>
                      ${comment.user_name}
                     <a rel="nofollow" data-method="delete" href="/prototypes/2/comments/2">削除</a>
                      </strong>
                      <p>
                    ${comment.text}
                      </p>
                      </h4>
                    </div>
                  </div>`
      return html;
    }
    $('#new_comment').on('submit', function(e){
      e.preventDefault();
      // console.log(this)
      var formData = new FormData(this);
      var url = $(this).attr('action')
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data){
        // console.log(data)
        var html = buildHTML(data);
        $('#new_comment').append(html);
        // $('.comment_field form-control').remove();
        $('.comment_field.form-control').val('');
        $('.comment_field.form-control').prop('disabled', false);
      })
      .fail(function(){
        alert('error');
      })
       // return false;
    });
  });
});
