require 'test_helper'

class FinancialCostsControllerTest < ActionDispatch::IntegrationTest
  test "should get subcontractors" do
    get financial_costs_subcontractors_url
    assert_response :success
  end

end
