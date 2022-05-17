class WalletsController < ApplicationController
  before_action :authenticate_user!

  def new
    @wallet = Wallet.new
  end

  def create
    @wallet = Wallet.new(wallet_params)

    respond_to do |format|
      if @wallet.save
        format.turbo_stream
        format.html { redirect_to dashboard_path }
      else
        format.turbo_stream
        format.html { render dashboard_path, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @wallet.update(wallet_params)
        format.turbo_stream
        format.html { redirect_to dashboard_path, notice: 'A wallet was successfully created!' }
      else
        format.turbo_stream
        format.html { render dashboard_path, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wallet.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to dashboard_path, notice: 'A wallet was successfully deleted!' }
    end
  end

  def clear_message
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def wallet_params
    params.require(:wallet).permit(:name, :currency, :quantity).merge(user_id: current_user.id)
  end
end
