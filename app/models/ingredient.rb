class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, presence: true, uniqueness: true

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%").all
    else
      all
    end
  end
end
