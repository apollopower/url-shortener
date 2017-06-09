class Link < ApplicationRecord
  validates :original_url, presence: true, on: :create
  before_create :generate_short_url

  require 'digest'

  def generate_short_url
    chars = ["a".."z"].map{|i| i.to_a}.flatten

    keyword = 5.times.map{chars.sample}.join

    self.short_url = Digest::SHA256.hexdigest(keyword).slice(0,5)
  end
end
