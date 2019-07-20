module Activities
  class GenerateRecipe
    def self.call(user, date)
      new.call(user, date)
    end

    def call(user, date)
      day_activities =
        user.activities.where('created_at >= ?', date.beginning_of_day)

      food_intake = day_activities.where(name: 'food_intake').first
      raise 'no food intake for this date' if food_intake.nil?

      activity_level = day_activities.where(name: 'activity_level').first
      raise 'no activity level for this date' if activity_level.nil?

      recipe_activity = Activities::Create.call(user: user, name: 'recipe')

      Nutrient::NUTRIENT_TYPES.map do |nutrient_type|
        nutrient = Nutrient.find_by(name: nutrient_type)

        food_amount =
          food_intake
          .activity_nutrients
          .select { |an| an.nutrient == nutrient }
          .first
          .amount

        activity_level_amount =
          activity_level
          .activity_nutrients
          .select { |an| an.nutrient == nutrient }
          .first
          .amount

        amount = 10 - (food_amount + activity_level_amount)

        ActivityNutrients::Create.call(
          activity: recipe_activity,
          nutrient: nutrient,
          amount: amount
        )
      end

      recipe_activity
    end
  end
end
