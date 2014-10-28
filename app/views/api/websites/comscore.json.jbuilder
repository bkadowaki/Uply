json.id @website.id
json.title @website.title
json.description @website.description
json.url @website.url
json.url_title @website.url.gsub("http://","").gsub("https://","")
json.ups @website.ups.count
json.comCount @website.comments.map(&:user_id).uniq.count
json.comments @website.comments do |w|
  json.commentsText w.text
  json.commentsUser w.user.first
end
