class DocOne
	attr_accessor :origin, :docone, :reasonone

	#TODO : phara
	
	def initialize num
		@num = num
	end

	def out
		"#{self.docone}(#{self.reasonone}, 即权利要求#{@num}中所述的#{self.origin};"
	end

	# def phara_all
	# 	DocOne.all.each
	# end
end


