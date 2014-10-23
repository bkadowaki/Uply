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

Website.create([
    { 
        title: "RealGM",
        url: "http://realgm.com",
        description: "Badass sports site", 
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
        password: "boblaw",
        password_confirmation: "boblaw"
    }
    ]); 

Up.destroy_all

Up.create([
    {
        website_id: 1,
        user_id: 1
    },
    {
        website_id: 1,
        user_id: 2
    },
    {
        website_id: 1,
        user_id: 3
    },
    {
        website_id: 2,
        user_id: 1
    },
    {
        website_id: 2,
        user_id: 2
    },
    {
        website_id: 2,
        user_id: 3
    }
    ]);

Comment.destroy_all

Comment.create([
    {
        text: "alsd ialsdlifdjaalsidfj laijsdlifjlaisjdlfij lsadijf laijsdlf jsldjfl ajsldijf lsaijf lasjdl",
        website_id: 1,
        user_id: 1
    },
    {
        text: "alsd ialsdlifdjaalsidfj laijsdlifjlaisjdlfij lsadijf laijsdlf jsldjfl ajsldijf lsaijf lasjdl",
        website_id: 1,
        user_id: 2
    },
    {
        text: "alsd ialsdlifdjaalsidfj laijsdlifjlaisjdlfij lsadijf laijsdlf jsldjfl ajsldijf lsaijf lasjdl",
        website_id: 2,
        user_id: 3
    },
    {
        text: "alsd ialsdlifdjaalsidfj laijsdlifjlaisjdlfij lsadijf laijsdlf jsldjfl ajsldijf lsaijf lasjdl",
        website_id: 2,
        user_id: 2
    },
    {
        text: "alsd ialsdlifdjaalsidfj laijsdlifjlaisjdlfij lsadijf laijsdlf jsldjfl ajsldijf lsaijf lasjdl",
        website_id: 2,
        user_id: 1
    },
    ]);
