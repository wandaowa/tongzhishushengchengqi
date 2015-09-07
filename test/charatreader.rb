#this is for parse input file
require 'csv'
require './docone.rb'
require './claim.rb'

public
def re_format element
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
	#TODO: test this one
	d1 = DocOne.new(num)
	for key in ["origin", "docone", "reasonone"]
		d1.send("#{key}=", re_format(row[key]))
	end
	puts d1.out
	d1
end

def doctwo row, num
	d2 = DocOne.new(num)
	for i in ["origin", "docone", "reasonone", "doctwo", "reasontwo"]
		d2.send("#{key}=", re_format(value))
	end
end

def comm row, num
	c = Comm.new(num)
	c.origin = row["origin"]
	#...
end

def originreader filename
	matrix = CSV.read(filename, {headers: true})
	indnum = 0 #independent claim's row
	denum = [] #dependent claim's row
	flag = 1
	matrix.each_with_index do |row, index|
		if row["type"] == "ind"
			indnum = row["origin"].scan(/\d/)
			indclaim = indclaim(indnum)
			indclaim.name = re_format(row["origin"].split("一种")[1])
			flag=1 
		elsif row["type"].include?("de")
			denum = row["origin"].scan(/\d/)
			denum[1] ||= "*"
			declaim(denum[0], denum[1])
			flag=0
		else
			attrs = row["type"]
			# x=docone(row,indnum)
			# indclaim.docone << x
			x=eval("#{attrs}(row,indnum)")
			eval("indclaim.#{attrs} << #{x}") #bugs here
			#eval("indclaim.#{attrs} << #{attrs}(row,indnum)") if flag==1
			# eval("declaim.#{attrs} << #{attrs}(row,#{denum[0]})") if flag==0
		end
	end
end


#test
puts originreader("test.csv")
#doc_one(matrix, 1)