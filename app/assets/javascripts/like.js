$(function(){

  $(document).on("click", ".like", function(){
    let coordinateId = $(this).data();
    iconBox = $(this).parent();

    $.ajax({
      url: '/likes/destroy',
      type: 'delete',
      dataType: 'json',
      data: {coordinate_id: coordinateId.coordinateId}
    })

    .done(function(coordinate){
      let unlikeIcon = `<i data-coordinate-id= ${coordinateId.coordinateId} class="fa fa-heart-o unlike"></i>`
      let likesCount = `<span class="likes-count">${coordinate.length}</span>`
      iconBox.children().remove();
      iconBox.append(unlikeIcon);
      iconBox.append(likesCount);
    })
    .fail(function(){
      alert("いいね削除に失敗しました");
    })
  })

  $(document).on("click", ".unlike", function(){
    let coordinateId = $(this).data();
    iconBox = $(this).parent();

    $.ajax({
      url: '/likes/create',
      type: 'post',
      dataType: 'json',
      data: {coordinate_id: coordinateId.coordinateId}
    })

    .done(function(coordinate){
      let likeIcon = `<i data-coordinate-id= ${coordinateId.coordinateId} class="fa fa-heart like"></i>`
      let likesCount = `<span class="likes-count">${coordinate.length}</span>`
      iconBox.children().remove();
      iconBox.append(likeIcon);
      iconBox.append(likesCount);
    })
    .fail(function(){
      alert("いいねに失敗しました");
    })
  })

});