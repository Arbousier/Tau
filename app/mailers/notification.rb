class Notification < ActionMailer::Base
  default :from => Settings.contact_email

  def new_sub(sub_id)
    @subscriber = Subscriber.find(sub_id)
    mail(:to => Settings.contact_email, :subject => "#{Settings.site_name} : Nouvel inscrit : #{@subscriber.name}")
  end

  def thanks_new(sub_id)
    @subscriber = Subscriber.find(sub_id)
    mail(:to => @subscriber.email, :subject => "#{Settings.site_name} : confirmation inscription #{@subscriber.name}")
  end
end
