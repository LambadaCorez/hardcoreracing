function deathZone1()


	for k, v in pairs(ents.FindInBox( Vector(-8191.812500, 14577.250977, 596.221985), Vector(-16195.715820, 3846.376953, -21.108124) ) ) do

		
		if v:IsPlayer() and v:Alive() then
			
			v:Kill()

		end
	end
	
	
end