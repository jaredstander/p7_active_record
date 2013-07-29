class Skill < ActiveRecord::Base
  # Remember to create a migration!
  has_many :ratings
  has_many :users, :through => :ratings
  validates :name, uniqueness: true

  def user_with_proficiency(rating_num)
    skill_by_rating = Rating.where(skill_id: self.id, rating: rating_num).first
    return_user = User.where(id: skill_by_rating.user_id).first
  end
end
