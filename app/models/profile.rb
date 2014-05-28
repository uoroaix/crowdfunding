class Profile < ActiveRecord::Base
  belongs_to :user

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}".squeeze(" ").strip
    else
      user.email
    end
  end
end
