class Survey < ApplicationRecord
	has_many :questions, :dependent => :destroy
    validates :name, presence: true

	#belongs_to :user
    accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
end
