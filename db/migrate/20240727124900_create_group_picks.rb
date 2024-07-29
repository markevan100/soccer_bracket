class CreateGroupPicks < ActiveRecord::Migration[7.0]
  def change
    create_table :group_picks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.json :group_standings

      t.timestamps
    end
  end
end
