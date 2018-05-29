class AddSmallHeroToHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :hero_shot_small, :string
  end
end
