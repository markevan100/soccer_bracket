class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.integer :team_a_id
      t.integer :team_b_id
      t.references :group, null: false, foreign_key: true
      t.datetime :date
      t.integer :team_a_goals
      t.integer :team_b_goals
      t.integer :team_a_yellow_cards
      t.integer :team_b_yellow_cards
      t.integer :team_a_red_cards
      t.integer :team_b_red_cards

      t.timestamps
    end
  end
end
