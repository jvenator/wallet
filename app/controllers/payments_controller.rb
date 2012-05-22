class PaymentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :dwolla_user?, :only => [:send_money, :request_money]

  # GET /payments
  # GET /payments.json
  def index
     # send to index view

  end

  def send_money
    #TODO handle dwolla exceptions
    resp = dwolla_user.send_money(params)
    logger.info resp
    if resp.present?
      redirect_to payments_path, notice: "Money sent via Dwolla: #{response}"
    else
      redirect_to payments_path, :flash => [:error => "Request not able to be processed"]# Flash error
    end
    # if dwolla_user.send_money == success?
    # redirect_to payments_path and flash "success"
    # else
    # redirect_to payments_path and flash "error"
  end

  def request_money
    resp = dwolla_user.request_money(params)
    if resp.present?
      redirect_to payments_path
    else
      redirect_to payments_path
    end

  end

  private

  def dwolla_user?
    current_user.dwolla_user.present?
  end

  def dwolla_user
    current_user.dwolla_user
  end


end
