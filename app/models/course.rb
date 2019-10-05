class Course < ApplicationRecord
  belongs_to :teacher
  belongs_to :discipline

  validates :name, presence: true
end
