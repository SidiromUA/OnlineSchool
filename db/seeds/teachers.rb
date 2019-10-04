# frozen_string_literal: true

if Teacher.count.zero?
  puts 'Seeding Teachers'
  Teacher.create!(first_name: 'Андрій', last_name: 'Садовий', description: 'Main Teacher')
  Teacher.create!(first_name: 'Віктор', last_name: 'Ющенко', description: 'Second Teacher')
  Teacher.create!(first_name: 'Роман', last_name: 'Шухевич', description: 'Third Teacher')
end
