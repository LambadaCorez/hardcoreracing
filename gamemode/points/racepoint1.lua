function racePoint1()


	for k, v in pairs(ents.FindInBox( Vector(-1024.419922, 12541.967773, -10.330276), Vector(-1086.406616, 13375.701172, 373.506012) ) ) do

		
		if v:IsVehicle() then
			laps = 1
			net.Start("laps")
			net.WriteInt(laps,32)
			net.Send(v:GetDriver())

		end
	end
	
	
end