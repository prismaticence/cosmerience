class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :password_digest
    	t.timestamps
    end

    create_table :treatments do |t|
    	t.string :name
    	t.string :description
    	t.timestamps
    end

    create_table :reviews do |t|
    	t.string :title
    	t.string :body
    	t.integer :cost
    	t.boolean :recommend
    	t.integer :user_id
    	t.integer :treatment_id
    	t.timestamps
    end

    create_table :comments do |t|
    	t.string :body
    	t.integer :review_id
    	t.integer :user_id
    	t.timestamps
    end
    
  end
end
