class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :ratings
  has_many :skills, :through => :ratings

  def proficiency_for(skill)
    Rating.where(skill_id: skill.id, user_id: self.id).first.rating
  end

  def set_proficiency_for(skill, rating_num)
    user_skill_rating = Rating.where(skill_id: skill.id, user_id: self.id).first
    user_skill_rating.rating = rating_num
    user_skill_rating.save
  end
end
