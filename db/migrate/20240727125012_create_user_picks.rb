class CreateUserPicks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_picks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.integer :predicted_winner_id

      t.timestamps
    end
  end
end
