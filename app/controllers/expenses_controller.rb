# Controller that allows the user to handle expense reports.
class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # index displays all current user expense reports, or will go to homepage if there is no user.
  def index
    @expenses = Expense.all
    unless current_user
      redirect_to root_url
    end
  end

  # show displays specific expense report
  def show
  end

  # Template that allows the user to upload a new expense report.
  def new
    @expense = Expense.new
  end

  # Template that allows the user to correct or edit an existing expense.
  def edit
  end

  # Upon successful report, will upload a new expense.
  # Otherwise, will show error message.
  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # Action that requests an update to the database
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # Upon user selection, will act and delete the selected expense.
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Selects the created expense by id, in order to edit or destroy
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Required data to create an expense.
    def expense_params
      params.require(:expense).permit(:location, :description, :total, :date).
      merge(user: current_user)
    end
end
