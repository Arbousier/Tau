class Notification < ActionMailer::Base
  default :from => Settings.contact_email

  def new_sub(sub_id)
    @subscriber = Subscriber.find(sub_id)
    mail(:to => Settings.contact_email, :subject => "#{Settings.site_name} : Nouvel inscrit : #{@subject.name}")
  end

  def thanks_new(sub_id)
    @subscriber = Subscriber.find(sub_id)
    mail(:to => @subject.email, :subject => "#{Settings.site_name} : confirmation inscription #{@subject.name}")
  end
end
