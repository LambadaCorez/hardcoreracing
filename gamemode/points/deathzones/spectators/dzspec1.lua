function deathZoneSpec1()


	for k, v in pairs(ents.FindInBox( Vector(15304.419922, -4078.014160, 113.444443), Vector(12614.207031, -6883.747070, -156.252609) ) ) do

		
		if v:IsPlayer() and v:Alive() and v:Team() == 1 then
			
			v:Kill()

		end
	end
	
	
end