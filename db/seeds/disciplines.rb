# frozen_string_literal: true

if Discipline.count.zero?
  puts 'Seeding Disciplines'

  %w[Графіка Програмування].each do |name|
    Discipline.create!(name: name)
  end
end
