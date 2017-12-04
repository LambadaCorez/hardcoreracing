


	function SpawnFence2()
		local fence = ents.Create("prop_dynamic")
		fence:SetModel("models/props_c17/fence01a.mdl")
		fence:SetPos(Vector(6200.286621, 11696, 565.031250))
		fence:SetAngles(Angle(0,0,0))
		fence:PhysicsInitStatic( 6 )
		fence:Spawn()
	end
	
	