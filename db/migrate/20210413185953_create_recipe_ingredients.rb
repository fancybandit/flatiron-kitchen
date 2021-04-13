class CreateRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, foreign_key: {on_delete: :cascade}
      t.references :ingredient, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
