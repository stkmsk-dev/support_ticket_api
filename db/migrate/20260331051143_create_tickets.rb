class CreateTickets < ActiveRecord::Migration[8.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :priority
      t.references :user, null: false, foreign_key: true
      t.integer :assignee_id

      t.timestamps
    end
  end
end
