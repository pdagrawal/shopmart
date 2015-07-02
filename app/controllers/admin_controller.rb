class AdminController < ApplicationController
	
	def index
		redirect_to products_path if session['admin']
	end

	def login
		if (params['admin']['admin_name'] == "admin" && params['admin']['admin_password'] == "password")
			session['admin'] = :admin_name
			redirect_to products_path
		else
			redirect_to admin_index_path
		end
	end
	def logout
		session['admin'] = nil
		redirect_to admin_index_path
	end
end
