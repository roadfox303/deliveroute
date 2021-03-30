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
    scrollSensitivity: 40,
    scrollSpeed: 20,
    update: function(){
      let list_number = $(this).index();
      let list_array = $(this).sortable("toArray");
      // list_array.pop();
      list_array.map(function( value, index ) {
        $(`#${value} input.form_sequence`).val(index + 1);
        $(`#${value} span:first`).text(index + 1);
      });
      $('#sort_form').submit();
    }
  });
  $(".sortableArea2").sortable({
    handle:'h2',
    opacity: 0.7,
    cursor: 'ns-resize',
    scrollSensitivity: 40,
    scrollSpeed: 20,
    update: function(){
      let list_number = $(this).index();
      let list_array = $(this).sortable("toArray");
      let $arrival = $(`input.form_arrival`);
      list_array.map(function( value, index ) {
        $(`#${value} input.form_sequence`).val(index + 1);
        $(`#${value} span:first`).text(index + 1);
        if (index >= 1 && $arrival.eq(index).val() <= $arrival.eq(index -1).val()){
          $arrival.eq(index).addClass('form_alert');
        }else{
          $arrival.eq(index).removeClass('form_alert');
        }
      });
    }
  });
  let options = {
    now: "12:00", //hh：mm 24時間形式のみ、デフォルトは現在時刻
    editMode: true,
    twentyFour: true, //24時間形式を表示します。デフォルトはfalseです。
    title: '定時を設定', //Wickedpickerのタイトル
    minutesInterval: 5, //分間隔を変更します。デフォルトは1です。
    onClickOutside: function(e) {
      let $arrival = $('.form_arrival');
      $arrival.map(function(index, element) {
        if(index >= 1 && $(element).val() <= $arrival.eq(index -1).val()){
          $arrival.eq(index).addClass('form_alert');
        }else{
          $arrival.eq(index).removeClass('form_alert');
        }
      })
    }
  }
  $('.timepicker').wickedpicker(options);

  $('.btn_acordion').on('click',function(){
    $(this).next().toggleClass('close');
    $('i',this).toggleClass('up');
  });

  $("#route_spots li").click(function () {
    $target = $(`#hidden_spots #route_spot_ids_${$(this).attr('data')}`);
    let count = Number($('#spot_count').text().replace(/[^0-9]/g, ''));
    if($target.prop('checked')){
      $target.prop('checked', false);
      $('div',this).removeClass('checkbox_on');
      $('#spot_count').text(` (${count - 1})`);
    }else{
      $target.prop('checked', true);
      $('div',this).addClass('checkbox_on');
    $('#spot_count').text(` (${count + 1})`);
    }
  });

  $("#spot_routes li").click(function () {
    $target = $(`#hidden_routes #spot_route_ids_${$(this).attr('data')}`);
    let count = Number($('#route_count').text().replace(/[^0-9]/g, ''));
    if($target.prop('checked')){
      $target.prop('checked', false);
      $('div',this).removeClass('checkbox_on');
      $('#route_count').text(` (${count - 1})`);
    }else{
      $target.prop('checked', true);
      $('div',this).addClass('checkbox_on');
    $('#route_count').text(` (${count + 1})`);
    }
  });

  $('.icon_button').on('click',function(){
    $(`#spot_${$(this).attr("data-id")} .memo`).toggleClass('open');
  });
  $("#btn_toggle_tags").click(function () {
    if ($(".memo").last().hasClass("open")){
      $(".memo").removeClass("open");
    }else{
      $(".memo").addClass("open");
    }
  });

  $("#btn_goto_top").click(function () {
    $('body,html').animate({
        scrollTop: 0
    }, 500);
    return false;
  });
  $("#btn_goto_bottom").click(function () {
    $('body,html').animate({
        scrollTop: $(document).height()
    }, 500);
    return false;
  });
});
