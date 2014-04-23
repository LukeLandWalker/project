class Card < ActiveRecord::Base
  attr_accessible :belong, :cost, :name, :type
  validates_presence_of :name
end
