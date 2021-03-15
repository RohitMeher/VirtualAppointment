class ApplicationController < ActionController::Base
 
  def current_patient
    if id = session["patient_id"]
      Patient.find(id)
    end
  end
  
end
