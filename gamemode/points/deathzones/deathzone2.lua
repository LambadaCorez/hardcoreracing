function deathZone2()


	for k, v in pairs(ents.FindInBox( Vector(-8152.296387, 5234.002441, 957.638977), Vector(-5876.166992, 1103.754883, 756.745117) ) ) do

		
		if v:IsPlayer() and v:Alive() and v:Team() == 0 then
			
			v:Kill()

		end
	end
	
	
end