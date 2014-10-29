json.id @website.id
json.title @website.title
json.description @website.description
json.wordle (@website.title + @website.description).split(" ")
json.url @website.url
json.url_title @website.url.gsub("http://", "").gsub("https://", "")
json.ups @website.ups.count
json.commentCount @website.comments.count
