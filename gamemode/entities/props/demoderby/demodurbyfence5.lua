


	function SpawnDemoDurbyFence5()
		local fence = ents.Create("prop_dynamic")
		fence:SetModel("models/props_c17/fence03a.mdl")
		fence:SetPos(Vector(14336.031250, 5263.267578, -1485.979980))
		fence:SetAngles(Angle(0,90,0))
		fence:PhysicsInitStatic( 6 )
		fence:Spawn()
	end
	
	