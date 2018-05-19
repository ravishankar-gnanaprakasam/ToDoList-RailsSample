module ApplicationHelper

	def build_title(pageTitle)
		baseTitle = "ToDo List"
		if pageTitle.empty?
			baseTitle
		else
			"#{baseTitle} | #{pageTitle}"
		end
	end


end
