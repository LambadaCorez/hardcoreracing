


	function SpawnBarrier(coordinates)
		local fence = ents.Create("prop_dynamic")
		fence:SetModel("models/props_c17/fence03a.mdl")
		fence:SetPos(coordinates)
		fence:SetAngles(Angle(0,-122.832664,0))
		fence:PhysicsInitStatic( 6 )
		fence:Spawn()
	end
	
	