module ActiveAdmin
	module Views
		class Footer < Component
			def build
				super id: "footer"
				super style: "text-align: center";
				div do 
					small "Copyright by Tac School"
				end				
			end
		end
	end
end