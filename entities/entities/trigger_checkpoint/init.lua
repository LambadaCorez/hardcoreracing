--THESE ARE ENTITIES FROM GMRacer, IF ANY OF THE AUTHORS WANTS THIS MOD REMOVED, I WILL DO SO IMMEDIATELY
ENT.Base = "base_brush"
ENT.Type = "brush"

function ENT:Initialize()
	self.ID = self.ID or table.Count(checkpoints) + 1
	
	if checkpoints[self.ID] then
		self.ID = table.Count(checkpoints) + 1
	end
		
	checkpoints[self.ID] = self;
	end

function ENT:StartTouch( entity )
	
	if !entity:IsPlayer() then return false; end
	
	if self.ID == entity:GetNWInt("TotalCP") + 1 then
	
		entity:SetNWInt( "TotalCP", self.ID )
	
	end
end

function ENT:KeyValue ( k, v )
	local key = string.lower(k);

	if k == "number" then
		self.ID = tonumber(Value);
		

	end
end

function ENT:EndTouch( Ent ) end
function ENT:Touch( Ent ) end
function ENT:PassesTriggerFilters( Ent ) return Ent:IsPlayer() end
function ENT:Think() end
function ENT:OnRemove() end
