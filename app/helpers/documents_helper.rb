module DocumentsHelper

	# def renter_document_categories
	# 	['Banking', 'Taxes', 'Employment', 'References', 'Miscellaneous']
	# end

	# def renter_document_categories
	# 	[[0, '(Select)'],[1, 'Banking'], [2,'Taxes'], [3,'Employment'], [4,'References'], [5,'Miscellaneous']]
	# end

	def category_selection(categories)
		array = [ [0,"Select"] ]
		categories.each { |c| array << [ c.id, c.name ] }
		return array
	end



end
