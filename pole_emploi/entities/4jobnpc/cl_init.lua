include('shared.lua')
include('autorun/4job_config.lua')
include('autorun/client/4job_client.lua')

surface.CreateFont("headfont4job", {
	font = "Roboto",
	size = 75,
	weight = 500,
});

function ENT:Draw()
	self:DrawModel()
	
	local angle = self:GetAngles()
	local position = self:GetPos()
	
	angle:RotateAroundAxis( angle:Up(), 90 )
	angle:RotateAroundAxis( angle:Forward(), 90 )
	
	if LocalPlayer():GetPos():Distance(self:GetPos()) < 250 then
		cam.Start3D2D(position + angle:Right() * - 77 + angle:Forward() * - 0.5, Angle( 0, LocalPlayer():GetAngles().y - 90, 90), 0.05)
			draw.SimpleText("Pôle Emploi", "headfont4job", 0, -4,color_white,1)
		cam.End3D2D()
	end
	
end