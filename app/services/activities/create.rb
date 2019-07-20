module Activities
  class Create
    def self.call(user:, name:)
      new.call(user, name)
    end

    def call(user, name)
      raise 'invalid name' unless Activity::ACTIVITY_TYPES.include?(name)

      Activity.create(user: user, name: name)
    end
  end
end
