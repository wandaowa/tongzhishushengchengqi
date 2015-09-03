class DocTwo
	attr_writer :cha, :doc1, :pro, :doc2, :reason2

	#TODO : phara
	
	def initialize num
		@num = num
	end

	def out1
		"权利要求#{@num}中要求保护的技术方案中#{self.}，然而对比文件1中#{self.doc}，基于该区别技术特征，该权利要求实际解决的技术问题是#{self._pro}。"
	end

	def out2
		"#{self.doc2}(#{self._reason2}, 即权利要求#{@num}中所述的#{self.};"
	end
end