$(function(){
  $('.user-show-box__logout').click(function(){
    if(confirm('ログアウトしてよろしいですか？')){
    }
    else{
      return false;
    }
  })

  $('.item-image-unit__show__button-delete').click(function(){
    if(confirm('削除してよろしいですか？')){
    }
    else{
      return false;
    }
  })

  $('.coordinate-link__button-delete').click(function(){
    if(confirm('削除してよろしいですか？')){
    }
    else{
      return false;
    }
  })

  $('.coordinate-show__comment-box__unit__destroy').click(function(){
    if(confirm('削除してよろしいですか？')){
    }
    else{
      return false;
    }
  })
});