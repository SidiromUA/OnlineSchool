# frozen_string_literal: true

class Lesson < AplicationRecord
  belongs_to :course

  validates :names, presence: true
  validates :description, presence: true
end