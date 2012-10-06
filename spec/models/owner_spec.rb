require 'spec_helper'
	
	describe Owner do
  	
  		describe "Use factories for setup" do
	
			before (:each) do
				@joey = FactoryGirl.create(:owner)
				@ryn = FactoryGirl.create(:owner, :firstname => "Ryn", :active => false)
				@gianna =  FactoryGirl.create(:owner, :firstname => "Gianna", :phone => "+873-9788-9732")
			end

			it "creates valid objects" do
				@joey.should be_valid	
				@ryn.should be_valid
				@gianna.should be_valid
			end

			it "has the right attribute information" do
				@joey.firstname.should == "Joey"
				@ryn.firstname.should == "Ryn"
				@gianna.firstname.should == "Gianna"
			end

			it "returns all the records in alphabetical order" do
				Owner.alphabetical.map{|o| o.firstname}.should == ["Gianna", "Joey", "Ryn"]
			end

			it "returns all the active records" do
				Owner.active.alphabetical.map{|o| o.firstname}.should == ["Gianna", "Joey"]
			end

			it "returns the right number of active records" do
 				Owner.active.size.should == 2
			end

			it "returns the proper name correctly" do
				@joey.proper_name.should == "Joey Phelps"
			end

			it "returns the name correctly" do
				@joey.name.should == "Phelps, Joey"
			end

			it "should strip everything but numbers for the phone" do
				@gianna.phone.should == "87397889732"
			end
		end
	end

