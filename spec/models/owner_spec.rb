require 'spec_helper'
	
describe Owner do

	describe "Validation Macros" do
		it {should validate_presence_of(:firstname)}
		it {should validate_presence_of(:lastname)}
		it {should validate_presence_of(:email)}
		it {should validate_presence_of(:phone)}
	end	

	describe "Rejects bad emails" do
		it {should_not allow_value("srin").for(:email)}
		it {should_not allow_value("srin@chak,com").for(:email)}
		it {should_not allow_value("srin@srinj.uk").for(:email)}
		it {should_not allow_value("srin joy@chak.com").for(:email)}
		it {should_not allow_value("srinjoy@chakrav.con").for(:email)}
	end	

	describe "Validates good emails" do
		it {should allow_value("srinjoy@hotmail.com").for(:email)}
		it {should allow_value("srinjoy@qatar.cmu.edu").for(:email)}
		it {should allow_value("srinjoy_c@yahoo.org").for(:email)}
		it {should allow_value("srinjoy1993@cooltoad.gov").for(:email)}
		it {should allow_value("sir.joy@gmail.net").for(:email)}
	end	

	describe "Validates good phone numbers" do
		it {should allow_value("97444548624").for(:phone)}
	end	

	describe "Rejects bad phone numbers" do
		it {should_not allow_value("999-DIE-DUDE").for(:phone)}
	end	

	describe "Validates allowed country" do
		it {should allow_value("KSA").for(:country)}
	end	

	describe "Rejects invalid country" do
		it {should_not allow_value("netherlands").for(:country)}
	end	

  	describe "Use factories for setup" do
	
		before (:each) do
			@srinjoy = FactoryGirl.create(:owner)
			@rishika = FactoryGirl.create(:owner, :firstname => "Rishika", :active => false)
			@smita =  FactoryGirl.create(:owner, :firstname => "Smita", :phone => "+974-6617-7820")
		end

		it "creates valid objects" do
			@srinjoy.should be_valid	
			@rishika.should be_valid
			@smita.should be_valid
		end

		it "has the right attribute information" do
			@srinjoy.firstname.should == "Srinjoy"
			@rishika.firstname.should == "Rishika"
<<<<<<< HEAD
			@smita.firstname.should == "Smita"
=======
			@smita.phone.should == "+97466177820"
>>>>>>> 4fc34a56464c60eb2bf6ae1852c52dee89e7074d
		end

		it "returns all the records in alphabetical order" do
			Owner.alphabetical.map{|o| o.firstname}.should == ["Rishika", "Smita", "Srinjoy"]
		end

		it "returns all the active records" do
			Owner.active.alphabetical.map{|o| o.firstname}.should == ["Smita", "Srinjoy"]
		end

		it "returns the right number of active records" do
 			Owner.active.size.should == 2
		end

		it "returns the proper name correctly" do
			@srinjoy.proper_name.should == "Srinjoy Chakravarty"
		end

		it "returns the name correctly" do
			@srinjoy.name.should == "Chakravarty, Srinjoy"
		end

		it "should strip everything but numbers for the phone" do
			@smita.phone.should == "97466177820"
		end
	end
end

