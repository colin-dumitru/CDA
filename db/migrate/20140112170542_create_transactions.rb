class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name
      t.float :sum
      t.string :comment

      t.timestamps
    end
  end
end
