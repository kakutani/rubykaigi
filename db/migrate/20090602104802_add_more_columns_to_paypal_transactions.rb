class AddMoreColumnsToPaypalTransactions < ActiveRecord::Migration
  def self.up
    add_column :paypal_transactions, :receipt_id, :string
    add_column :paypal_transactions, :payer_id, :string
    add_column :paypal_transactions, :memo, :text
  end

  def self.down
    remove_column :paypal_transactions, :memo
    remove_column :paypal_transactions, :payer_id
    remove_column :paypal_transactions, :receipt_id
  end
end
