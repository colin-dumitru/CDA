class ApplicationController < ActionController::Base

  def index
    @debts = Debt.all.order(:name)

    render :index
  end
end
