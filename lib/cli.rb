require "pry"

class CLI
  #   @user_content = "" #To make it easier to access from other methods
  @review = ""
  @users = ""

  attr_accessor :user, :product, :info3, :review, :id

  def sign_up?
    puts ""
    puts ""
    puts "WELCOME TO INGRID AND SOPHIA'S BEAUTY REVIEW SITE".yellow
    puts ""
    prompt = TTY::Prompt.new
    response = prompt.select("Sign Up Here?".blue) do |menu_items|
      menu_items.choice "Yes", "yes"
      menu_items.choice "No", "no"
    end
    if response == "yes"
      puts "Fill in a username and password".blue
      puts ""
      puts "Username:  ".blue
      user_name = gets.chomp
      @@required_user = user_name
      puts ""
      puts "Password: ".blue
      password = gets.chomp
      puts ""
#       puts "Great! Now, let's list your ingredient preferences:".blue
#       puts "
#             1. vegan \n
#             2. cruelty-free \n
#             3. paraben-free \n
#             4. fragrance-free \n
#             5. alcohol free \n"
#       puts ""
#       puts "My preference is...".yellow
#       preferences = gets.chomp


      prompt = TTY::Prompt.new
      preferences = prompt.select("Great! Now, let's list your ingredient preferences:".blue) do |menu_items|
        menu_items.choice "1. Vegan", "Vegan"
        menu_items.choice "2. Cruelty-Free", "Cruelty-Free"
        menu_items.choice "3. Paraben-Free", "Paraben-Free"
        menu_items.choice "4. Fragrance-Free", "Fragrance-Free"
        menu_items.choice "5. Alcohol-Free", "Alcohol-Free"
      end
      #   puts "
      #         1. vegan \n
      #         2. cruelty-free \n
      #         3. paraben-free \n
      #         4. fragrance-free \n
      #         5. alcohol free \n"
      #   puts ""
      puts "My preference is...#{preferences}!".yellow

      puts ""
      @user = User.find_or_create_by(name: user_name, preferences: preferences)
    end
  end

  ########################################################################################

  def menu

    puts ""
#     puts ""
#     puts "Menu:".blue
#     puts "1. Update Review"
#     puts "2. Delete Review"
#     puts "3. I am done!"
#     puts ""
#     puts ""
#     puts "Which option would you like?".blue
#     option = gets.chomp

    puts "\nMenu:\n\n".blue
    prompt = TTY::Prompt.new
    option = prompt.select("Which option would you like?".blue) do |menu_items|
      menu_items.choice "1. Update Review", "1"
      menu_items.choice "2. Delete Review", "2"
      menu_items.choice "3. I am done!", "3"
    end
    puts "\n\n"

    if option == "1"
      puts "Do you want to update your review?".blue
      response_to_q = gets.chomp
      if response_to_q == "yes"
        update_review
      else
        puts "Go back to menu ".blue
      end
    elsif option == "2"
      delete_review
    else
      puts "Thank you for submitting your review!".blue
    end
  end

  #### THIS IS A [READ METHOD]

  def view_products

#     puts ""
#     puts "MARKET PLACE".red
#     puts ""
#     products = Product.all.map do |product|
#       product.name

    prompt = TTY::Prompt.new
    product = prompt.select("MARKET PLACE".red) do |menu_items|
      Product.all.each_with_index do |menu_item, index|
        menu_items.choice "#{index + 1}. #{menu_item.name}", menu_item.name
      end

    end
    @product = product
    return product
    # puts ""
    # products = Product.all.map do |product|
    #   product.name
    # end
    # puts products.uniq
  end

  ########################################################################################
  def select_products(product)
    puts ""
    puts ""

    puts "Select your items:".blue
    product_name = gets.chomp

    puts "Items selected: #{product}".yellow

  end

  ###################################################### ONEEEEEE##################################

  def review_of_product
    get_user_info
    info = get_product_info
    info2 = rating_review
    info3 = content_review
    @review = Review.find_or_create_by(user_id: @user.id, product_id: info, rating: info2, content: info3)
  end

  def get_user_info
    puts ""
    puts ""
    puts ""
    puts "What is your username?".blue #?
    @user_name = gets.chomp
    r = @user.id
    puts "You're user ID is #{r}".cyan
    puts ""
    puts ""
    puts "What is your user ID?".blue
    user_ID = gets.chomp
    puts ""
    puts ""
  end

  def get_product_info
    puts "What products are in your cart?".blue
    puts ""
    product_name = @product
    puts "Your cart has : #{@product}"
    puts ""
    n = Product.find_by(name: product_name).id
    puts "The product ID is #{n}".cyan
    puts ""
    puts ""
    puts ""
    puts "What is the ProductID?".blue
    puts ""
    product_ID = gets.chomp
    return product_ID
    puts ""
  end

  def rating_review
    puts "What is your Rating?".blue
    puts ""
    user_rating = gets.chomp
    return user_rating
  end

  def content_review
    puts ""
    puts "Add Content?".blue
    content = gets.chomp
    return content
  end

  ##########################################################ALLL IN ONEEEEEE############################################

  ########################################################TWOOOOOOOOOOOOOOO#############################

  def update_review
    puts ""
    puts find_content_review
    update_most_recent
  end

  def reviews
    Review.all.select do |review|
      review.user == @user
    end
  end

  # def reviews
  #  view =   Review.find_by(user_id: user.id)
  #  # binding.pry
  # end

  def find_content_review
    puts "Here are all of your reviews".yellow
    puts ""
    reviews.map do |review|
      review.id.to_s + " " + review.content
    end
  end

  ############################   UPDATE METHOD #########################################

  def update_most_recent
    puts ""
    puts "What review do you want to update?".blue #statement for making sure which review to update
    chosen_review = gets.chomp #shows the user's reviews
    puts ""
    review_content_change = Review.find(chosen_review).content #shows the review selected to update
    puts "Is this the review you want to change?".blue #to make sure that is the review to update
    puts review_content_change.yellow #prints the review to udpate
    approve_review_change = gets.chomp
    puts ""
    puts ""
    if approve_review_change == "yes"
      puts "Please change review content".blue
      puts ""
      change_review = gets.chomp
      puts ""
      puts "Is this okay?".blue
      puts change_review.yellow
      puts ""
      response_to_change_review = gets.chomp
      if response_to_change_review == "yes"
        Review.find_by(id: chosen_review).update(content: change_review)

        puts "Thank you for your update!".blue
      else
        puts "Please finish updating...".blue
      end
    else
      puts "Ok, please select the correct review you want to change".blue
    end
    puts ""
  end

  ########################################################TWOOOOOOOOOOOOOOO#############################

  def delete_review
    puts find_content_review
    puts ""
    puts "I want to delete this review: ".blue
    delete_this = gets.chomp
    puts ""
    puts "Are you sure you want to delete this #{delete_this}?".blue
    approve_delete_review = gets.chomp
    if approve_delete_review == "yes"
      puts "Review Deleted".blue
        Review.find_by(id: delete_this).destroy
    else
      puts "Please finish selecting your review to delete".blue
    end
  end



  #next step, show user all of his or her past reviews

  #   def all_reviews
  #     Review.all.select do |review|

  #   end

end #end of CLI class
