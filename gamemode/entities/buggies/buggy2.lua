
		function SpawnCar2()
		local car = ents.Create("prop_vehicle_jeep_old")  
		car:SetModel("models/buggy.mdl") 
		car:SetKeyValue("vehiclescript","scripts/vehicles/tdmcars/mit_eclipsegsx.txt")
		car:SetPos(Vector(-250.285706, 13118.601563, 64.031250)) 
		car:SetAngles(Angle(0,90,0))
		car:Spawn()
	end