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
end
