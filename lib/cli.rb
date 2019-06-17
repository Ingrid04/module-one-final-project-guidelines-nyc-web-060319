class CLI
 
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
            user = User.find_or_create_by(name: user_name, preferences: preferences)
            return view_products
        end
        
        
    end

    def view_products
        products = Product.all
        return products

    end
    
end