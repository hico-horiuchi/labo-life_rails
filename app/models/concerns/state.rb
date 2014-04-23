module State
  ACTIVE = 0
  INACTIVE = 1

  def self.included(base)
    base.class_eval do
      validates :state, inclusion: { in: (State::ACTIVE..State::INACTIVE).to_a }
      scope :active, -> () { where(state: State::ACTIVE) }

      public

      def active?
        state == State::ACTIVE
      end
    end
  end
end
