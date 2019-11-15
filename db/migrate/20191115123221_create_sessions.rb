class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.belongs_to :user, index:true
      t.string :session_token, uniqueness:true

      t.timestamps
    end
  end
end
