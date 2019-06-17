#Users (10)
# list of preferences
# vegan, cruelty-free, paraben-free, fragrance-free, alcohol free
matt = User.create(name: 'Matt', preferences: 'vegan, cruelty-free')
brooke = User.create(name: 'Brooke', preferences: 'vegan, paraben-free')
sophia = User.create(name: 'Sophia', preferences: 'paraben-free, alcohol-free, fragrance-free')
alicia = User.create(name: 'Alicia', preferences: 'cruelty-free, paraben-free, alcohol-free' )
angela = User.create(name: 'Angela', preferences: 'vegan')
kristin = User.create(name: 'Kristin', preferences: 'vegan, cruelty-free')
marcela = User.create(name: 'Marcela', preferences: 'cruelty-free, paraben-free')
cristiano = User.create(name: 'Cristiano', preferences: 'fragrance-free, alcohol-free')
dana = User.create(name: 'Dana', preferences: 'cruelty-free')
taylor = User.create(name: 'Taylor', preferences: 'vegan, cruelty-free')


#products (10) SKincare and makeup 

p1= Product.create(name: 'Laura Mercier Powder', ingredients:'Propylparaben, (Soybean) Oil, Methylparaben')
#this is vegan
p2= Product.create(name: 'Anastasia Bev Hills', ingredients:'Hydrogenated Soybean Oil, Zinc Stearate, Stearic Acid')
#this is paraben free
p3= Product.create(name: 'Tatcha Water Cream', ingredients:' Water, Belamcanda Chinensis Root Extract, Rosa Multiflora Fruit Extract')
#paraben free, frag free 
p4= Product.create(name: 'Lamer', ingredients:'Algae (Seaweed) Extract, Mineral Oil, Petrolatum')
p5= Product.create(name: 'Fenty Beauty Foundation by Rihanna', ingredients:'Water, Magnesium Sulfate, Benzoic Acid ')
p6= Product.create(name: 'Benefit Theyre Real', ingredients:'Water, Butylene Glycol, Caprylyl ')
#vegan, sulfate, paraben free
p7= Product.create(name: 'Tarte Concealer', ingredients:'Maracuja Oil, Vitamin C, Vitamin E')
#paraben, vegan
p8= Product.create(name: 'Fresh Sugar Lemon Lip Balm', ingredients:'Apricot Oil, Seed Oil, Polybutene')
p9= Product.create(name: 'Fresh Soy Face Cleanser', ingredients:'Amino Acid, Alcohol, Water')
p10= Product.create(name: 'Clean Shower Fresh Deodorant', ingredients:'Glycerin, Fragrance, Propanediol')


# reviews 

r1 = Review.create(user_id: matt, product_id: p1 , rating: 4, content:'Awesome, but messy')
r2 = Review.create(user_id: brooke, product_id: p2, rating: 5, content: 'Amazing brow pencil')
r3 = Review.create(user_id: sophia, product_id: p3, rating: 5, content: 'Magic')
r4 = Review.create(user_id: alicia, product_id: p4, rating: 3, content: 'Good, but expensive')
r5 = Review.create(user_id: angela, product_id: p5, rating: 2, content: 'It is drying')
r6 = Review.create(user_id: kristin, product_id: p6, rating: 3, content: 'It does the work of a drugstore mascara')
r7 = Review.create(user_id: marcela, product_id: p7, rating: 4, content: 'Nice concealer. Perfect for dry skin')
r8 = Review.create(user_id: cristiano, product_id: p8, rating: 2, content: 'Dries out my lips')
r9 = Review.create(user_id: dana, product_id: p9, rating: 2, content: 'It contains Alcohol. Not for me')
r10 = Review.create(user_id: taylor, product_id: p10, rating:3, content: 'Okay, but contains fragranceaccess')