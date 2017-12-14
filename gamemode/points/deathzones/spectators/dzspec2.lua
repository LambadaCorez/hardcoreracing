function deathZoneSpec2()


	for k, v in pairs(ents.FindInBox( Vector(-12149.035156, -13390.698242, 277.135620), Vector(-14503.843750, -11025.884766, -391.736389) ) ) do

		
		if v:IsPlayer() and v:Alive() and v:Team() == 1 then
			
			v:Kill()

		end
	end
	
	
end