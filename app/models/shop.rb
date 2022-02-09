class Shop < ApplicationRecord
	has_many :shelves, :dependent => :destroy
end
