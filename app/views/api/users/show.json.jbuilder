json.id @user.id
json.first @user.first
json.websites_ups_count @user.websites_ups_count
json.comments_ups_count @user.comments_ups_count
json.upd_comments @user.upd_comments
json.upd @user.websites do |w|
  json.id w.id
  json.title w.title
  json.url w.url
  json.url_title w.url.gsub('http://','').gsub('https://','')
  json.description w.description
  json.ups w.ups.count
end
json.comments @user.comments do |c|
	json.id c.id
	json.text c.text
	json.website c.website.url.gsub('http://','').gsub('https://','')
	json.ups c.ups.count
end
