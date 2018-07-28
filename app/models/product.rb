# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  code       :string           not null
#  price      :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
  validates_presence_of :price, :code
  validates_numericality_of :price
end
