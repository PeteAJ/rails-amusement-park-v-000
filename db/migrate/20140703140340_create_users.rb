class CreateUsers < ActiveRecord::Migration
  def change 
 create_table(:users) do |t|
      t.string :user, :null => false, :default => :admin
    end
end
