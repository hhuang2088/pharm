class SessionsController < ApplicationController
  def new
  end
  
  def create_patient
    patient = Patient.find_by_email(params[:email])
    # If the customer exists AND the password entered is correct.
    if patient && patient.authenticate(params[:password])
      # Save the customer id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:patient_id] = patient.id
      redirect_to patients_show_path(patient), notice: "Welcome, you're logged in as #{patient.email}"
    else
    # If customer's login doesn't work, send them back to the login form.
      redirect_to root_path, notice: "Invalid Username or Password"
    end
  end

  def destroy_patient
    session[:patient_id] = nil
    redirect_to root_path
  end
end
