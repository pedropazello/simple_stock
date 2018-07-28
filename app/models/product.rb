# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  amount     :float            default(0.0), not null
#  code       :string           not null
#  price      :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
  validates_presence_of :price, :code, :amount
  validates_numericality_of :price, :amount
end
