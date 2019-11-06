$(function(){

  $(".outer-item").on("click", function(){
    let itemId = $(this).data();

    $.ajax({
      url: '/coordinates/select_outer',
      type: 'get',
      dataType: 'json',
      data: {outer_item_id: itemId.itemId}
    })

    $(".outer-item").css("border", "solid 2px #eeeeee")
    $(this).css("border", "solid 2px #CC3399")
  })

  $(".tops-item").on("click", function(){
    let itemId = $(this).data();

    $.ajax({
      url: '/coordinates/select_tops',
      type: 'get',
      dataType: 'json',
      data: {tops_item_id: itemId.itemId}
    })

    $(".tops-item").css("border", "solid 2px #eeeeee")
    $(this).css("border", "solid 2px #CC3399")
  })

  $(".pants-item").on("click", function(){
    let itemId = $(this).data();

    $.ajax({
      url: '/coordinates/select_pants',
      type: 'get',
      dataType: 'json',
      data: {pants_item_id: itemId.itemId}
    })

    $(".pants-item").css("border", "solid 2px #eeeeee")
    $(this).css("border", "solid 2px #CC3399")
  })

  $(".shoes-item").on("click", function(){
    let itemId = $(this).data();

    $.ajax({
      url: '/coordinates/select_shoes',
      type: 'get',
      dataType: 'json',
      data: {shoes_item_id: itemId.itemId}
    })

    $(".shoes-item").css("border", "solid 2px #eeeeee")
    $(this).css("border", "solid 2px #CC3399")
  })

  $(".bag-item").on("click", function(){
    let itemId = $(this).data();

    $.ajax({
      url: '/coordinates/select_bag',
      type: 'get',
      dataType: 'json',
      data: {bag_item_id: itemId.itemId}
    })

    $(".bag-item").css("border", "solid 2px #eeeeee")
    $(this).css("border", "solid 2px #CC3399")
  })

  $(".accessory-item").on("click", function(){
    let itemId = $(this).data();

    $.ajax({
      url: '/coordinates/select_accessory',
      type: 'get',
      dataType: 'json',
      data: {accessory_item_id: itemId.itemId}
    })

    $(".accessory-item").css("border", "solid 2px #eeeeee")
    $(this).css("border", "solid 2px #CC3399")
  })

});