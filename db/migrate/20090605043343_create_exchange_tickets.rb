class CreateExchangeTickets < ActiveRecord::Migration
  def self.up
    create_table :exchange_tickets do |t|
      t.references :paypal_transaction
      t.string :code4u, :unique => true

      t.timestamps
    end
    PaypalTransaction.reset_column_information
    PaypalTransaction.transaction do
      PaypalTransaction.all.each do |trans|
        trans.exchange_ticket = ExchangeTicket.new
        trans.save!
      end
    end
  end

  def self.down
    drop_table :exchange_tickets
  end
end
