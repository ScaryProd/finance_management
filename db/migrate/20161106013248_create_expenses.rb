class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :location
      t.string :description
      t.float :total
      t.date :date

      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
