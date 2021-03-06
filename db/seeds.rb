# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

Post.destroy_all

Comment.destroy_all

users = [{
    name: "Francisco",
    email: "Francisco.Andaur@icloud.com",
    password: "asdf",
    password_confirmation: "asdf",
},{
    name: 'Cierra',
    email: "Cierra@cierra.com",
    password: "asdf",
    password_confirmation: "asdf",
}]

users.each do |user|
    User.create(name: user[:name], email: user[:email], password: user[:password], password_confirmation: user[:password_confirmation])
end

p "seeding posts"
Post1 = Post.create(content: "Today I dreamt of a dark tunnel, Monica Belucci was there.  We were having coffee'", user_id: User.all.sample.id)
Post2 = Post.create(content: "I dreamed I was the captain of a ship, we all wore red beanies, and the ocean was coffee", user_id: User.all.sample.id )
Post3 = Post.create(content: "I was doing yoga in the park and it began to rain,  the rain was not rain though it was marshmallows.... I made Marshmallow angels.", user_id: User.all.sample.id )
Post4 = Post.create(content: "I was tiny, the size of an ant.  Living inside an avocado.", user_id: User.all.sample.id )

p "seeded Posts"


a = Comment.create(content: "oh wow", user_id: User.all.sample.id, post_id: Post.all.sample.id)
b = Comment.create(content: "oh nice", user_id: User.all.sample.id, post_id: Post.all.sample.id)
c = Comment.create(content: "oh dats cool", user_id: User.all.sample.id, post_id: Post.all.sample.id )
d = Comment.create(content: "das scary", user_id: User.all.sample.id, post_id: Post.all.sample.id )
e = Comment.create(content: "das hot", user_id: User.all.sample.id, post_id: Post.all.sample.id )
f = Comment.create(content: "cool", user_id: User.all.sample.id, post_id: Post.all.sample.id )