# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'

actors = CSV.parse(File.read("actor.csv"), headers: true)

actors.each do |a|
  p a["name"]
end
