Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")


url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized_ingredients = open(url).read

ingredients = JSON.parse(serialized_ingredients)

ingredients['drinks'].each { |ingredient| Ingredient.create(name: ingredient.values) }
