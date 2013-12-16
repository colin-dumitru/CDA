class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.string :name
      t.integer :amount
      t.datetime :due_date

      t.timestamps
    end
  end
end
