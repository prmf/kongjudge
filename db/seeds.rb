# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Problem.delete_all

Problem.create(:problem_title => 'Hello world',
:problem_short_title => 'HLLWWLRD',
:problem_statement => %{Your job is to print the line 'Hello World'},
:input => %{},
:solution => %{Hello World},
:time_limit => 500)