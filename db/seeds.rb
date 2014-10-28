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

if Rails.env.development?

    WebsiteCategory.destroy_all
    Website.destroy_all
    User.destroy_all
    Up.destroy_all
    Comment.destroy_all

    Website.create([
        { 
            url: "http://realgm.com",
        },        
        { 
            url: "http://gilt.com",
        },        
        { 
            url: "http://espn.com",
        },        
        { 
            url: "http://webmd.com",
        },
        { 
            url: "http://newegg.com",
        },
        {
            url: "http://reddit.com",
        },        
        {
            url: "http://androidcentral.com",
        },        
        {
            url: "http://chacha.com",
        },        
        {
            url: "http://thechive.com",
        },        
        {
            url: "http://nbcsports.com",
        },        
        {
            url: "http://buzzfeed.com",
        },        
        {
            url: "http://urbandictionary.com",
        },        
        {
            url: "http://rollingstone.com",
        },        
        {
            url: "http://rottentomatoes.com",
        },        
        {
            url: "http://tmz.com",
        },        
        {
            url: "http://upworthy.com",
        },        
        {
            url: "http://bleacherreport.com",
        },        
        {
            url: "http://twitch.tv",
        },        
        {
            url: "http://photobucket.com",
        },        
        {
            url: "http://independent.co.uk",
        },        
        {
            url: "http://stackoverflow.com",
        },        
        {
            url: "http://quora.com",
        },        
        {
            url: "http://linkedin.com",
        },        
        {
            url: "http://kickstarter.com",
        },        
        {
            url: "http://macrumors.com",
        },        
        {
            url: "http://yelp.com",
        },
        {
            url: "http://metacafe.com"
        },
        {
            url: "http://pinterest.com"
        },
        {
            url: "http://wikipedia.com"
        },
        {
            url: "http://blogger.com"
        },
        {
            url: "http://about.com"
        },
        {
            url: "http://craigslist.org"
        },
        {
            url: "http://mlb.com"
        },
        {
            url: "http://examiner.com"
        },
        {
            url: "http://slickdeals.com"
        },
        {
            url: "http://tumblr.com"
        },
        # {
        #     url: "http://sbnation.com"
        # },
        # {
        #     url: "http://usmagazine.com"
        # },
        # {
        #     url: "http://foxnews.com"
        # },
        # {
        #     url: "http://drugs.com"
        # },
        # {
        #     url: "http://theblaze.com"
        # },
        # {
        #     url: "http://legacy.com"
        # },
        # {
        #     url: "http://babycenter.com"
        # },
        # {
        #     url: "http://goodreads.com"
        # },
        # {
        #     url: "http://yellowpages.com"
        # },
        # {
        #     url: "http://imdb.com"
        # },
        # {
        #     url: "http://uproxx.com"
        # },
        # {
        #     url: "http://nytimes.com"
        # },
        # {
        #     url: "http://ehow.com"
        # },
        # {
        #     url: "http://wsj.com"
        # },
        # {
        #     url: "http://eonline.com"
        # },
        # {
        #     url: "http://instagram.com"
        # },
        # {
        #     url: "http://merriam-webster.com"
        # },
        # {
        #     url: "http://livingsocial.com"
        # },
        # {
        #     url: "http://gawker.com"
        # },
        # {
        #     url: "http://flickr.com"
        # },
        # {
        #     url: "http://booking.com"
        # },
        # {
        #     url: "http://gizmodo.com"
        # },
        # {
        #     url: "http://lifehacker.com"
        # },
        # {
        #     url: "http://cbssports.com"
        # },
        # {
        #     url: "http://tripadvisor.com"
        # },
        # {
        #     url: "http://deadspin.com"
        # },
        # {
        #     url: "http://fandango.com"
        # },
        # {
        #     url: "http://wetpaint.com"
        # },
        # {
        #     url: "http://drudgereport.com"
        # },
        # {
        #     url: "http://local.com"
        # },
        # {
        #     url: "http://etsy.com"
        # },
        # {
        #     url: "http://ranker.com"
        # },
        # {
        #     url: "http://topix.com"
        # },
        # {
        #     url: "http://nfl.com"
        # },
        # {
        #     url: "http://radaronline.com"
        # },
        # {
        #     url: "http://theguardian.com"
        # },
        # {
        #     url: "http://suggest.com"
        # },
        # {
        #     url: "http://forbes.com"
        # },
        # {
        #     url: "http://myspace.com"
        # },
        # {
        #     url: "http://dailycooking.com"
        # },
        # {
        #     url: "http://thekitchn.com"
        # },
        # {
        #     url: "http://popsugar.com"
        # },
        # {
        #     url: "http://fixya.com"
        # },
        # {
        #     url: "http://classmates.com"
        # },
        # {
        #     url: "http://foodnetwork.com"
        # },
        # {
        #     url: "http://simplyhired.com"
        # },
        # {
        #     url: "http://christianpost.com"
        # },
        # {
        #     url: "http://fool.com"
        # },
        # {
        #     url: "http://choicehotels.com"
        # },
        # {
        #     url: "http://dailydot.com"
        # },
        # {
        #     url: "http://expedia.com"
        # },
        # {
        #     url: "http://abcnews.com"
        # },
        # {
        #     url: "http://thinkprogress.org"
        # },
        # {
        #     url: "http://mentalfloss.com"
        # },
        # {
        #     url: "http://theweek.com"
        # },
        # {
        #     url: "http://collegehumor.com"
        # },
        # {
        #     url: "http://bossip.com"
        # },
        # {
        #     url: "http://britannica.com"
        # },
        # {
        #     url: "http://bloomberg.com"
        # },
        # {
        #     url: "http://smosh.com"
        # },
        # {
        #     url: "http://allrecipes.com"
        # },
        # {
        #     url: "http://nhl.com"
        # },
        # {
        #     url: "http://wikihow.com"
        # },
        # {
        #     url: "http://dummies.com"
        # },
        # {
        #     url: "http://seattletimes.com"
        # },
        # {
        #     url: "http://peoplefinders.com"
        # },
        # {
        #     url: "http://startribune.com"
        # },
        {
            url: "http://carmax.com"
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
            category_id: 7,
            website_id: 4
        },        
        {
            category_id: 18,
            website_id: 3
        },
        {
            category_id: 5,
            website_id: 5
        },        
        {
            category_id: 5,
            website_id: 7
        },
        {
            category_id: 12,
            website_id: 8
        },
        {
            category_id: 11,
            website_id: 9
        },
        {
            category_id: 11,
            website_id: 10
        },
        {
            category_id: 9,
            website_id: 11
        },
        {
            category_id: 12,
            website_id: 12
        },
        {
            category_id: 3,
            website_id: 13
        },
        {
            category_id: 11,
            website_id: 14
        },
        {
            category_id: 9,
            website_id: 15
        },
        {
            category_id: 10,
            website_id: 16
        },
        {
            category_id: 17,
            website_id: 17
        },
        {
            category_id: 6,
            website_id: 18
        },
        {
            category_id: 11,
            website_id: 19
        },
        {
            category_id: 10,
            website_id: 20
        },
        {
            category_id: 12,
            website_id: 21
        },
        {
            category_id: 12,
            website_id: 22
        },
        {
            category_id: 16,
            website_id: 23
        },
        {
            category_id: 16,
            website_id: 24
        },
        {
            category_id: 5,
            website_id: 25
        },
        {
            category_id: 16,
            website_id: 26
        }


        ]);

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
