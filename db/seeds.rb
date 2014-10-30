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
    { name: 'All Sites' },
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

# if Rails.env.development?

    WebsiteCategory.destroy_all
    Company.destroy_all
    Website.destroy_all
    User.destroy_all
    Up.destroy_all
    Comment.destroy_all

    websites = Website.create([
        { 
            url: "http://realgm.com",
            company_id: 1
        },        
        { 
            url: "http://gilt.com",
            company_id: 2
        },        
        { 
            url: "http://espn.com",
            company_id: 3
        },        
        { 
            url: "http://webmd.com",
            company_id: 4
        },
        { 
            url: "http://newegg.com",
            company_id: 5
        },
        {
            url: "http://reddit.com",
            company_id: 6
        },        
        {
            url: "http://androidcentral.com",
            company_id: 7
        },        
        {
            url: "http://chacha.com",
            company_id: 8
        },        
        {
            url: "http://thechive.com",
            company_id: 9
        },        
        {
            url: "http://nbcsports.com",
            company_id: 10
        },        
        {
            url: "http://buzzfeed.com",
            company_id: 11
        },        
        {
            url: "http://urbandictionary.com",
            company_id: 12
        },        
        {
            url: "http://rollingstone.com",
            company_id: 1
        },        
        {
            url: "http://rottentomatoes.com",
            company_id: 1
        },        
        {
            url: "http://tmz.com",
            company_id: 1
        },        
        {
            url: "http://upworthy.com",
            company_id: 1
        },        
        {
            url: "http://bleacherreport.com",
            company_id: 1
        },        
        {
            url: "http://twitch.tv",
            company_id: 1
        },        
        {
            url: "http://photobucket.com",
            company_id: 1
        },        
        {
            url: "http://independent.co.uk",
            company_id: 1
        },        
        {
            url: "http://stackoverflow.com",
            company_id: 1
        },        
        {
            url: "http://quora.com",
            company_id: 1
        },        
        {
            url: "http://linkedin.com",
            company_id: 2
        },        
        {
            url: "http://kickstarter.com",
            company_id: 2
        },        
        {
            url: "http://macrumors.com",
            company_id: 2
        },        
        {
            url: "http://yelp.com",
            company_id: 2
        },
        {
            url: "http://metacafe.com",
            company_id: 2
        },
        {
            url: "http://pinterest.com",
            company_id: 2
        },
        {
            url: "http://wikipedia.com",
            company_id: 2
        },
        {
            url: "http://blogger.com",
            company_id: 3
        },
        {
            url: "http://about.com",
            company_id: 3
        },
        {
            url: "http://tradingview.com",
            company_id: 3
        },
        {
            url: "http://mlb.com",
            company_id: 3
        },
        {
            url: "http://examiner.com",
            company_id: 3
        },
        {
            url: "http://slickdeals.com",
            company_id: 3
        },
        {
            url: "http://tumblr.com",
            company_id: 3
        },
        {
            url: "http://carmax.com",
            company_id: 3
        }
        ]);

        Website.all.each do |w|
          w.favicon = w.scrape_favicon
          w.title = w.scrape_title
          w.description = w.scrape_description
          w.save!
        end

    WebsiteCategory.create([
        {
            category_id: 1,
            website_id: websites[0].id
        },
        {
            category_id: 17,
            website_id: websites[0].id
        },
        {
            category_id: 1,
            website_id: websites[1].id
        },
        {
            category_id: 18,
            website_id: websites[1].id
        },         
        {
            category_id: 7,
            website_id: websites[3].id
        },        
        {
            category_id: 18,
            website_id: websites[2].id
        },
        {
            category_id: 5,
            website_id: websites[4].id
        },        
        {
            category_id: 5,
            website_id: websites[6].id
        },
        {
            category_id: 12,
            website_id: websites[7].id
        },
        {
            category_id: 11,
            website_id: websites[8].id
        },
        {
            category_id: 11,
            website_id: websites[9].id
        },
        {
            category_id: 9,
            website_id: websites[10].id
        },
        {
            category_id: 12,
            website_id: websites[11].id
        },
        {
            category_id: 3,
            website_id: websites[12].id
        },
        {
            category_id: 11,
            website_id: websites[13].id
        },
        {
            category_id: 9,
            website_id: websites[14].id
        },
        {
            category_id: 10,
            website_id: websites[15].id
        },
        {
            category_id: 17,
            website_id: websites[16].id
        },
        {
            category_id: 6,
            website_id: websites[17].id
        },
        {
            category_id: 11,
            website_id: websites[18].id
        },
        {
            category_id: 10,
            website_id: websites[19].id
        },
        {
            category_id: 12,
            website_id: websites[20].id
        },
        {
            category_id: 12,
            website_id: websites[21].id
        },
        {
            category_id: 16,
            website_id: websites[22].id
        },
        {
            category_id: 16,
            website_id: websites[23].id
        },
        {
            category_id: 5,
            website_id: websites[24].id
        },
        {
            category_id: 16,
            website_id: websites[25].id
        }


        ]);
      
    Company.create([
        { 
            name: "Real GM",
            email: "real@gm.com",
            password: "password",
            password_confirmation: "password"
        },        
        { 
            name: "Gilt",
            email: "gilt@gilt.com",
            password: "password",
            password_confirmation: "password"
        },        
        { 
            name: "ESPN",
            email: "espn@espn.com",
            password: "password",
            password_confirmation: "password"
        },        
        { 
            name: "webmd",
            email: "webmd@webmd.com",
            password: "password",
            password_confirmation: "password"
        },
        { 
            name: "newegg",
            email: "new@egg.com",
            password: "password",
            password_confirmation: "password"
        },
        {
            name: "reddit",
            email: "red@dit.com",
            password: "password",
            password_confirmation: "password"
        },        
        {
            name: "androidcentral",
            email: "android@cental.com",
            password: "password",
            password_confirmation: "password"
        },        
        {
            name: "chacha",
            email: "cha@cha.com",
            password: "password",
            password_confirmation: "password"
        },        
        {
            name: "thechive",
            email: "the@chive.com",
            password: "password",
            password_confirmation: "password"
        },        
        {
            name: "nbcsports",
            email: "nbc@sports.com",
            password: "password",
            password_confirmation: "password"
        },        
        {
            name: "buzzfeed",
            email: "buzz@feed.com",
            password: "password",
            password_confirmation: "password"
        },        
        {
            name: "urbandictionary",
            email: "urban@dictionary.com",
            password: "password",
            password_confirmation: "password"
        },        
        {
            name: "rollingstone",
            email: "rollling@stone.com",
            password: "password",
            password_confirmation: "password"
        },        
        {
            name: "rottentomatoes",
            email: "rotten@tomatoes.com",
            password: "password",
            password_confirmation: "password"
        },        
        {
            name: "tmz",
            email: "t@mux.com",
            password: "password",
            password_confirmation: "password"
        },        
        {
            name: "upworthy",
            email: "ru@worthy.com",
            password: "password",
            password_confirmation: "password"
        },        
        {
            name: "bleacherreport",
            email: "andrew@wong.com",
            password: "password",
            password_confirmation: "password"
        },        
        {
            name: "twitch.tv",
            email: "ben@an.com",
            password: "password",
            password_confirmation: "password"
        },        
        {
            name: "photobucket",
            email: "photo@bucket.com",
            password: "password",
            password_confirmation: "password"
        }
    ]);

    users = User.create([
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
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Bob",
            last: "Loblaw",
            elite: true,
            email: "bob@loblaw.com",
            password: "password",
            password_confirmation: "password"
        },
        {
            first: "Lamar",
            last: "Odom",
            elite: true,
            email: "lamar@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Shaq",
            last: "Oneal",
            elite: true,
            email: "shaq@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Dante",
            last: "Culpepper",
            elite: true,
            email: "dante@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Smush",
            last: "Parker",
            elite: true,
            email: "smush@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Steve",
            last: "Nash",
            elite: true,
            email: "steve@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Vince",
            last: "Carter",
            elite: true,
            email: "vince@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Tracy",
            last: "McGrady",
            elite: true,
            email: "tracy@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Nick",
            last: "Van Exel",
            elite: true,
            email: "nick@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Brian",
            last: "Shaw",
            elite: true,
            email: "brian@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Charles",
            last: "Barkley",
            elite: true,
            email: "charles@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Allen",
            last: "Iverson",
            elite: true,
            email: "allen@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Reggie",
            last: "Miller",
            elite: true,
            email: "reggie@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Michael",
            last: "Jordan",
            elite: true,
            email: "michael@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Magic",
            last: "Johnson",
            elite: true,
            email: "magic@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Kevin",
            last: "Durant",
            elite: true,
            email: "kevin@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Chris",
            last: "Bosh",
            elite: true,
            email: "chris@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Lebron",
            last: "James",
            elite: true,
            email: "lebron@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        },
        {
            first: "Kendrick",
            last: "Lamar",
            elite: true,
            email: "kendrick@beast.com",
            password: "11111111",
            password_confirmation: "11111111"
        }
        ]); 

    Up.create([
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
            upable_id: 1,
            upable_type: "Website",
            user_id: 3
        },
        {
            upable_id: 1,
            upable_type: "Website",
            user_id: 4
        },
        {
            upable_id: 1,
            upable_type: "Website",
            user_id: 5
        },
        {
            upable_id: 1,
            upable_type: "Website",
            user_id: 6
        },
        {
            upable_id: 1,
            upable_type: "Website",
            user_id: 7
        },
        {
            upable_id: 1,
            upable_type: "Website",
            user_id: 8
        },
        {
            upable_id: 1,
            upable_type: "Website",
            user_id: 9
        },
        {
            upable_id: 1,
            upable_type: "Website",
            user_id: 10
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
            upable_id: 2,
            upable_type: "Website",
            user_id: 3
        },
        {
            upable_id: 2,
            upable_type: "Website",
            user_id: 4
        },
        {
            upable_id: 2,
            upable_type: "Website",
            user_id: 5
        },
        {
            upable_id: 2,
            upable_type: "Website",
            user_id: 6
        },
        {
            upable_id: 2,
            upable_type: "Website",
            user_id: 7
        },
        {
            upable_id: 2,
            upable_type: "Website",
            user_id: 1
        },
        {
            upable_id: 3,
            upable_type: "Website",
            user_id: 2
        },
        {
            upable_id: 3,
            upable_type: "Website",
            user_id: 3
        },
        {
            upable_id: 3,
            upable_type: "Website",
            user_id: 4
        },
        {
            upable_id: 3,
            upable_type: "Website",
            user_id: 5
        },
        {
            upable_id: 3,
            upable_type: "Website",
            user_id: 6
        },
        {
            upable_id: 3,
            upable_type: "Website",
            user_id: 7
        },
        {
            upable_id: 4,
            upable_type: "Website",
            user_id: 1
        },
        {
            upable_id: 4,
            upable_type: "Website",
            user_id: 2
        },
        {
            upable_id: 4,
            upable_type: "Website",
            user_id: 3
        },
        {
            upable_id: 4,
            upable_type: "Website",
            user_id: 4
        },
        {
            upable_id: 4,
            upable_type: "Website",
            user_id: 5
        },
        {
            upable_id: 4,
            upable_type: "Website",
            user_id: 6
        },
        {
            upable_id: 5,
            upable_type: "Website",
            user_id: 1
        },
        {
            upable_id: 5,
            upable_type: "Website",
            user_id: 2
        },
        {
            upable_id: 6,
            upable_type: "Website",
            user_id: 1
        },
        {
            upable_id: 6,
            upable_type: "Website",
            user_id: 2
        },
        {
            upable_id: 6,
            upable_type: "Website",
            user_id: 3
        },
        {
            upable_id: 6,
            upable_type: "Website",
            user_id: 4
        },
        {
            upable_id: 6,
            upable_type: "Website",
            user_id: 5
        },
        {
            upable_id: 7,
            upable_type: "Website",
            user_id: 1
        },
        {
            upable_id: 7,
            upable_type: "Website",
            user_id: 2
        },
        {
            upable_id: 7,
            upable_type: "Website",
            user_id: 3
        },
        {
            upable_id: 7,
            upable_type: "Website",
            user_id: 4
        },
        {
            upable_id: 7,
            upable_type: "Website",
            user_id: 5
        },
        {
            upable_id: 8,
            upable_type: "Website",
            user_id: 1
        },
        {
            upable_id: 8,
            upable_type: "Website",
            user_id: 2
        },
        {
            upable_id: 8,
            upable_type: "Website",
            user_id: 3
        },
        {
            upable_id: 8,
            upable_type: "Website",
            user_id: 4
        },
        {
            upable_id: 8,
            upable_type: "Website",
            user_id: 5
        },
        {
            upable_id: 8,
            upable_type: "Website",
            user_id: 6
        },
        {
            upable_id: 8,
            upable_type: "Website",
            user_id: 7
        },
        {
            upable_id: 9,
            upable_type: "Website",
            user_id: 1
        },
        {
            upable_id: 9,
            upable_type: "Website",
            user_id: 2
        },
        {
            upable_id: 9,
            upable_type: "Website",
            user_id: 3
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
        {
            upable_id: 5,
            upable_type: "Comment",
            user_id: 1
        },
        {
            upable_id: 6,
            upable_type: "Comment",
            user_id: 1
        },
        {
            upable_id: 6,
            upable_type: "Comment",
            user_id: 1
        },
        {
            upable_id: 7,
            upable_type: "Comment",
            user_id: 1
        },
        {
            upable_id: 7,
            upable_type: "Comment",
            user_id: 1
        },
        {
            upable_id: 7,
            upable_type: "Comment",
            user_id: 1
        },
        ]);

    Comment.create([
        {
            text: "RealGM gets the most important sports news without all the in-your-face ads like ESPN.",
            website_id: 1,
            user_id: 1
        },
        {
            text: "I live on this site.",
            website_id: 1,
            user_id: 1
        },
        {
            text: "Gilt has the cutest dresses!",
            website_id: 2,
            user_id: 1
        },
        {
            text: "I definitely use the site, but their customer service can use some improvement.",
            website_id: 2,
            user_id: 1
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
