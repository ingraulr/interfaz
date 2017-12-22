class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.date :fecha
      t.time :hora
      t.string :rfc
      t.string :motivo
      t.string :csr

      t.timestamps
    end
  end
end
