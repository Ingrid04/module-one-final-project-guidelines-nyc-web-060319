require_relative "../config/environment"


url = 'https://skincare-api.herokuapp.com/product?q=rose&limit=25&page=1'
connect_api = RestClient.get(url)


get_object = JSON.parse(connect_api)
get_object.each do |object|
 Product.create(name: object['name'])
end






cli = CLI.new
cli.sign_up?
product = cli.view_products
cli.select_products(product)
cli.review_of_product

cli.menu

# cli.review_product(num)
