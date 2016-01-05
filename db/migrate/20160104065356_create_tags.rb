class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_title
      t.belongs_to :user , index: true
      t.timestamps
    end
  end
end
