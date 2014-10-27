# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all

Category.create(
  [
    { name: 'Uncategorized' },
    { name: 'Adult' },
    { name: 'Arts' },
    { name: 'Business' },
    { name: 'Computers' },
    { name: 'Games' },
    { name: 'Health' },
    { name: 'Home' },
    { name: 'Kids and Teens' },
    { name: 'News' },
    { name: 'Recreation' },
    { name: 'Reference' },
    { name: 'Regional' },
    { name: 'Science' },
    { name: 'Shopping' },
    { name: 'Society' },
    { name: 'Sports' },
    { name: 'World' }
  ]);

if Rails.env.development?

    Website.destroy_all

    Website.create([
        { 
            title: "RealGM",
            url: "http://realgm.com",
            description: "Badass sports site"
        },        
        { 
            title: "Gilt",
            url: "http://gilt.com",
            description: "Shopping for female hipsters"
        },        
        { 
            title: "ESPN",
            url: "http://espn.com",
            description: "The Wall St Journal of sports"
        },        
        { 
            title: "Webmd",
            url: "http://webmd.com",
            description: "Online self-diagnosis"
        },
        { 
            title: "Newegg",
            url: "http://newegg.com",
            description: "Online retailer for electronic goods"
        },
        {
            title: "Reddit",
            url: "http://reddit.com",
            description: "Best site ever"
        }
        ]);

    WebsiteCategory.destroy_all

    WebsiteCategory.create([
        {
            category_id: 1,
            website_id: 1
        },
        {
            category_id: 17,
            website_id: 1
        },
        {
            category_id: 1,
            website_id: 2
        },
        {
            category_id: 18,
            website_id: 2
        },        
        {
            category_id: 17,
            website_id: 3
        }

        ]);

    User.destroy_all

    User.create([
        {
            first: "Cool",
            last: "Guy",
            elite: true,
            email: "cool@beans.com",
            password: "coolbeans",
            password_confirmation: "coolbeans"
        },
        {
            first: "Kobe",
            last: "Bryant",
            elite: true,
            email: "Kobe@beast.com",
            password: "idunkonyou",
            password_confirmation: "idunkonyou"
        },
        {
            first: "Bob",
            last: "Loblaw",
            elite: true,
            email: "bob@loblaw.com",
            password: "password",
            password_confirmation: "password"
        }
        ]); 

    Up.destroy_all

    Up.create([
        {
            upable_id: 1,
            upable_type: "Website",
            user_id: 1
        },
        {
            upable_id: 1,
            upable_type: "Website",
            user_id: 1
        },
        {
            upable_id: 1,
            upable_type: "Website",
            user_id: 2
        },
        {
            upable_id: 2,
            upable_type: "Website",
            user_id: 1
        },
        {
            upable_id: 2,
            upable_type: "Website",
            user_id: 2
        },
        {
            upable_id: 1,
            upable_type: "Comment",
            user_id: 1
        },
        {
            upable_id: 2,
            upable_type: "Comment",
            user_id: 1
        },
        {
            upable_id: 3,
            upable_type: "Comment",
            user_id: 1
        },
        {
            upable_id: 4,
            upable_type: "Comment",
            user_id: 1
        },
        {
            upable_id: 5,
            upable_type: "Comment",
            user_id: 1
        },
        ]);

    Comment.destroy_all

    Comment.create([
        {
            text: "RealGM gets the most important sports news without all the in-your-face ads like ESPN.",
            website_id: 1,
            user_id: 1
        },
        {
            text: "I live on this site.",
            website_id: 1,
            user_id: 2
        },
        {
            text: "Gilt has the cutest dresses!",
            website_id: 2,
            user_id: 3
        },
        {
            text: "I definitely use the site, but their customer service can use some improvement.",
            website_id: 2,
            user_id: 2
        },
        {
            text: "Great designer brand items at a discounted price. Everything is good quality, only downside is you can't try anything on.",
            website_id: 2,
            user_id: 1
        },        
        {
            text: "Reddit is my internet home. I consume all my news and entertainment here, AND the comments are hilariously witty--unlike YouTube comments which are just 1960's-style racist.",
            website_id: 6,
            user_id: 1
        },
        ]);
end
