class PatientsController < ApplicationController
  def index
    @patients = Patient.all
    render :index
  end

  def create
    @patient = Patient.create(
      name: params[:name],
      age: params[:age],
      insurance: params[:insurance]
    )
    render :show
  end

  def show
    @patient = Patient.find_by(id: params[:id])
    render :show
  end

  def update
    @patient = Patient.find_by(id: params[:id])
    @patient.update(
      name: params[:name] || @patient.name,
      age: params[:age] || @patient.age,
      insurance: params[:insurance] || @patient.insurance
    )
    render :show
  end

  def destroy
    @patient = Patient.find_by(id: params[:id])
    @patient.destroy
    render json: { message: "Patient destroyed!" }
  end
end
