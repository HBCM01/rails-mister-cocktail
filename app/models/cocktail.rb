class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
  has_one_attached :photo


  def self.search(search)
    if search
      cocktail_name = Cocktail.find_by(name: search)
      if cocktail_name
        self.where(cocktail_id: cocktail_name)
      else
        @cocktails = Cocktail.all
      end
    else
      @cocktails = Cocktail.all
    end
  end
end
