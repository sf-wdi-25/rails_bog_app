class Creature < ActiveRecord::Base
	validates :name, :description,  presence: { strict: true }
end

