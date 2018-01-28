include('autorun/4job_config.lua')


---> Fonts
surface.CreateFont( "screen_description", {
	font = "Roboto",
	extended = false,
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )
surface.CreateFont("eyl_roboto1", {
	font = "Roboto",
	size = 50,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
});
surface.CreateFont("connectfont", {
	font = "Roboto",
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 1,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
});
surface.CreateFont("connectfont2", {
	font = "Roboto",
	size = 30,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = true,
	outline = false,
});
surface.CreateFont("4font", {
	font = "Roboto",
	size = 75,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
});

surface.CreateFont("windowfont", {
	font = "Roboto",
	size = 25,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
});

---> blur material
local blur = Material("pp/blurscreen")
local function colorblur(p, a, h)
		local x, y = p:LocalToScreen(0, 0)
		surface.SetDrawColor(color_white)
		surface.SetMaterial(blur)
		for i = 1, (h or 3) do
			blur:SetFloat("$blur", (i/3)*(a or 6))
			blur:Recompute()
			render.UpdateScreenEffectTexture()
			surface.DrawTexturedRect(x*-1,y*-1,ScrW(),ScrH())
		end
		draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(0,0,0,150))
		draw.RoundedBox(0,0,70,ScrW(),ScrH(),Color(0,0,0,100))
end

---> Derma panel 4Job
function NPC_JOB_BASEFUNCTION(ply)
NPC_JOB_BASE = vgui.Create( "DFrame" )
NPC_JOB_BASE:SetPos( 300, 300 )
NPC_JOB_BASE:SetSize( 1310, 470 )
NPC_JOB_BASE:SetTitle( "" )
NPC_JOB_BASE:SetVisible( true )
NPC_JOB_BASE:SetDraggable( false )
NPC_JOB_BASE:ShowCloseButton( false )
NPC_JOB_BASE:MakePopup()
	NPC_JOB_BASE.Paint = function(self,w,h)
		colorblur(self, 6)
		surface.SetDrawColor( Color( 255, 255, 255, 20 ) )
		surface.DrawOutlinedRect( 0, 0, w, h )
		surface.DrawOutlinedRect(-800, 300, 0, 250, h - 400 )
		draw.RoundedBox(0, 0, 0, 1350, h-400, Color(120, 120, 120, 125) )
	end

---> Steam Photo for profile
steamphoto = vgui.Create( "AvatarImage", NPC_JOB_BASE )
steamphoto:SetSize( 20, 20 )
steamphoto:SetPos( 1140, 25 )
steamphoto:SetPlayer( LocalPlayer(), 64 )

---> PlayerModel of the player
localplayermodel = vgui.Create( "DModelPanel", NPC_JOB_BASE )
localplayermodel:SetSize( 400, 400 )
localplayermodel:SetPos( -100, 75 )
localplayermodel:SetModel( LocalPlayer():GetModel() )
localplayermodel.Entity:SetEyeTarget( Vector( 200, 200, 100 ) )
function localplayermodel:LayoutEntity( Entity ) return end
localplayermodel:SetCamPos( Vector( 25, -15, 62 ) )
	localplayermodel:SetLookAt( Vector( 0, 0, 62 ) )
	
---> Presentation of the player
himynameis = vgui.Create( "DLabel", NPC_JOB_BASE )
himynameis:SetText( mynameis..LocalPlayer():GetName()..looking4job )
himynameis:SetPos( 30, 80)
himynameis:SetSize( 1000, 100 )
himynameis:SetFont("connectfont")
	
	
---> Close button
	ButtonClose = vgui.Create( "DButton",NPC_JOB_BASE)
	ButtonClose:SetPos( 1275, 0) 
	ButtonClose:SetText( "X" )
	ButtonClose:SetSize( 25, 25 )
	ButtonClose:SetFont( "connectfont2" )
	ButtonClose:SetColor(color_white)
	ButtonClose:SetParent(NPC_JOB_BASE )
	function ButtonClose:Paint(w,h)
		draw.RoundedBox( 0, 0, 0, w, h, Color(150,0,0)  )
	end
	
	ButtonClose.DoClick = function()
		NPC_JOB_BASE:Close()
	end
	
---> Hello text
hello = vgui.Create( "DLabel", NPC_JOB_BASE )
hello:SetText( welcome..LocalPlayer():GetName() )
hello:SetPos( 1050, -40)
hello:SetSize( 15000, 150 )
hello:SetFont("connectfont")

---> 4 text
name4tube4 = vgui.Create( "DLabel", NPC_JOB_BASE  )
name4tube4:SetText( "Pôle" )
name4tube4:SetPos( 10, -15 )	
name4tube4:SetSize( 15000, 100 )	
name4tube4:SetColor( Color( 255, 0, 0, 255 ) )
name4tube4:SetFont("eyl_roboto1")

---> Job! text
name4tubejob = vgui.Create( "DLabel", NPC_JOB_BASE )
name4tubejob:SetText( "Emploi !" )
name4tubejob:SetPos( 100, -15 )
name4tubejob:SetSize( 15000, 100 )
name4tubejob:SetFont("eyl_roboto1")

---> Looking 4 a job text
looking4 = vgui.Create( "DLabel", NPC_JOB_BASE )
looking4:SetPos( 450, -35 )
looking4:SetText( looking4headtext )
looking4:SetFont("connectfont2")
looking4:SetSize( 1500, 150 )

