class CreatePaypalTransactions < ActiveRecord::Migration
  def self.up
    create_table :paypal_transactions do |t|
      t.string :txn_id, :null => false
      t.string :item_number, :null => false
      t.string :payer_email, :null => false
      t.string :last_name, :null => false
      t.string :first_name, :null => false
      t.string :payment_status, :null => false
      t.string :residence_country, :null => false
      t.string :verify, :null => false
      t.text :notified_json, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :paypal_transactions
  end
end
