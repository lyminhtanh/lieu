class CreateSpreeAboutUs < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_about_us do |t|
      t.text :title1
      t.text :subtitle1
      t.text :body1
      t.text :title2
      t.text :subtitle2
      t.text :body2

      t.timestamps
    end
  end
end
