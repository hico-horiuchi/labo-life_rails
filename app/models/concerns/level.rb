module Level
  STUDENT = 0
  ASSISTANT = 1
  TEACHER = 2

  TEXT = %w(学生 助手 教員)
  SELECT = [['学生', 0], ['助手', 1], ['教員', 2]]

  def self.included(base)
    base.class_eval do
      validates :level, inclusion: { in: (Level::MEMBERSHIP..Level::ADMIN).to_a }

      public

      def assistant?
        level >= 1
      end

      def teacher?
        level >= 2
      end
    end
  end
end
