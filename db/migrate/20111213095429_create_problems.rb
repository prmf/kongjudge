class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :problem_title
      t.string :problem_short_title
      t.text :problem_statement
      t.text :input
      t.text :solution
      t.integer :time_limit

      t.timestamps
    end
  end
end
