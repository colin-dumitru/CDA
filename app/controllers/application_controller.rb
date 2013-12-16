class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @debts = Debt.all

    render :index
  end
end
