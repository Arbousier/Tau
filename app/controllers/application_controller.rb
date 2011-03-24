class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    @subscriber = Subscriber.new unless @subscriber
  end
end
