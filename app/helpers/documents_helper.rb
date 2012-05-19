module DocumentsHelper
	def category_name(key)
		Document.categories[key.to_sym]
	end
end
