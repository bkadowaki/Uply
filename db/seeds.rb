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

Website.destroy_all

website = Website.create([
    { 
        title: "RealGM",
        url: "http://realgm.com",
        description: "Badass sports site" 
    },
    {
        title: "Reddit",
        url: "http://reddit.com",
        description: "Best site ever"
    }
    ]);