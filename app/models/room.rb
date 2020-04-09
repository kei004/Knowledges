class Room < ApplicationRecord


    has_many :messages, dependent: :destroy#dependentはルームが消えたら紐づけられたpostも消されるようにするため
    has_many :room_groups
    has_many :users,through: :room_groups
    has_many :chatstatu
    validates :atter, presence: true
    validates :title, presence: true, length: { maximum:200 }
    validates :choice_first, presence: true, length: { maximum:20 }
    validates :choice_second, presence: true, length: { maximum:20 }
    validates :contents, presence: true, length: { maximum:700 }
    validates :tag, presence: true, length: { maximum:100 }
    validates :rule, presence: true, length: { maximum:700 }
end
