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

  test "show" do
    get "/patients/#{Patient.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "age", "insurance"], data.keys
  end

  test "update" do
    patient = Patient.first
    patch "/patients/#{patient.id}.json", params: { name: "Updated name", age: 40, insurance: "Updated insurance" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal 40, data["age"]
    assert_equal "Updated insurance", data["insurance"]
  end

  test "destroy" do
    assert_difference "Patient.count", -1 do
      delete "/patients/#{Patient.first.id}.json"
      assert_response 200
    end
  end
end
