class AddCountryCodeToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :country_code, :string
  end
end
