class FeedbacksMailer < ApplicationMailer
  #before_action :find_admin

  default to: -> { Admin.pluck(:email) }#,
          # from: 'notification@example.com'

  def feedback(feedback)
    @feedback = feedback

    # mail to: @admin.email, from: @feedback.user.email, subject: t('.subject')
    mail(from: @feedback.user.email, subject: t('.subject'))
  end

  # private

  # def find_admin
  #   @admin = Admin.first
  # end
end
