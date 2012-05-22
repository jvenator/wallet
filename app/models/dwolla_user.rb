class DwollaUser < ActiveRecord::Base
  attr_accessible :access_token, :uid
  has_one :user

  def api
    @api ||= Dwolla::User.me(access_token)
  end

  def send_money(opts = {})
    response = api.send_money_to(opts[:destination], opts[:amount], opts[:pin])
    # response is an id at transactions/send
  end

  def request_money(opts = {})
    response = api.request_money_from(opts[:destination], opts[:amount], opts[:pin])
    # response is an id at transactions/request
  end

end
