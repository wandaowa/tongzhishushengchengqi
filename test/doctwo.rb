class DocTwo
	attr_writer :origin, :docone, :pro, :doctwo, :reasontwo

	#TODO : phara
	
	def initialize num
		@num = num
	end

	def out1
		"权利要求#{@num}中要求保护的技术方案中#{self.origin}，然而对比文件1中#{self.doc}，基于该区别技术特征，该权利要求实际解决的技术问题是#{self._pro}。"
	end

	def out2
		"#{self.doctwo}(#{self.reasontwo}, 即权利要求#{@num}中所述的#{self.origin};"
	end
end