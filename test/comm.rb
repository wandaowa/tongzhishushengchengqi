class Comm
	attr_writer :comm, :pro

	def out
		"使用#{self.comm}以解决#{self.pro}"
	end
end