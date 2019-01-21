require 'test_helper'

class BudgetsControllerTest < ActionDispatch::IntegrationTest
  test "should get originators" do
    get budgets_originators_url
    assert_response :success
  end

end
