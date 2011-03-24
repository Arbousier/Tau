class Subscriber < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_format_of :email, :with => %r{^(?:[_a-z0-9-]+)(\.[_a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i

  scope :permanent, lambda { 
          where("subscribers.interest = ?", Settings.interests[2])
      }
  scope :short, lambda { 
          where("subscribers.interest = ?", Settings.interests[0])
      }
  scope :medium, lambda { 
          where("subscribers.interest = ?", Settings.interests[1])
      }

  def name
    return "#{self.firstname} #{self.lastname}"
  end
end
