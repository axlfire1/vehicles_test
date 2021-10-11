# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

Dir[File.join(Rails.root, 'db', 'seed_values', '*.rb')].sort.each do |seed|
  puts "starting #{seed}"
  load seed
end

puts "\n\n####################### - seeding DONE! - #######################"
