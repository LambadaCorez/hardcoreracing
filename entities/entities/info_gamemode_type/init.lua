ENT.Base = "base_point"
ENT.Type = "point"

function ENT:AcceptInput ( Name, Activator, Caller ) end
function ENT:Initialize ( ) end

function ENT:KeyValue ( Key, Value )
	if string.lower(Key) == "id" then
		GAMEMODE.GamemodeType = tonumber(Value);
	end
end

function ENT:Think ( ) end
