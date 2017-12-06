
		function SpawnCar1(ply,color,model,loc)
		local car = ents.Create("prop_vehicle_jeep_old")
		car:SetModel(model)
		car:SetKeyValue("vehiclescript","scripts/vehicles/tdmcars/mit_eclipsegsx.txt")
		car:SetPos(loc)
		car:SetAngles(Angle(0,90,0))
		car:Spawn()
		car:SetColor(color)
		ply:SetPos(loc)
		ply:EnterVehicle(car)
	end 