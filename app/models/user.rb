# == Schema Information
# Schema version: 20101114051419
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

  validates :name, :presence => true
  validates :email, :presence => true,
                    :uniqueness => { :case_sensitive => false }
end
