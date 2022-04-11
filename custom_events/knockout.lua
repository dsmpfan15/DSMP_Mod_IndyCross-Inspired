function onEvent(name, value1, value2)
	if name == "knockout" then
		if value2 == nil then
			value2 = 0.005
		else
			value2 = value2 / 500
		end
		
                playSound('knockout', 50)
	
	end
end