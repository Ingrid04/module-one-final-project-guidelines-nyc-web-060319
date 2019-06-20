require_relative "../config/environment"

cli = CLI.new
cli.sign_up?
product = cli.view_products
cli.select_products(product)
cli.review_of_product

cli.menu

# cli.review_product(num)
