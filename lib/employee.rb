class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, :last_name, presence: true
  validates :hourly_rate, inclusion: { in: 40..200 }
  validates :store_id, presence: true

  before_save :set_hash
  private
   def set_hash
     string_length = 8
    self.password = rand(36**string_length).to_s(36)
   end
end
