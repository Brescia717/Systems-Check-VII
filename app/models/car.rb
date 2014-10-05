class Car < ActiveRecord::Base
  validates :manufacturer_id, presence: true
  validates :color, presence: true
  validates :year, presence: true
  validates :milage, presence: true

  validates_numericality_of :year, greater_than: 1920

  belongs_to :manufacturer
end
