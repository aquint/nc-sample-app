class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :content
      t.references :task_list, index: true

      t.timestamps
    end
  end
end
