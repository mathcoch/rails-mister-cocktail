class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true

  def self.search(search)
    if search
      joins(:ingredients).where("lower(ingredients.name) LIKE ?", "%#{search.downcase}%").all
    else
      all
    end
  end
end
