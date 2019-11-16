json.length @user.followers.length
json.id current_user.id
json.name current_user.name
if current_user.image.url.present?
  json.image current_user.image.url
else 
  json.image "https://applimura.com/wp-content/uploads/2019/08/twittericon13.jpg"
end