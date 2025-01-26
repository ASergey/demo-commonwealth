# frozen_string_literal: true

class CreateTables < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false

      t.timestamps
    end

    create_table :skills do |t|
      t.string :name, null: false
      t.timestamps
      t.index :name, unique: true
    end

    create_table :courses do |t|
      t.string :title, null: false
      t.string :description
      t.references :author, null: false, foreign_key: true

      t.timestamps
      t.index :title, unique: true
    end

    create_join_table :courses, :skills do |t|
      t.index %i[course_id skill_id], unique: true
    end
  end
end
