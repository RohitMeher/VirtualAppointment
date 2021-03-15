class PatientController < ApplicationController

  def validate_user_details
    patient_params = params["patient"]
    patient = Patient.find_by(email_address: patient_params["email"])
    if patient && patient.password == patient_params["password"]
      flash[:notice] = "You are loggedin Succsefully"
      session["patient_id"] = patient.id
      redirect_to available_doctors_path
    else
      flash[:error]  = "your email address or password is incorrrect"
      redirect_to patient_login_path
    end
  end

  def available_doctors
    @doctors = Doctor.all
    @patient = current_patient
  end

  def my_appointements
    @appointments = current_patient.appointments if current_patient
  end
end