class IndClaim
	attr_writer :independent, :name, :phara_one, :doc_diff, :doc_two, :phara_two, :comm
	
	def initialize num
		@num = num
		@doc_one = []
	end

	def op
		"权利要求#{@num}要求保护#{self.name}，然而对比文件1说明书#{self.phara_one}公开了以下特征："
	end

	def mid_doc_one
		self.doc_one.each do |e| e.out end
	end

	def mid_doc_diff
		"权利要求#{@num}所要求保护的技术方案与对比文件1的区别技术特征在于：#{self.doc_diff}"
	end

	def mid_doc_comm
		"然而该区别技术特征是公知常识，使用#{self.comm}是本领域技术人员所公知的常识。"
	end

	def mid_doc2
		"然而该区别技术特征在对比文件2（参见#{self.phara_two}）中公开：#{self.doc_two.out2}"
	end

	def ed
		"因此不具有创造性"
	end
end

c1=Claim.new(1)
c1.independent = true
c1.doc_one = "得到结论"

puts c1.independent
puts c1.doc_one
puts c1.out