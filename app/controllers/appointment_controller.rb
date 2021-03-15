class AppointmentController < ApplicationController

  def new
    appointement_params = params["appointement"]
    @doctor = Doctor.find(appointement_params["doctor_id"])
    @patient = Patient.find(appointement_params["patient_id"])
  end

  def schedule_appointemnet
    appointement_params = params["appointement"]
    date, time = appointement_params["appointment_date"].split("T")
    date = date.split("-").map(&:to_i)
    time = time.split(":").map(&:to_i)
    scheduled_date_time = DateTime.new(date[0], date[1], date[2], time[0], time[1], 0, '+05:30')
    appointement = Appointment.new(doctor_id: appointement_params["doctor_id"], patient_id: appointement_params["patient_id"], appointment_date: scheduled_date_time)
    if appointement.save
      flash["notice"] = "Appointment scheduled succesfully"
      redirect_to my_appointements_path
    else
      flash["error"] = appointement.errors.full_messages.join('')
      redirect_to available_doctors_path
    end
  end

  def cancel_appointement
    appointement_params = params["appointement"]
    appointement = Appointment.find(appointement_params["appointement_id"])
    if appointement.appointment_date > DateTime.now + 1.hours
      if appointement && appointement.destroy
        flash["notice"] = "Appointment canceled succesfully"
        redirect_to my_appointements_path and return
      end
    else
      flash["error"] = "You cannot cancel the appointement before 1 hour"
      redirect_to my_appointements_path
    end
  end

end
