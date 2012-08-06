require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  before :each do 
    @user = FactoryGirl.create(:user)
  end

  it "should be valid" do
    @user.should be_valid
  end

  it "should be invalid without a fullname" do
    @user.fullname = nil
    @user.should have(1).error_on(:fullname)
    @user.should_not be_valid
  end

  it "should be invalid without a username" do
    @user.username = nil
    @user.should have(1).error_on(:username)
    @user.should_not be_valid
  end

  it "should be invalid without a phone number if is customer" do
    @user.phone_number = nil
    @user.should have(1).error_on(:phone_number)
    @user.should_not be_valid
  end

  it "should be valid without a phone number if is super manager" do
    @user.role = "super_manager"
    @user.phone_number = nil
    @user.should be_valid
  end

  it "should be valid without a phone number if is product manager" do
    @user.role = "product_manager"
    @user.phone_number = nil
    @user.should be_valid
  end

  it "should be invalid without a email" do
    @user.email = nil
    @user.should have(1).error_on(:email)
    @user.should_not be_valid
  end

  it "should be invalid without a password" do
    @user.password = nil
    @user.should have(1).error_on(:password)
    @user.should_not be_valid
  end

  it "shoud be invalid without any role" do
    @user.roles.clear
    @user.should have(1).error_on(:roles)
    @user.should_not be_valid
  end

end