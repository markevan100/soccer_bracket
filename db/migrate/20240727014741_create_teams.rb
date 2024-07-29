class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :country
      t.references :group, null: false, foreign_key: true
      t.string :flag_url

      t.timestamps
    end
  end
end
