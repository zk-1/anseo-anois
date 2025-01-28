class SocialMediaAccountsController < ApplicationController
  before_action :set_social_media_account, only: %i[ show edit update destroy ]
  before_action :insist_on_registered_user, except: %i[ show ]

  # GET /social_media_accounts or /social_media_accounts.json
  def index
    @social_media_accounts = current_user.social_media_accounts
  end

  # GET /social_media_accounts/1 or /social_media_accounts/1.json
  def show
  end

  # GET /social_media_accounts/new
  def new
    @social_media_account = SocialMediaAccount.new(user_id: current_user.id)
  end

  # GET /social_media_accounts/1/edit
  def edit
  end

  # POST /social_media_accounts or /social_media_accounts.json
  def create
    @social_media_account = SocialMediaAccount.new(**social_media_account_params, user_id: current_user.id)

    respond_to do |format|
      if @social_media_account.save
        format.html { redirect_to @social_media_account, notice: "Social media account was successfully created." }
        format.json { render :show, status: :created, location: @social_media_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @social_media_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_media_accounts/1 or /social_media_accounts/1.json
  def update
    respond_to do |format|
      if @social_media_account.update(social_media_account_params)
        format.html { redirect_to @social_media_account, notice: "Social media account was successfully updated." }
        format.json { render :show, status: :ok, location: @social_media_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @social_media_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_media_accounts/1 or /social_media_accounts/1.json
  def destroy
    @social_media_account.destroy!

    respond_to do |format|
      format.html { redirect_to social_media_accounts_path, status: :see_other, notice: "Social media account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_media_account
      @social_media_account = SocialMediaAccount.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def social_media_account_params
      params.expect(social_media_account: [ :user_id, :old_platform, :old_account, :new_platform, :new_account ])
    end
end
