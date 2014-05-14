module Grade
  B1 = 0
  B2 = 1
  B3 = 2
  B4 = 3
  M1 = 4
  M2 = 5
  D1 = 6
  D2 = 7
  D3 = 8
  ASSISTANT = 9
  TEACHER = 10

  TEXT = %w(B1 B2 B3 B4 M1 M2 D1 D2 D3 助手 教員)
  SELECT = [
    ['学部1年', 0], ['学部2年', 1], ['学部3年', 2], ['学部4年', 3],
    ['修士1年', 4], ['修士2年', 5],
    ['博士1年', 6], ['博士2年', 7], ['博士3年', 8],
    ['助手', 9], ['教師', 10]
  ]

  def self.included(base)
    base.class_eval do
      validates :grade, inclusion: { in: (Grade::B1..Grade::TEACHER).to_a }

      public

      def admin?
        grade >= 4
      end
    end
  end
end
