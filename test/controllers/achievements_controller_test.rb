require "test_helper"

class AchievementsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = User.create!(email: "test@example.com", password: "password")
    sign_in @user
  end

  test "should get index" do
    get achievements_url
    assert_response :success
  end
end
