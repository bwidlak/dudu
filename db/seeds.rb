# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([
    {name: 'ślub', body: 'ślub'},
    {name: 'wesele', body: 'wesele'},
    {name: 'plener', body: 'plener'},
    {name: 'chrzest', body: 'chrzest'},
    {name: 'dzieci', body: 'dzieci'},
    {name: 'inne', body: 'inne'}
  ])

images = Image.create([
    {body: '', slideshow: true, status: true, url: 'https://farm6.staticflickr.com/5113/14224694159_5e266ab6e2_z_d.jpg', category: Category.find_by_name('ślub')},
    {body: '', slideshow: true, status: true, url: 'https://farm1.staticflickr.com/22/32282060_409cf78819_z_d.jpg', category: Category.find_by_name('ślub')},
    {body: '', slideshow: true, status: true, url: 'https://farm6.staticflickr.com/5113/14224694159_5e266ab6e2_z_d.jpg', category: Category.find_by_name('wesele')},
    {body: '', slideshow: true, status: true, url: 'https://farm1.staticflickr.com/22/32282060_409cf78819_z_d.jpg', category: Category.find_by_name('wesele')},
    {body: '', slideshow: true, status: true, url: 'https://farm6.staticflickr.com/5113/14224694159_5e266ab6e2_z_d.jpg', category: Category.find_by_name('chrzest')},
    {body: '', slideshow: true, status: true, url: 'https://farm1.staticflickr.com/22/32282060_409cf78819_z_d.jpg', category: Category.find_by_name('chrzest')}
  ])
