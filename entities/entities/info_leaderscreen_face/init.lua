ENT.Base = "base_point"
ENT.Type = "point"

function ENT:AcceptInput ( Name, Activator, Caller ) end

function ENT:Initialize ( )
	LeaderscreenFaces[self.ID] = self;
	print("HEY!")
	PrintTable(LeaderscreenFaces)
	print("LEADERBOARDS BLEOW")
	PrintTable(cameraboards)
end

function ENT:KeyValue ( Key, Value )
	if Key == "screen_id" then
		self.ID = tonumber(Value);
	end
end

function ENT:Think ( )
end