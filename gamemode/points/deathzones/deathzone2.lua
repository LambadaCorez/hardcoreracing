function deathZone2()


	for k, v in pairs(ents.FindInBox( Vector(-15889.625977, 2577.153076, -1427.675293), Vector(15376.787109, -15350.886719, -1484.431641) ) ) do

		
		if v:IsPlayer() and v:Alive() then
			
			v:Kill()

		end
	end
	
	
end