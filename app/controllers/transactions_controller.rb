class TransactionsController < ApplicationController
  def view
    @transactions = Transaction.where(name: params[:name]).order('created_at desc') || []
    @name = params[:name]

    render :index
  end

  def add
    @debt = Debt.find_by(name: params[:name])

    unless @debt
      @debt = Debt.create(name: params[:name], amount: 0, due_date: Date.tomorrow())
    end

    @debt.amount -= Float(params[:sum])
    @debt.save

    Transaction.create(name: params[:name], sum: Float(params[:sum]), comment: params[:comment])

    render :nothing => true, :status => 200
  end
end
