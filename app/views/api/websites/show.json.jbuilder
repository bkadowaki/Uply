json.id @website.id
json.title @website.title
json.description @website.description
json.url @website.url
json.url_title @website.url.gsub("http://", "").gsub("https://", "")
json.ups @website.ups.count
json.commentCount @website.comments.count
