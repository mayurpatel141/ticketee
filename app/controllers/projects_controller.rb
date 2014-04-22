class ProjectsController < ApplicationController
	before_filter :find_project, :only => [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(params[:project])
		if @project.save
			flash[:notice] = "new project is created"
			redirect_to @project
		else
			flash[:notice] = "project not saved"
			render :action => "new"
		end
	end

	def show
		#@project = Project.find(params[:id])
	end

	def edit
		#@project = Project.find(params[:id])
	end

	def update
		#@project = Project.find(params[:id])
		if @project.update_attributes(params[:project])
			flash[:notice]="updated successfully"
			redirect_to @project
		else
			flash[:notice] = "project not been edited"
			render :action => "edit"
		end
	end

	def destroy
		#@project = Project.find(params[:id])
		@project.destroy
		flash[:notice] = "Project has been destroyed"
		redirect_to projects_path
	end

	private

		def find_project
			@project = Project.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The project you where looking "+
											"for could not be found."
		  redirect_to projects_path
		end



end
