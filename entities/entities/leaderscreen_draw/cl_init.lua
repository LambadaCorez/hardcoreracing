--The majority of this code is from Huntskikbut's gamemode, GMRacer. These are included purely for compatibility, and if this is requested to be removed by himself, I will do so.

include('shared.lua')



surface.CreateFont( "ScoreboardFont", {
	font = "Ebrima Bold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 25,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "ScoreboardFont", {
	font = "Ebrima Bold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 25,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

ENT.RenderGroup = RENDERGROUP_OPAQUE;

function ENT:DrawRect ( x, y, w, h, color )
	surface.SetDrawColor(color.r, color.g, color.b, color.a);
	surface.DrawRect(self.X + x, self.Y + y, w, h);
end

function ENT:DrawText ( text, font, x, y, color, xalign, yalign )
	surface.SetFont(font);
	local W, H = surface.GetTextSize(text);
	
	if yalign == 1 then
		y = y - (H * .5);
	elseif yalign == 2 then
		y = y - H;
	end
	
	if xalign == 1 then
		x = x - (W * .5);
	elseif xalign == 2 then
		x = x - W;
	end
	
	draw.DrawText(text, font, self.X + x, self.Y + y, color);
end


function ENT:Draw()		
		
	local OBBMax = self:GetNetworkedVector("OBB_Max");
	local OBBMin = self:GetNetworkedVector("OBB_Min");

	local YDist = OBBMax:Distance(Vector(OBBMax.x, OBBMax.y, OBBMin.z));
	local XDist = OBBMax:Distance(Vector(OBBMin.x, OBBMin.y, OBBMax.z));
	
	local HeaderColor = Color(0,0,0, 255);

	local OtherColor = Color(66, 134, 244, 255)

	local Scale = 1;
		
	self.X = XDist * -(Scale * .5);
	self.Y = YDist * -(Scale * .5);
	self.W = XDist * Scale;
	self.H = YDist * Scale;

		local Angle = self:GetAngles();
		Angle:RotateAroundAxis(Angle:Right(), 90)
		Angle:RotateAroundAxis(Angle:Up(), -90 )


local  IM = CreateMaterial("UniqueNameHere","UnlitGeneric",{
	["$basetexture"] = "race/mats/race",
	["$vertexcolor"] = 1, --allows custom coloring
	["$vertexalpha"] = 1, --allows custom coloring
	["$model"] = 1,
})
--now whenever you want to set a new RT to render from, you change it on this material with:

		cam.Start3D2D(self:GetPos(), Angle, 1)
			
			surface.SetDrawColor(255, 255, 255, 0)
			surface.SetMaterial(IM)
		surface.DrawTexturedRect(self.X, self.Y - self.Y / 3, self.W, self.H - self.H / 3)

		cam.End3D2D()
	
	end
	

function ENT:Think()
	self:SetRenderBoundsWS(self:GetNetworkedVector("OBB_Min"), self:GetNetworkedVector("OBB_Max"));
	end

function ENT:DrawTranslucent() self:Draw(); end
function ENT:BuildBonePositions( NumBones, NumPhysBones ) end
function ENT:SetRagdollBones( bIn ) self.m_bRagdollSetup = bIn; end
function ENT:DoRagdollBone( PhysBoneNum, BoneNum ) end 