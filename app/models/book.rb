class Book < ApplicationRecord
    validates_presence_of :title
    # validates_presence_of :author
    # validates_presence_of :price
    # validates_presence_of :publish_date
end
