
--12734.576172



	function SpawnCar13(model)
	local car = ents.Create("prop_vehicle_jeep_old")  
		car:SetModel(model)  
		car:SetKeyValue("vehiclescript","scripts/vehicles/tdmcars/mit_eclipsegsx.txt")
		car:SetPos(Vector(1250.285706, 13118.601563, 64.031250)) 
		car:SetAngles(Angle(0,90,0))
		car:Spawn()
		car:SetColor(ColorRand(false))
		
	end