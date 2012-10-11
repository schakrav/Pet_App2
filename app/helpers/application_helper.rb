module ApplicationHelper

  # Returns the full title on a per-page basis.

	def full_title
  		@title ? "Pet App | #{@title}" : "Pet App| TM"
  	end
end

