class CreateBets < ActiveRecord::Migration[5.0]
  def change
    create_table :bets do |t|
      t.string :bet
      t.integer :amount
      t.string :winner
      
      t.timestamps
    end
  end
end
