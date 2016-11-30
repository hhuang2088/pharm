class PatientsController < ApplicationController
  def new
  	@patient = Patient.new
  end

  def create
  	@patient = Patient.new patient_params

  		if @patient.save
  			redirect_to root_path, notice: "Created user"
  		else
  			render action: 'new'
  		end
  end

  	private
  	def patient_params
  		params.require(:patient).permit(:email, :password, :password_confirmation)
  	end
end
