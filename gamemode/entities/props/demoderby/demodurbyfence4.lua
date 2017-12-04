


	function SpawnDemoDurbyFence4()
		local fence = ents.Create("prop_dynamic")
		fence:SetModel("models/props_c17/fence03a.mdl")
		fence:SetPos(Vector(14174.031250, 5263.558105, -1485.968750))
		fence:SetAngles(Angle(0,90,0))
		fence:PhysicsInitStatic( 6 )
		fence:Spawn()
	end
	
	