function deathZone1()


	for k, v in pairs(ents.FindInBox( Vector(-8131.158691, 14579.570313, 585.930725), Vector(-15801.411133, 4153.871094, 547.137817) ) ) do

		
		if v:IsPlayer() and v:Alive() then
			
			v:Kill()

		end
	end
	
	
end