class WelcomeController < ApplicationController
	def index
		flash[:notice]="A"
		flash[:warning]="A"
		flash[:alert]="A"
		
	end
end
