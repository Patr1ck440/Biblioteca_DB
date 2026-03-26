class LoansController < ApplicationController
  before_action :require_login
  before_action :set_loan, only: [:show, :edit, :update, :destroy]

  def index
    @loans = current_user.admin_or_librarian? ? Loan.all.includes(:user, :book) : Loan.where(user: current_user).includes(:book)
  end

  def show
  end

  def new
    @loan = Loan.new
    @books = Book.available
  end

  def create
    @loan = Loan.new(loan_params)
    @loan.user = current_user
    @loan.status = 'active'
    @loan.loan_date = Date.today
    if @loan.save
      @loan.book.update(available: false)
      LoanLog.create(loan: @loan, action: 'created', performed_by_id: current_user.id)
      redirect_to @loan, notice: "Împrumutul a fost creat"
    else
      @books = Book.available
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @loan.update(loan_params)
      LoanLog.create(loan: @loan, action: 'updated', performed_by_id: current_user.id)
      redirect_to @loan, notice: "Împrumutul a fost actualizat"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @loan.destroy
    redirect_to loans_path, notice: "Împrumutul a fost șters"
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:book_id, :due_date, :return_date, :status)
  end
end