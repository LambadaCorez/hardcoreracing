function deathZone4()


	for k, v in pairs(ents.FindInBox( Vector(12301.297852, -9685.015625, -1250.767822), Vector(-96.080772, 4749.000488, -1553.962891) ) ) do

		
		if v:IsPlayer() and v:Alive() then
			
			v:Kill()

		end
	end
	
	
end