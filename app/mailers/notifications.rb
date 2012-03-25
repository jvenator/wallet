class Notifications < ActionMailer::Base
    
	default :from => 'renterswallet@venator.vc'

	def shared_package(shared_package)
	  @shared_package = shared_package
		mail(:to => "#{@shared_package.receiver} <#{@shared_package.receiver_email}>", :subject => "Shared Package in Renter's Wallet")
	end

end