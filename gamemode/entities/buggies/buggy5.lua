
--12734.576172


		function SpawnCar5()
		local car = ents.Create("prop_vehicle_jeep_old")
		car:SetModel("models/buggy.mdl") 
		car:SetKeyValue("vehiclescript","scripts/vehicles/tdmcars/mit_eclipsegsx.txt")
		car:SetPos(Vector(-500.285706, 12734.601563, 64.031250)) 
		car:SetAngles(Angle(0,90,0))
		car:Spawn()
	end