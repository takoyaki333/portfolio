require "test_helper"

class MypagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(email: "test@example.com", password: "password", name: "Test User")
    sign_in @user  # ← 追加
  end

  test "should get show" do
    get mypage_url
    assert_response :success
  end
end
