ENT.Base = "base_brush"
ENT.Type = "brush"

function ENT:Initialize()

end

function ENT:StartTouch( Ent )
	if Ent and Ent:IsValid() and Ent:IsPlayer() then 
	Ent:Kill(); 
	end
end

function ENT:EndTouch( Ent ) end
function ENT:Touch( Ent ) end
function ENT:PassesTriggerFilters( Ent ) return Ent:IsPlayer() end
function ENT:Think() end
function ENT:OnRemove() end
