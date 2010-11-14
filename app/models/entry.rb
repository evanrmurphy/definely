# == Schema Information
# Schema version: 20101114051419
#
# Table name: entries
#
#  id         :integer         not null, primary key
#  word       :string(255)
#  definition :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Entry < ActiveRecord::Base
end
