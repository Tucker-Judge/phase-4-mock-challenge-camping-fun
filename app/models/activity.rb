class Activity < ApplicationRecord
    has_many :signups, dependent: :destroy
    has_many :campers, through: :signups
    
    validates :name, presence: true
    validates :age, inclusion: 8..18
end
