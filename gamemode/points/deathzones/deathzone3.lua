function deathZone3()


	for k, v in pairs(ents.FindInBox( Vector(-5946.562012, 1173.000122, 976.787598), Vector(-8131.595215, 5189.934570, 990.366028) ) ) do

		
		if v:IsPlayer() and v:Alive() then
			
			v:Kill()

		end
	end
	
	
end