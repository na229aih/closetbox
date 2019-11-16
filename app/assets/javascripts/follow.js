$(function(){

  $(document).on("click", ".user-show-box__follow", function(){
    let followId = $(this).data();
    let followBox = `<div class="user-show-box__unfollow" data-follow-id=${followId.followId}>
                        フォロー中
                      </div>`
    $(this).remove();
    $(".follower-text").remove();

    $.ajax({
      url: '/users/follow',
      type: 'post',
      dataType: 'json',
      data: {follow_id: followId.followId}
    })

    .done(function(user){
      let followerLength = `<p class="follower-text">フォロワー${user.length}人</p>`
      let followeruser = `<a href="/users/${user.id}">
                            <div class="user-show-box__followings__user">
                              <div class="user-show-box__followings__user__image">
                                <img src= ${user.image}>
                              </div>
                              <div class="user-show-box__followings__user__name">
                                  ${user.name}
                              </div>
                            </div>
                          </a>`
      $(".user-show-box").append(followBox);
      $(".user-show-box__name__bottom-box").append(followerLength);
      $(".user-show-box__followers").append(followeruser);
    })
    .fail(function(){
      alert("フォローに失敗しました");
    })
  })

  $(document).on("click", ".user-show-box__unfollow", function(){
    let followId = $(this).data();
    let followBox = `<div class="user-show-box__follow" data-follow-id=${followId.followId}>
                        フォローする
                      </div>`
    $(this).remove();
    $(".follower-text").remove();


    $.ajax({
      url: '/users/unfollow',
      type: 'delete',
      dataType: 'json',
      data: {follow_id: followId.followId}
    })

    .done(function(user){
      let followerLength = `<p class="follower-text">フォロワー${user.length}人</p>`
      $(".user-show-box").append(followBox);
      $(".user-show-box__name__bottom-box").append(followerLength);
      let followerLinks = $(".user-show-box__followers").children();
      followerLinks.each(function(index, followerLink){
      if(followerLink.href == `http://localhost:3000/users/${user.id}`)
        followerLink.remove();
      });
    })
    .fail(function(){
      alert("フォロー解除に失敗しました");
    })
  })

  $(document).on("mouseover", ".following-text", function(){
    $(".user-show-box__followings").css("display", "block");
  }).mouseout(function(){
    $(".user-show-box__followings").css("display", "none");
  });

  $(document).on("mouseover", ".user-show-box__followings", function(){
    $(this).css("display", "block");
  }).mouseout(function(){
    $(".user-show-box__followings").css("display", "none");
  });

  $(document).on("mouseover", ".follower-text", function(){
    $(".user-show-box__followers").css("display", "block");
  }).mouseout(function(){
    $(".user-show-box__followers").css("display", "none");
  });

  $(document).on("mouseover", ".user-show-box__followers", function(){
    $(this).css("display", "block");
  }).mouseout(function(){
    $(".user-show-box__followers").css("display", "none");
  });

});