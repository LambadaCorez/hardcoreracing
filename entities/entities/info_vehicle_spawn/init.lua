--THESE ARE ENTITIES FROM GMRacer, IF ANY OF THE AUTHORS WANTS THIS MOD REMOVED, I WILL DO SO IMMEDIATELY
ENT.Base = "base_point"
ENT.Type = "point"

function ENT:AcceptInput ( Name, Activator, Caller ) end

function ENT:Initialize ( )
	self.ID = self.ID or table.Count(carSpawns) + 1;
	
	if carSpawns[self.ID] then
		self.ID = table.Count(carSpawns) + 1;
	end
		
	carSpawns[self.ID] = self;
end

function ENT:KeyValue ( Key, Value )
	if Key == "number" then
		self.ID = tonumber(Value);
	elseif Key == "angles" then
		local ang = string.Explode(" ", Value)
		self.Angles = Angle(ang[1], ang[2], ang[3])
	end
end

function ENT:Think ( ) end
