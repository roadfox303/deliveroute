// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
document.addEventListener('turbolinks:load', function() {
  $(".sortableArea").sortable({
    handle:'h2',
    opacity: 0.7,
    cursor: 'ns-resize',
    update: function(){
      let list_number = $(this).index();
      let list_array = $(this).sortable("toArray");
      // console.log(list_number, list_array);
      list_array.map(function( value, index ) {
        $(`#${value} input`).val(index + 1);
        $(`#${value} span:first`).text(index + 1);
      });
      $('#sort_form').submit();
      // $.ajax({
      // url: url,  // リクエストを送信するURLを指定
      // type: "POST",  // HTTPメソッドを指定（デフォルトはGET）
      // data: {  // 送信するデータをハッシュ形式で指定
      //   note: {body: inputText}
      // },
      // dataType: "json"  // レスポンスデータをjson形式と指定する
    }
  });
});
