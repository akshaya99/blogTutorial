# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Post.delete_all

Post.create(
  :title => 'Sample Blog Post 1',
  :content => 'Some sample post content! :)'
)
Post.create(
  :title => 'Lorem Ipsum',
  :content => 'dolor sit amet.'
)
Post.create(
  :title => 'And Some More Content',
  :content => 'This is is apparently'
)

