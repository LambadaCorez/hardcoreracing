

function getRidOfGrenades()

	for k, v in pairs(ents.FindInBox( Vector(976.012817, 11536.031250, 560.031250), Vector(288.002075, 11737.862305, 560.031250) )) do
		
		
		if v:IsPlayer() then
		
		v:StripWeapons()
		
		end
	end

end