class AddHeroShotToHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :hero_shot, :string
  end
end
