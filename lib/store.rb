class Store < ActiveRecord::Base
   has_many :employees, dependent: :destroy
   validates :name, length: { minimum: 3 }
   validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0}
   validate :must_carry_men_or_women_apparel

   before_destroy :check_before_removing, prepend: true


  def must_carry_men_or_women_apparel
   if !mens_apparel? && !womens_apparel?
      errors.add attribute, "Stores must carry at least one of the men's or women's apparel"
    end
  end

   def check_before_removing
    if self.employees == 0
    throw(:abort)
  end
 end
end