---> DScrollPanel
	NPC_JOB_BASE_SCROLLPANEL = vgui.Create( "DScrollPanel", NPC_JOB_BASE )
	NPC_JOB_BASE_SCROLLPANEL:SetSize( 1310, 375 )
	NPC_JOB_BASE_SCROLLPANEL:SetPos(300, 75)
 
NPC_JOB_BASE_SCROLLPANEL.CHOOSE = {}
NPC_JOB_BASE_SCROLLPANEL.JOBNAME = {}
NPC_JOB_BASE_SCROLLPANEL.Model = {}
NPC_JOB_BASE_SCROLLPANEL.PLAYERMODEL = {}
NPC_JOB_BASE_SCROLLPANEL.DESCRIPTION = {}

vector_4job = 0
for i, j in pairs(ALLJOB) do

---> Skin of the job
	NPC_JOB_BASE_SCROLLPANEL.PLAYERMODEL[i] = vgui.Create("DModelPanel", NPC_JOB_BASE_SCROLLPANEL)
	NPC_JOB_BASE_SCROLLPANEL.PLAYERMODEL[i]:SetPos( 0, 0 +125*vector_4job )
	NPC_JOB_BASE_SCROLLPANEL.PLAYERMODEL[i]:SetSize( 100, 100 )
	NPC_JOB_BASE_SCROLLPANEL.PLAYERMODEL[i]:SetModel(ALLJOB[i].MODEL) --models/player/breen.mdl
	NPC_JOB_BASE_SCROLLPANEL.PLAYERMODEL[i]:GetEntity():SetAngles(Angle(255, 255, 255))
	NPC_JOB_BASE_SCROLLPANEL.PLAYERMODEL[i]:SetCamPos( Vector( 10,10, 65 ) )
	NPC_JOB_BASE_SCROLLPANEL.PLAYERMODEL[i]:SetLookAt( Vector( 0, 0, 65 ) )
	NPC_JOB_BASE_SCROLLPANEL.PLAYERMODEL[i]:SetFOV( 70 )

	
---> Choose button
	NPC_JOB_BASE_SCROLLPANEL.CHOOSE[i] = vgui.Create( "DButton",NPC_JOB_BASE )
	NPC_JOB_BASE_SCROLLPANEL.CHOOSE[i]:SetPos( 700, 30 +125*vector_4job) 
	NPC_JOB_BASE_SCROLLPANEL.CHOOSE[i]:SetText( choice )
	NPC_JOB_BASE_SCROLLPANEL.CHOOSE[i]:SetSize( 220, 50 )
	NPC_JOB_BASE_SCROLLPANEL.CHOOSE[i]:SetFont( "connectfont" )
	NPC_JOB_BASE_SCROLLPANEL.CHOOSE[i]:SetColor(Color(0,0,0,255))
	NPC_JOB_BASE_SCROLLPANEL.CHOOSE[i]:SetParent(NPC_JOB_BASE_SCROLLPANEL )
	NPC_JOB_BASE_SCROLLPANEL.CHOOSE[i].DoClick = function(self)
		RunConsoleCommand( "say", j.COMMAND )
    end
	NPC_JOB_BASE_SCROLLPANEL.CHOOSE[i].Paint = function(self,w,h)
		colorblur(self, 6)
        surface.SetDrawColor( Color( 255, 255, 255, 20 ) )
		draw.RoundedBox(0, 0, 0, 220, 50, Color(0,128,30) )
	end
---> job name
	NPC_JOB_BASE_SCROLLPANEL.JOBNAME[i] = vgui.Create( "DLabel", NPC_JOB_BASE )
	NPC_JOB_BASE_SCROLLPANEL.JOBNAME[i]:SetPos( 126, 10+125*vector_4job)
	NPC_JOB_BASE_SCROLLPANEL.JOBNAME[i]:SetFont( "connectfont2" )
	NPC_JOB_BASE_SCROLLPANEL.JOBNAME[i]:SetText( ALLJOB[i].JOBNAME)
	NPC_JOB_BASE_SCROLLPANEL.JOBNAME[i]:SizeToContents()
	NPC_JOB_BASE_SCROLLPANEL.JOBNAME[i]:SetParent(NPC_JOB_BASE_SCROLLPANEL )
	
---> job description
	NPC_JOB_BASE_SCROLLPANEL.DESCRIPTION[i] = vgui.Create( "DLabel", NPC_JOB_BASE )
	NPC_JOB_BASE_SCROLLPANEL.DESCRIPTION[i]:SetPos( 125, 40+125*vector_4job)
	NPC_JOB_BASE_SCROLLPANEL.DESCRIPTION[i]:SetFont( "connectfont" )
	NPC_JOB_BASE_SCROLLPANEL.DESCRIPTION[i]:SetText( ALLJOB[i].DESCRIPTION)
	NPC_JOB_BASE_SCROLLPANEL.DESCRIPTION[i]:SizeToContents()
	NPC_JOB_BASE_SCROLLPANEL.DESCRIPTION[i]:SetParent(NPC_JOB_BASE_SCROLLPANEL )
	
	
	vector_4job = vector_4job + 1
end
end
usermessage.Hook("NPC_JOB_BASEFUNCTION", NPC_JOB_BASEFUNCTION) 