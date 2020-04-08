class Task < ApplicationRecord
    validates :title, presence: true, length: {maximum:63}
    validates :content, presence: true, length: {maximum:255}
end
255