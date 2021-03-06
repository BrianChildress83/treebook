require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = users(:brian).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces"
    user = User.new(first_name: 'Brian', last_name: 'Childress', email: 'bchildres2@gmail.com')
    user.password = user.password_confirmation = 'password'

    user.profile_name = "My profile has spaces"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors [:profile_name].include?("Must be formated correctly.")
  end

  test "a user can have a correctly formated profile name" do
    user = User.new(first_name: 'Brian', last_name: 'Childress', email: 'bchildres2@gmail.com')
    user.password = user.password_confirmation = 'password'

    user.profile_name = 'brianchildress2'
    assert user.valid?
  end
end

