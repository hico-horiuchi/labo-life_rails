class MinutesController < ApplicationController
  def new
    @seminor = Seminor.id_is(params[:seminor_id])
    @content = create_content(@seminor)
  end

  private

  def create_content(seminor)
    minutes_title(seminor) + minutes_attends(seminor) + minutes_reports(seminor)
  end

  def minutes_title(seminor)
    content =  "□ #{current_user.student_no} #{seminor.caption}議事録 #{seminor.start_at.strftime('%Y.%m.%d')}(#{jpwday(seminor.start_at)})\n"
    content + "\n"
  end

  def minutes_attends(seminor)
    content =  "● 出席\n"
    content += "\n"
    (Grade::B1..Grade::TEACHER).to_a.reverse.each do |grade|
      users = seminor.users grade
      unless users.empty?
        content += "◯ #{Grade::TEXT[grade]} &nbsp;"
        content += '&nbsp;&nbsp;' if grade < Grade::ASSISTANT
        users.each { |user| content += user.last_name }
        content += "\n"
      end
    end
    content + "\n"
  end

  def minutes_reports(seminor)
    content =  "● 報告・発表\n"
    seminor.reports.each do |report|
      content += "\n"
      content += "◯ #{report.user.last_name} 『#{report.caption}』\n"
      content += "\n"
      content += "#{report.abstract}\n"
    end
    content
  end
end
