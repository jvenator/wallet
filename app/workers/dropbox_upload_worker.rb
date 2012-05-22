class DropboxUploadWorker
   include Sidekiq::Worker


   def perform(document_id)
     Rails.logger.info "This is sidekiq test"
     Document.find(document_id).upload_to_dropbox
   end
end