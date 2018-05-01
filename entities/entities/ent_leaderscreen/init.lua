ENT.Base = "base_brush"
ENT.Type = "brush"

function ENT:EndTouch( Ent ) end
function ENT:Touch( Ent ) end
function ENT:PassesTriggerFilters( Ent ) return Ent:IsPlayer() end
function ENT:Initialize()
			
	

		timer.Simple(2, function()
		local ScoreboardDraw = ents.Create("leaderscreen_draw")
		if !ScoreboardDraw or !ScoreboardDraw:IsValid() then return false; end
		ScoreboardDraw:SetNetworkedVector("OBB_Max", self:OBBMaxs())
		ScoreboardDraw:SetNetworkedVector("OBB_Min", self:OBBMins())
		ScoreboardDraw:SetPos(self:OBBCenter())
		ScoreboardDraw:SetAngles((self:OBBCenter() - LeaderscreenFaces[self.ID].Entity:GetPos()):Angle())
		ScoreboardDraw:Spawn() 
		end)
	end
function ENT:OnRemove() end 

function ENT:KeyValue ( Key, Value )
	local LoweredKey = string.lower(Key);

	if LoweredKey == "screen_id" then
		self.ID = tonumber(Value);
		print("MY ID is " .. self.ID)
	end
end