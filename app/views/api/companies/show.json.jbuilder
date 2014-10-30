json.id @company.id
json.name @company.name
json.websites @company.websites do |w|
  json.id w.id
  json.title w.title
  json.url_title w.url.gsub('http://','').gsub('https://','').capitalize
  json.description w.description
  json.ups w.ups.count
  json.people_talking w.comments.map(&:user_id).uniq.count
  json.comments w.comments do |c|
    json.id c.id
    json.text c.text
    json.created_at c.created_at
    json.updated_at c.updated_at
    json.website_id c.website_id
    json.user_id c.user_id
    json.ups c.ups.count
  end
end
