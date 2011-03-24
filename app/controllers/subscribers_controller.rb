class SubscribersController < ApplicationController
  before_filter :authenticate_user!, :except => [:create, :new]
  authorize_resource :class => "Subscriber"

  def new
    @subscriber = Subscriber.new
  end

  def create
    subscriber = Subscriber.new
    subscriber.firstname = params[:subscriber][:firstname]
    subscriber.lastname = params[:subscriber][:lastname]
    subscriber.email = params[:subscriber][:email]
    subscriber.status = params[:subscriber][:status]
    subscriber.interest = params[:subscriber][:interest]
    subscriber.work_field = params[:subscriber][:work_field]
    if subscriber.save
      redirect_to :root, :notice => "Merci !"
      return
    end
    redirect_to :root, :notice => "Un probleme est survenu : #{pp_errors(subscriber.errors)}", @subscriber => subscriber
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
