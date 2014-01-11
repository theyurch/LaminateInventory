class LaminatesController < ApplicationController




# 

# capistrano for hosting tasks
# railscasts
# vps hosting
# google charts javascript

# needs:
# -sortable and filterable main table
# -(additonal?) search functionality
# -remove case sensitivity
# -enforceable data uniformity?
# -user tracking
# 	-not a strict logon
# -deletion
# -javascript styled "opening" slideout rather than new page for editing
# -grouping or numeric counts
# -large scale data migration from existing data
# faker for data
# 'mass add' ability

	def index

	    # scope = Laminate.order(params[:sort])
	    sort = params[:sort]
	    sort ||= 'color'
	    # sort = "lower(#{params[:sort]})"
	    scope = Laminate.order("lower(#{sort})")
	    # this doesn't work if I don't pass in at least one sort. Uh oh.

	    if params[:color].present?
	    	scope = scope.where('lower(color) = ?', params[:color].downcase)
	    end

	    if params[:manufacturer].present?
	     	scope = scope.where('lower(manufacturer) = ?', params[:manufacturer].downcase)
	    end

	    if params[:grade].present?
	    	scope = scope.where('lower(grade) = ?', params[:grade].downcase)
	    end

	    if params[:bin].present?
	      	scope = scope.where('lower(bin) = ?', params[:bin].downcase)
	    end

	    if params[:job].present?
	      	scope = scope.where('lower(job) = ?', params[:job].downcase)
	    end


	    @laminates = scope.page(params[:page] || 1).per(10)

	end

	def new
		@laminate = Laminate.new
	end

	def create
		@laminate = Laminate.new(laminate_params)
		@laminate.save
		redirect_to '/'
	end


	def edit
		@laminate = Laminate.find(params[:id])
	end

	def update
		@laminate = Laminate.find(params[:id])
		if @laminate.update_attributes(laminate_params)
        	redirect_to '/', notice: 'Laminate was successfully updated.'
		end	
	end

	def destroy
		@laminate = Laminate.find(params[:id])
		# needed?
	    @laminate.destroy
	    redirect_to '/', notice: 'Product was deleted'
  	end


	private
	def laminate_params
		params.require(:laminate).permit(:color, :manufacturer, :grade, 
			:bin, :job, :note, :size1, :size2)
	end

	# def sort_column
	# 	Laminate.column_names.include?(params[:sort]) ? params[:sort] : "name"
	# end
	# def sort_direction
	# 	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	# end
end

# color:string 
# manufacturer:string 
# grade:string 
# bin:string 
# job:string 
# note:string 
# size1:integer 
# size2:integer

 # quantity, user, color descriptions,
