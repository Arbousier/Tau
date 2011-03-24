class SubscribersController < ApplicationController
  before_filter :authenticate_user!, :except => [:create, :new]
  authorize_resource :class => "Subscriber"

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new
    @subscriber.firstname = params[:subscriber][:firstname]
    @subscriber.lastname = params[:subscriber][:lastname]
    @subscriber.email = params[:subscriber][:email]
    @subscriber.status = params[:subscriber][:status]
    @subscriber.interest = params[:subscriber][:interest]
    @subscriber.work_field = params[:subscriber][:work_field]
    @subscriber.comment = params[:subscriber][:comment]
    if @subscriber.save
      Notification.new_sub(@subscriber.id).deliver
      Notification.thanks_new(@subscriber.id).deliver
      redirect_to :root, :notice => "Merci #{@subscriber.firstname} ! Vous allez recevoir un email de confirmation"
      return
    else
      render :action => "new"
    end
    
  end

  def index
    @subscribers = Subscriber.all
  end

  protected
  def pp_errors(errors)
    llm = ""
    errors.keys.each do |k|
      llm += "#{k} : #{errors[k].first}"
    end
    return llm
  end
end
