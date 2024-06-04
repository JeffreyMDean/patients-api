require "test_helper"

class PatientsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/patients.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Patient.count, data.length
  end

  test "create" do
    assert_difference "Patient.count", 1 do
      post "/patients.json", params: { name: "Steve", age: 90, insurance: "Aetna" }
      assert_response 200
    end
  end
end
