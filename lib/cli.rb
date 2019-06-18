# require 'pry'

class CLI

    @user_content = "" #To make it easier to access from other methods
 
    attr_accessor :user, :product

    

    #CREATE profile method is DONE!
    def sign_up?
        puts "Sign Up Here".cyan
        response = gets.chomp.downcase
        if response == 'yes'
            puts "Fill in a username and password".cyan
            puts "Username:  ".cyan
            user_name = gets.chomp
            puts "Password: ".cyan
            password = gets.chomp 
            # password = User.find_or_create_by(password: password)
            puts "Great! Now, let's list your ingredient preferences:".cyan
            puts "
            1. vegan \n
            2. cruelty-free \n
            3. paraben-free \n
            4. fragrance-free \n
            5. alcohol free \n"
            preferences = gets.chomp
            puts ""
            @user = User.find_or_create_by(name: user_name, preferences: preferences)
        #    view_products
        end
    end


     ########################################################################################

     def menu
        puts "Menu:" #What would you like to do?
        #2.update_review
        puts "1. Update Review"
        #3.delete_product
        puts "2. Delete Product"
        puts ""
        puts ""
        puts "Which option would you like?"
        option = gets.chomp 
        if option == '1'
           #COnditional to update review
            puts "Do you want to update your review?".blue
            response_to_q = gets.chomp
            if response_to_q == 'yes'
              update_content_review(@user_content)
            else 
                puts "Go back to menu ".cyan
            end
        elsif option == '2'
            # puts delete_product_from_cart(product_name)
        else 
            puts "Please select an option!"
        end
   
        #@user_content = gets.chomp 
       # need to set @user_content = to an actual value or else it will persist as nil 
    end
    
    #### THIS IS A [READ METHOD]

    def view_products 
        puts "MARKET PLACE".red 
        puts ""
        products = Product.all.map do |product|
         product.name
        end 
       puts  products.uniq
    end
    ########################################################################################
    def select_products
        puts""
        puts ""
        puts "Select your items:"
        product_name = gets.chomp 
        # product= Product.find_or_create_by(name: product_name)
    end

    ########################################################################################

    def review_product
         ############################# USER INFO ###########################################
        puts ""
        puts ""
        puts ""
        puts "What is your username?".blue
        user_name = gets.chomp
        r = @user.id
        puts "You're user ID is #{r}".cyan
        puts ""
        puts ""
        puts "What is your user ID?".blue
        user_ID = gets.chomp
        puts ""
        puts ""
        #################################### PRODUCT INFO#####################################
        puts "What products are in your cart?".blue
        puts ""
        product_name = gets.chomp
        puts ""
        n = Product.find_by(name: product_name).id
        puts "The product name is #{n}".cyan
        puts ""
        puts ""
        puts ""
        puts "What is the ProductID?".blue
        puts ""
        product_ID = gets.chomp
        puts ""
        ################################### ADDITIONAL REVIEW INFO #############################
        puts "What is your Rating?".blue
        puts ""
        user_rating = gets.chomp

        puts ""
        puts "Add Content?"
        @user_content = gets.chomp
        review = Review.find_or_create_by(user_id: user_ID, product_id: product_ID, rating: user_rating, content: @user_content)
      
        ### THIS METHOD HELPS ME UPDATE REVIEW, IF I WANT

        # puts "Do you want to update your review?".blue
        #     response_to_q = gets.chomp
        #     if response_to_q == 'yes'
        # update_content_review(user_content)
        #     else 
        #         puts "Review Submitted!!!!!".cyan
        #     end

        puts "I changed my mind. I want to delete an item from my cart?".blue
        # product_name = gets.chomp
        delete = gets.chomp
         if delete == 'yes'
            delete_product_from_cart(product_name)
         else
            puts "I'm ready to pay".cyan   
        end
    end

    ###################################################


    def update_content_review(user_content)
        review = Review.find_by(content: user_content)
        binding.pry
        puts "New Update: ".blue
        content_new = gets.chomp
        review.update(content: content_new)
      
    end


    #DELETE METHOD

    def delete_product_from_cart(product_name)
        product = Product.find_by(name: product_name)
        product.destroy  
    end
    
    
end