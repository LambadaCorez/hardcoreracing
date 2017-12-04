


	function SpawnDemoDurbyFence8()
		local fence = ents.Create("prop_dynamic")
		fence:SetModel("models/props_c17/fence01a.mdl")
		fence:SetPos(Vector(13088.031250, 5263.267578, -1471.979980))
		fence:SetAngles(Angle(0,90,0))
		fence:PhysicsInitStatic( 6 )
		fence:Spawn()
	end
	
	