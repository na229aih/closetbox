$(function(){
  $(".devise-signin-box__image__input").on("change", function(){
    var file = $(this).prop('files')[0];
    let reader = new FileReader();
    let img = $(`<div class= "img_view"><img></div>`);
    reader.onload = function(e){
      img.find('img').attr({src: e.target.result})
    }
    reader.readAsDataURL(file);
    $(this).css("display","none");
    $(".devise-signin-box__image").append(img);
  })
});