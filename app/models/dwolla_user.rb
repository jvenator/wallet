class DwollaUser < ActiveRecord::Base
  attr_accessible :access_token, :uid
  has_one :user

  def api
    @api ||= Dwolla::User.me(access_token)
  end

  def send_money(other_user_id, amount, pin)
    api.send_money_to(other_user_id, amount, pin)
    # response is an id at transactions/send
  end

  def request_money(other_user_id, amount, pin)
    api.request_money_from(other_user_id, amount, pin)
    # response is an id at transactions/request
  end

end
