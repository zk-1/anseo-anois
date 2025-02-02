class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]
  before_action :insist_on_registered_user, except: %i[ show ]
  # GET /accounts or /accounts.json
  def index
    @accounts = current_user.accounts
  end

  # GET /accounts/1 or /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = current_user.accounts.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @account = current_user.accounts.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy!

    respond_to do |format|
      format.html { redirect_to accounts_path, status: :see_other, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.expect(account: [ :publicly_visible, :accountable_type, accountable_attributes: {}, replaced_ids: [], replacement_ids: [] ])
    end
end
