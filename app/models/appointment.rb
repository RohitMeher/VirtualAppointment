class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  validates :appointment_date, presence: true

  validate :check_appointment_date_constraints

  def check_appointment_date_constraints
    unless self.appointment_date > DateTime.now + 5.hours
      errors.add(:appointment_date, "You need to schedule the appointement before 5 hours")
    end
  end

end