class Notifications < ActionMailer::Base
    
	default :from => 'renterswallet@venator.vc'

	def shared_package(shared_package)
	  @shared_package = shared_package
		mail( :to => "#{@shared_package.receiver} <#{@shared_package.receiver_email}>",
		      :subject => "Shared Package in RentersWallet")
	end
	
	def shared_listing(shared_listing)
	  @shared_listing = shared_listing
	  mail( :to => "#{@shared_listing.receiver} <#{@shared_listing.receiver_email}>",
	        :subject => "Shared Listing in RentersWallet")
  end

end