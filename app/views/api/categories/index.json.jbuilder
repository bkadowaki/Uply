json.array! @categories do |c|
  json.id c.id
  json.name c.name
  json.websites c.websites do |w|
    json.id w.id
    json.title w.title
    json.url w.url
    json.description w.description
    json.created_at w.created_at
    json.ups w.ups.count
    json.websiteScore w.website_score
  end
end

