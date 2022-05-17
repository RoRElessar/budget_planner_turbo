class DashboardsController < ApplicationController
  def index
    @wallets = Wallet.all.load_async
    @transactions = Transaction.all.load_async
  end
end
