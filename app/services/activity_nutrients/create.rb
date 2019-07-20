module ActivityNutrients
  class Create
    def self.call(nutrient:, activity:, amount:)
      new.call(nutrient, activity, amount)
    end

    def call(nutrient, activity, amount)
      raise 'amount is not correct' unless (1..9).include?(amount)

      ActivityNutrient.create(
        nutrient: nutrient,
        activity: activity,
        amount: amount
      )
    end
  end
end
