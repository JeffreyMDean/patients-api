require "test_helper"

class PatientsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/patients.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Patient.count, data.length
  end
end
