json.id @comment.id
json.text @comment.text
json.ups @comment.ups.count
json.commentScore @comment.comment_score
json.createdAt @comment.created_at
json.user @comment.user.first
json.websiteId @comment.website.id
json.websiteTitle @comment.website.title

