module WalletsHelper
  NOTICE = {
    create: 'Post created successfully',
    update: 'Post updated successfully',
    delete: 'Post deleted successfully',
    error: 'Something went wrong'
  }.freeze

  def notice_stream(message:, status:)
    turbo_stream.replace 'notice', partial: 'notice', locals: { notice: NOTICE[message], status: status }
  end

  def form_wallet_stream(wallet:)
    turbo_stream.replace 'form', partial: 'form', locals: { wallet: wallet }
  end
end
