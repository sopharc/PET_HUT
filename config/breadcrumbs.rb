crumb :root do
  link "Home", home_path
end

crumb :products do
  link "Products", products_path
end

crumb :product do |product|
  link product.name, product_path(product)
  parent :products
end


# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
