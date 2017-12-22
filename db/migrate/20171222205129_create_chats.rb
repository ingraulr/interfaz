class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.date :fecha
      t.string :motivo
      t.string :csr
      t.string :evaluacion

      t.timestamps
    end
  end
end
