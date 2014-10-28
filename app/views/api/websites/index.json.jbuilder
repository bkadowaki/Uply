json.array! @websites do |w|
    json.id w.id
    json.title w.title
    json.url w.url
    json.description w.description
    json.created_at w.created_at
    json.ups w.ups.count
    json.favicon w.favicon
    json.websiteScore w.website_score
    json.websiteCommentScore w.website_comment_score
end
