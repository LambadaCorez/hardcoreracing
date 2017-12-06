


	function SpawnBarrier(coordinates)
		local fence = ents.Create("prop_dynamic")
		fence:SetModel("models/props_c17/fence01a.mdl")
		fence:SetPos(coordinates)
		fence:SetAngles(Angle(0,-32.832664,0))
		fence:PhysicsInitStatic( 6 )
		fence:Spawn()
	end
	
	