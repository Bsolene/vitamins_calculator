NUTRIENTS = %w[vitamin_c vitamin_d3 iron].freeze

puts '~> Looking for existing nutrients..'
nutrients_names = Nutrient.all.pluck(:name)

puts '~> Creating new nutrients..'
NUTRIENTS.map do |nutrient_name|
  next if nutrients_names.include?(nutrient_name)

  Nutrient.create!(name: nutrient_name)
  puts "~> #{nutrient_name} created"
end
