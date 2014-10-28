json.id @user.id
json.first @user.first
json.upd @user.websites do |w|
  json.id w.id
  json.title w.title
  json.description w.description
  json.ups w.ups.count
end
json.comments @user.comments
