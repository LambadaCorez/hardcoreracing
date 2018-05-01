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

function Glow(speed,r,g,b,a)

	if speed then
		color = {}
		color.r = math.sin(RealTime()*(speed or 1))*r
		color.b = math.sin(RealTime()*(speed or 1))*g
		color.g = math.sin(RealTime()*(speed or 1))*b
		color.a = a or 255 

		return color.r, color.b, color.g, color.a
	end
end

function ENT:DrawRect ( x, y, w, h, color )
	surface.SetDrawColor(color.r, color.g, color.b, color.a);
	surface.DrawRect(self.X + x, self.Y + y, w, h);
end

function ENT:DrawTexturedRect ( x, y, w, h, image, color )
	surface.SetDrawColor(color.r, color.g, color.b, color.a);
	surface.SetMaterial(Material("race/mats/race"))
	surface.DrawTexturedRect(self.X + x, self.Y + y, w, h);
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
		
		cam.Start3D2D(self:GetPos(), Angle, 1)
		self:DrawRect(0, 0, self.W, self.H, Color(255,255,255,255)); 
		self:DrawText("Race", "TargetID", self.W * .05, self.H / 1.04, OtherColor, 1, 1)
		self:DrawText("Last Race Results:", "ScoreboardFont", self.W * .2, 45, HeaderColor, 1, 1)

		self:DrawText("People In Race:", "ScoreboardFont", self.W * .8, 45, HeaderColor, 1, 1); 

		count = 0

		for k, v in pairs(player.GetAll()) do
			
			if v:GetNWBool("inRace") then
			count = count + 15
				self:DrawText(v:Nick(), "ScoreboardFont", self.W * .8, count + 65, HeaderColor, 1, 1); 

			end


		end

		cam.End3D2D()
	
	end
	

function ENT:Think()
	self:SetRenderBoundsWS(self:GetNetworkedVector("OBB_Min"), self:GetNetworkedVector("OBB_Max"));
	end

function ENT:DrawTranslucent() self:Draw(); end
function ENT:BuildBonePositions( NumBones, NumPhysBones ) end
function ENT:SetRagdollBones( bIn ) self.m_bRagdollSetup = bIn; end
function ENT:DoRagdollBone( PhysBoneNum, BoneNum ) end 