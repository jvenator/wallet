require 'spec_helper'

describe Listing do
   before(:each) do
    @listing = Listing.new(:name => "Listing")
   end

   it { should have_many(:documents).through(:document_listings) }
   it { should have_many(:pacakges).through(:submitted_packages)}

   it "should have a unique identifier" do
      @listing.identifier.should be_nil
      @listing.save!
      @listing.identifier.should_not be_nil

   end

   it "should always have a name" do
      @listing.name = nil
      expect { @listing.save! }.should raise_error(ActiveRecord::RecordInvalid)
   end

   it "can share a listing" do
      pending
   end

   it "can add a document" do
      pending
   end

   it "can remove a document" do
      pending
   end
end