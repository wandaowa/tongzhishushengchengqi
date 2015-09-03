#this is for parse input file
require 'csv'
require './docone.rb'

def chareader filename
	matrix = CSV.read(filename, {headers: true})
	indnum = 0 #independent claim's row
	denum = [] #dependent claim's row
	flag = 1
	matrix.each_with_index do |row, index|
		if row["type"] == "indclaim"
			indnum = row["origin"].scan(/\d/).to_i
			indclaim = indeclaim(indnum)
			indclaim.name = element_format(row["origin"].split("一种")[1])
			flag=1 
		elsif row["type"]== "declaim"
			denum = row["origin"].scan(/\d/).map{|e| e.to_i}
			declaim = declaim(denum[0], denum[1])
			flag=0
		else
			attrs = row["type"]
			eval("indclaim.#{attrs} << #{attrs}(row,indnum)") if flag==1
			eval("declaim.#{attrs} << #{attrs}(row,#{denum[0]})") if flag==0
		end
	end
end

def element_format element
	element.strip!
	['。','，','；'].include?(element[-1]) ? element[0..-2] : element
end

def indclaim num
	IndClaim.new(num)
end

def declaim denum, acnum
	DeClaim.new(denum, acnum)
end

def docone row, num
	#TODO: test this 1
	d1 = DocOne.new(num)
	for key in ["cha", "doc1", "reason1"]
		d1.send("#{key}=", element_format(row[key]))
	end
end

def doctwo row, num
	d2 = DocOne.new(num)
	for i in ["cha", "doc1", "reason1", "doc2", "reason2"]
		d2.send("#{key}=", element_format(value))
	end
end

def comm row, num
	c = Comm.new(num)
	c.cha = row[:cha]
	#...
end

#test
puts chareader("test.csv")
#doc_one(matrix, 1)