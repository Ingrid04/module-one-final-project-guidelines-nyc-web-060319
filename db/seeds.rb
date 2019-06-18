#Users (10)
# list of preferences
# vegan, cruelty-free, paraben-free, fragrance-free, alcohol free

puts "Creating Users..."

matt = User.find_or_create_by(name: 'Matt', preferences: 'vegan, cruelty-free')
brooke = User.find_or_create_by(name: 'Brooke', preferences: 'vegan, paraben-free')
sophia = User.find_or_create_by(name: 'Sophia', preferences: 'paraben-free, alcohol-free, fragrance-free')
alicia = User.find_or_create_by(name: 'Alicia', preferences: 'cruelty-free, paraben-free, alcohol-free' )
angela = User.find_or_create_by(name: 'Angela', preferences: 'vegan')
kristin = User.find_or_create_by(name: 'Kristin', preferences: 'vegan, cruelty-free')
marcela = User.find_or_create_by(name: 'Marcela', preferences: 'cruelty-free, paraben-free')
cristiano = User.find_or_create_by(name: 'Cristiano', preferences: 'fragrance-free, alcohol-free')
dana = User.find_or_create_by(name: 'Dana', preferences: 'cruelty-free')
taylor = User.find_or_create_by(name: 'Taylor', preferences: 'vegan, cruelty-free')

puts "Created Users"


#products (10) Skincare and makeup 

p1= Product.find_or_create_by(name: 'Laura Mercier Powder', ingredients:'Propylparaben, (Soybean) Oil, Methylparaben')
#this is vegan
p2= Product.find_or_create_by(name: 'Anastasia Bev Hills', ingredients:'Hydrogenated Soybean Oil, Zinc Stearate, Stearic Acid')
#this is paraben free
p3= Product.find_or_create_by(name: 'Tatcha Water Cream', ingredients:' Water, Belamcanda Chinensis Root Extract, Rosa Multiflora Fruit Extract')
#paraben free, frag free

r1 = Review.find_or_create_by(user_id: matt.id, product_id: p1.id , rating: 4, content:'Awesome, but messy')
r2 = Review.find_or_create_by(user_id: brooke.id, product_id: p2.id, rating: 5, content: 'Amazing brow pencil')
r3 = Review.find_or_create_by(user_id: sophia.id, product_id: p3.id, rating: 5, content: 'Magic')
r4 = Review.find_or_create_by(user_id: alicia.id, product_id: p4.id, rating: 3, content: 'Good, but expensive')
r5 = Review.find_or_create_by(user_id: angela.id, product_id: p5.id, rating: 2, content: 'It is drying')
r6 = Review.find_or_create_by(user_id: kristin.id, product_id: p6.id, rating: 3, content: 'It does the work of a drugstore mascara')
r7 = Review.find_or_create_by(user_id: marcela.id, product_id: p7.id, rating: 4, content: 'Nice concealer. Perfect for dry skin')
r8 = Review.find_or_create_by(user_id: cristiano.id, product_id: p8.id, rating: 2, content: 'Dries out my lips')
r9 = Review.find_or_create_by(user_id: dana.id, product_id: p9.id, rating: 2, content: 'It contains Alcohol. Not for me')
r10 = Review.find_or_create_by(user_id: taylor.id, product_id: p10.id, rating:3, content: 'Okay, but contains fragranceaccess')