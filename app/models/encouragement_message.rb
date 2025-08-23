class EncouragementMessage < ApplicationRecord
  def self.random
    order("RANDOM()").first
  end
end
