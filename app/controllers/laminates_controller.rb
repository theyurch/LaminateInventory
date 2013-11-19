class LaminatesController < ApplicationController


# needs:
# -sortable and filterable main table
# -(additonal?) search functionality
# -remove case sensitivity
# -enforceable data uniformity?
# -user tracking
# 	-not a strict logon
# -javascript styled "opening" slideout rather than new page for editing
# -grouping or numeric counts
# -large scale data migration from existing

	def index
		# @laminates = Laminate.all
		# @laminates = Laminate.order(sort_column + " " + sort_direction)
		@laminates = Laminate.order(params[:sort])
		# dangerous - sanitize the input somehow

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
