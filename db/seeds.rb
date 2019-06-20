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
p4= Product.find_or_create_by(name: 'Lamer', ingredients:'Algae (Seaweed) Extract, Mineral Oil, Petrolatum')
p5= Product.find_or_create_by(name: 'Fenty Beauty Foundation by Rihanna', ingredients:'Water, Magnesium Sulfate, Benzoic Acid ')
p6= Product.find_or_create_by(name: 'Benefit Theyre Real', ingredients:'Water, Butylene Glycol, Caprylyl ')
#vegan, sulfate, paraben free
p7= Product.find_or_create_by(name: 'Tarte Concealer', ingredients:'Maracuja Oil, Vitamin C, Vitamin E')
#paraben, vegan
p8= Product.find_or_create_by(name: 'Fresh Sugar Lemon Lip Balm', ingredients:'Apricot Oil, Seed Oil, Polybutene')
p9= Product.find_or_create_by(name: 'Fresh Soy Face Cleanser', ingredients:'Amino Acid, Alcohol, Water')
p10= Product.find_or_create_by(name: 'Clean Shower Fresh Deodorant', ingredients:'Glycerin, Fragrance, Propanediol')

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



 # def review_product
    #      ############################# USER INFO ###########################################
    #     puts ""
    #     puts ""
    #     puts ""
    #     puts "What is your username?".blue
    #     user_name = gets.chomp
    #     r = @user.id
    #     puts "You're user ID is #{r}".cyan
    #     puts ""
    #     puts ""
    #     puts "What is your user ID?".blue
    #     user_ID = gets.chomp
    #     puts ""
    #     puts ""
    #     #################################### PRODUCT INFO#####################################
    #     puts "What products are in your cart?".blue
    #     puts ""
    #     product_name = gets.chomp
    #     puts ""
    #     n = Product.find_by(name: product_name).id
    #     puts "The product name is #{n}".cyan
    #     puts ""
    #     puts ""
    #     puts ""
    #     puts "What is the ProductID?".blue
    #     puts ""
    #     product_ID = gets.chomp
    #     puts ""
    #     ################################### ADDITIONAL REVIEW INFO #############################
    #     puts "What is your Rating?".blue
    #     puts ""
    #     user_rating = gets.chomp

    #     puts ""
    #     puts "Add Content?"
    #     @review = Review.find_or_create_by(user_id: user_ID, product_id: product_ID, rating: user_rating, content: @user_content)
      
    #     ### THIS METHOD HELPS ME UPDATE REVIEW, IF I WANT

    #     # puts "Do you want to update your review?".blue
    #     #     response_to_q = gets.chomp
    #     #     if response_to_q == 'yes'
    #     # update_content_review(user_content)
    #     #     else 
    #     #         puts "Review Submitted!!!!!".cyan
    #     #     end