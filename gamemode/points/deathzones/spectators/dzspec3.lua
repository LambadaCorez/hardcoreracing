function deathZoneSpec3()


	for k, v in pairs(ents.FindInBox( Vector(-889.481995, 1499.672241, 1242.346802), Vector(1430.582642, 5328.846191, 611.499207) ) ) do

		
		if v:IsPlayer() and v:Alive() and v:Team() == 1 then
			
			v:Kill()

		end
	end
	
	
end