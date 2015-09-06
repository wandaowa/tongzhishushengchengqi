#该文件已经废了

require './charatreader.rb'
	def line_format linek
		['。','，','；'].include?(linek[-1]) ? linek[0..-2] : linek
	end

	def cha_reason line, n
		line[3] + "（" + line[5] + "，即权利要求#{n}中所述的" + line[2] + "）；"
	end

	#TODO: check this one
	def cha_diff_comm line, n
		"该权利要求所要求保护的技术方案与该对比文件所公开的技术内容相比，其区别技术特征在于权利要求#{n}中的" +
		line[2] + "，而对比文件中" + line[3] + "。该区别技术特征其实际解决的技术问题是如何" + line[6] + "。\n" +
		"然而" + line[5] + "以实现" + line[6] + "是本领域技术人员惯用的技术手段。" 
	end

	#TODO: parse to get n， 判断何时是一个权利要求的结束
	#TODO: 被对比文件2公开
	#TODO: 选择对比文件2公开或公知常识或常用手段
	#TODO: 选择是公知区别，特征还是对比文件2

	#test script
	matrix=charatreader("test")
	matrix[2..3].each do |line|
		line.map!{|e| line_format(e)}
		puts cha_reason(line, 1)
	end
	line=matrix[4]
	line.map!{|e| line_format(e)}
	puts line
	puts cha_diff_comm(line, 1)
	# def indegenerator
	# end