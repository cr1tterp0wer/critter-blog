class CreateContactMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_messages do |t|
      t.string :name, presence: true
      t.string :email, presence: true
      t.text :message, length: { minimum: 10 }

      t.timestamps
    end
  end
end
