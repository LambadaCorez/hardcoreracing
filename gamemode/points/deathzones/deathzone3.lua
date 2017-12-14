function deathZone3()


	for k, v in pairs(ents.FindInBox( Vector(-16000.822266, 2683.541016, -1566.066528), Vector(15546.155273, -15624.016602, -1214.578979) ) ) do

		
		if v:IsPlayer() and v:Alive() then
			
			v:Kill()

		end
	end
	
	
end