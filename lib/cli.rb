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
    puts "Sign Up Here?".blue
    response = gets.chomp.downcase
    if response == "yes"
      puts "Fill in a username and password".blue
      puts ""
      puts "Username:  ".blue
      user_name = gets.chomp
      @@required_user = user_name
      puts ""
      puts "Password: ".blue
      password = gets.chomp
      puts "Great! Now, let's list your ingredient preferences:".blue
      puts "
            1. vegan \n
            2. cruelty-free \n
            3. paraben-free \n
            4. fragrance-free \n
            5. alcohol free \n"
      puts ""
      puts "My preference is...".yellow
      preferences = gets.chomp
      puts ""
      puts "Here are your preferences: #{preferences}!".yellow
      @user = User.find_or_create_by(name: user_name, preferences: preferences)
    end
  end

  ########################################################################################

  def menu
    puts ""
    puts ""
    puts "Menu:"
    puts "1. Update Review"
    puts "2. Delete Review"
    puts "3. I am done!"
    puts ""
    puts ""
    puts "Which option would you like?".blue
    option = gets.chomp
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
    puts "MARKET PLACE".red
    puts ""
    products = Product.all.map do |product|
      product.name
    end
    puts products.uniq
  end

  ########################################################################################
  def select_products
    puts ""
    puts ""
    puts "Select your items:"
    product_name = gets.chomp
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
    puts "What is your username?".blue
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
    product_name = gets.chomp
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
      change_review = gets.chomp #write the changes
      puts ""
      puts "Is this okay?".blue #making sure about the changes
      puts change_review.yellow #prints the changes (new review)
      puts ""
      response_to_change_review = gets.chomp
      if response_to_change_review == "yes"
        review_content_change_2 = Review.find(chosen_review) #after yes, prints the new review
        review_content_change_2.update(content: change_review) # saves the changes (review updated)
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
    deleted_review = Review.find(delete_this)
    puts "Are you sure you want to delete this #{delete_this}?".blue
    approve_delete_review = gets.chomp
    if approve_delete_review == "yes"
      puts "Review Deleted".blue
      deleted_review.delete
    else
      puts "Please finish selecting your review to delete".blue
    end
  end

  #next step, show user all of his or her past reviews

  #   def all_reviews
  #     Review.all.select do |review|

  #   end
end #end of CLI class
