class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.integer :user_id
      t.integer :referrer

      t.timestamps null: false
    end
  end
end
