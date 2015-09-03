class DocOne
	attr_writer :cha, :doc1, :reason1

	#TODO : phara
	
	def initialize num
		@num = num
	end

	def out
		"#{self.doc1}(#{self._reason1}, 即权利要求#{@num}中所述的#{self.cha};"
	end

	# def phara_all
	# 	DocOne.all.each
	# end
end