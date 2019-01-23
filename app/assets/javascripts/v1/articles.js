$(document).ready(function(){
  $('#live-preview-html').hide();
  $('#btn-preview').click(function (e) {
    console.log('Clicou pro preview')
    e.preventDefault();
    text = $('#article_body').val();

    preview = marked(text, { sanitize: true });
    $('#live-preview-html div').html(preview);

    $('#form-body').toggle();
    $('#live-preview-html').toggle();
  });

  $('#close-preview').click(function(e){
    $('#form-body').toggle();
    $('#live-preview-html').toggle();
  })
})