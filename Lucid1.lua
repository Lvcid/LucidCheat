chat.AddText( cyan, "[LucidsCheat] ", pink, "Initialized!")
chat.AddText( cyan, "[LucidsCheat] ", pink, "Made by: Lucid")
chat.AddText( cyan, "[LucidsCheat] ", pink, "To open the menu, bind a key to l_menu!")
chat.AddText( cyan, "[LucidsCheat] ", pink, "Aimbot: B (Be sure to enable it in hack menu first!)")

LocalPlayer():EmitSound("UI/buttonclick.wav", 500, 100)

MsgC( orange,[[
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
]])
						 
MsgC( cyan,[[
 _                       _       _   _       
 | |                     (_)     | | ( )      
 | |       _   _    ___   _    __| | |/   ___ 
 | |      | | | |  / __| | |  / _` |     / __|
 | |____  | |_| | | (__  | | | (_| |     \__ \
 |______|  \__,_|  \___| |_|  \__,_|     |___/
   _____   _                      _           
  / ____| | |                    | |          
 | |      | |__     ___    __ _  | |_   
 | |      | '_ \   / _ \  / _` | | __|  
 | |____  | | | | |  __/ | (_| | | |_  
  \_____| |_| |_|  \___|  \__,_|  \__| 
]])
MsgC( orange,[[
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
]])
MsgC( cyan,[[
           
]])
MsgC( pink,[[
[LucidsCheat] Initialized!
[LucidsCheat] Made by: Lucid
[LucidsCheat] To open the menu, bind a key to l_menu!
[LucidsCheat] Aimbot: B (Be sure to enable it in hack menu first!
]])

-- AntiLuaStealer --
-- Desc: Aparently, according to CmdrMatthew, this stops the script from being stolen by servers! --

local old = file.Read
function file.Read(name, usePath)
    if name == "Lucid.lua" then
        return ""
    else
        return old(name, usePath)
    end
end

CreateClientConVar("_propchams", 0, true, false)
CreateClientConVar("_lazereyes", 0, true, false)
CreateClientConVar("_rainbowphys", 0, true, false)
CreateClientConVar("_chams", 0, true, false)

local shitAim = {}
shitAim.TargetMethod = {}
shitAim.Settings = {}
shitAim.TargetMethod["rage"] = false
shitAim.TargetMethod["closest"] = true
shitAim.TargetMethod["aimpoint"] = false
shitAim.Settings["sAimbone"] = "ValveBiped.Bip01_Head1"
shitAim.Settings["AimBotKey"] = KEY_B

local function HasHead(ent)
	local bone = ent:LookupBone(shitAim.Settings["sAimbone"])
	if bone then
		return true 
	else
		return false
	end
end

local function CanSeeHead(ent)
		local wishedbone  = ent:LookupBone(shitAim.Settings["sAimbone"])
		local trendpos = ent:GetBonePosition(wishedbone)
        local tr = {}
        tr.start = LocalPlayer():GetShootPos()
        tr.endpos = trendpos
        tr.filter = {LocalPlayer(), ent}
        tr.mask = MASK_SHOT
    local trace = util.TraceLine(tr)
    if (trace.Fraction == 1) then
        return true
    else
        return false
    end    
end

local function CanSeeOBB(ent)
		local obbendpos = ent:LocalToWorld(ent:OBBCenter())
        local tr = {}
        tr.start = LocalPlayer():GetShootPos()
        tr.endpos = obbendpos
        tr.filter = {LocalPlayer(), ent}
        tr.mask = MASK_SHOT
    local trace = util.TraceLine(tr)
    if (trace.Fraction == 1) then
        return true
    else
        return false
    end    
end

-- core
local cvar = CreateClientConVar
local getcvarnum = GetConVarNumber

surface.CreateFont( "dat", {
	font = "Arial",
	size = 21,
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
	additive = true,
	outline = true,
} )

surface.CreateFont( "dat2", {
	font = "Arial",
	size = 20,
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
	additive = true,
	outline = true,
} )
-- core

-- menu
concommand.Add( "l_menu", function()
local main = vgui.Create( "DFrame" )
main:SetPos( 50,50 )
main:SetSize( 460, 350 )
main:SetTitle( "Lucid's Private Cheat" )
main:SetVisible( true )
main:SetDraggable( true )
main:ShowCloseButton( true )
main.Paint = function( self, w, h ) 
	draw.RoundedBox( 0, 0, 0, w, h, Color(100,180,250,250) ) 
 end
 main:MakePopup()
 
 local nice = vgui.Create( "DPropertySheet", main )
nice:SetParent( main )
nice:SetPos( 0, 30 )
nice:SetSize( 460, 350 )
nice.Paint = function( self, w, h ) 
	draw.RoundedBox( 0, 0, 0, w, h, Color(170,255,0) ) 
end

local chat = vgui.Create( "DPropertySheet", main )
chat:SetParent( main )
chat:SetPos( 200, 30 )
chat:SetSize( 300, 350 )
chat.Paint = function( self, w, h ) 
	draw.RoundedBox( 0, 0, 0, w, h, Color(100,180,250,250) ) 
end

 local lhop = vgui.Create( "DCheckBoxLabel", main )
lhop:SetPos( 10,70 )
lhop:SetText( "Bunny Hop" )
lhop:SetTextColor( Color( 0, 0, 0 ) )
lhop:SetConVar( "lhop" ) 
lhop:SizeToContents() 

local esp = vgui.Create( "DCheckBoxLabel", main )
esp:SetPos( 10,100 )
esp:SetText( "ESP" )
esp:SetTextColor( Color( 0, 0, 0 ) )
esp:SetConVar( "LucidESP" ) 
esp:SizeToContents()

local aim = vgui.Create( "DCheckBoxLabel", main )
aim:SetPos( 10,40 )
aim:SetText( "Aim Snap" )
aim:SetTextColor( Color( 0, 0, 0 ) )
aim:SetConVar( "LucidAIM" ) 
aim:SizeToContents() 

local bot = vgui.Create( "DCheckBoxLabel", main )
bot:SetPos( 10,130 )
bot:SetText( "AimBOT" )
bot:SetTextColor( Color( 0, 0, 0 ) )
bot:SetConVar("l_aimbot") 
bot:SizeToContents() 

local rphys = vgui.Create( "DCheckBoxLabel", main )
rphys:SetPos( 10,160 )
rphys:SetText( "Rainbow Physgun" )
rphys:SetTextColor( Color( 0, 0, 0 ) )
rphys:SetConVar("_rainbowphys" )  
rphys:SizeToContents() 

local leyes = vgui.Create( "DCheckBoxLabel", main )
leyes:SetPos( 10,190 )
leyes:SetText( "Lazer Eyes" )
leyes:SetTextColor( Color( 0, 0, 0 ) )
leyes:SetConVar("_lazereyes" ) 
leyes:SizeToContents() 

local chams = vgui.Create( "DCheckBoxLabel", main )
chams:SetPos( 10,220 )
chams:SetText( "Chams" )
chams:SetTextColor( Color( 0, 0, 0 ) )
chams:SetConVar("_chams" ) 
chams:SizeToContents() 

local pchams = vgui.Create( "DCheckBoxLabel", main )
pchams:SetPos( 10,250 )
pchams:SetText( "Prop Chams" )
pchams:SetTextColor( Color( 0, 0, 0 ) )
pchams:SetConVar("_propchams" ) 
pchams:SizeToContents() 

end )

-- bhop
shouldbhop = cvar("lhop", "0", false, false)
hook.Add("Think", "mlhop", function()
    if GetConVarNumber("lhop") != 1 or LocalPlayer():GetMoveType() == MOVETYPE_NOCLIP then return end
        if (input.IsKeyDown(KEY_SPACE)) then
            if LocalPlayer():IsOnGround() then
                if LocalPlayer():IsTyping() then return end
                    RunConsoleCommand("+jump")
                    lhop = 1
                else
                    RunConsoleCommand("-jump")
                    lhop = 0
            end
			elseif LocalPlayer():IsOnGround() then
				if lhop == 1 then
                    RunConsoleCommand("-jump")
                    lhop = 0
			end
        end
end)
--bhop

-- esp
shouldesp = cvar("LucidESP", "0", false, false)
hook.Add( "HUDPaint", "LucidESP", function()
if GetConVarNumber("LucidESP") != 1 then return end
	for k,v in pairs ( player.GetAll() ) do
 
		local PositionName = ( v:GetPos() + Vector( 0,0,80 ) ):ToScreen()
		local Name = ""
		local ply = LocalPlayer()
		local origin = v:GetPos()
		local top = v:OBBMaxs()
		local bottom = v:OBBMins()
		local eye = v:EyeAngles()

		if v == LocalPlayer() then Name = "" else Name = v:Name() end

		draw.SimpleTextOutlined( v:Name(), "dat2", PositionName.x , PositionName.y - 15, Color(155,205,248), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0 , 0 ))
		draw.SimpleTextOutlined( v:GetUserGroup(), "dat2", PositionName.x , PositionName.y - 55, Color(0,255,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0 , 0 ))
       	draw.SimpleTextOutlined( v:Health(), "dat2", PositionName.x , PositionName.y  - 35, Color(255,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(80, 0 , 0 ))
		
		cam.Start3D()
			render.DrawWireframeBox( v:GetPos(), Angle( 0, v:EyeAngles().y, 0), v:OBBMins(), v:OBBMaxs(), Color( 0, 100, 255 ) )
		cam.End3D()

		end
 
end )
-- esp

-- 180
function doa180()
aim1 = LocalPlayer():GetAimVector():Angle()
LocalPlayer():SetEyeAngles(aim1 - Angle(0, 180, 0))
end

concommand.Add("lucid_180", doa180)
-- 180

-- aim snap
shouldsnap = cvar("LucidAIM", "0", false, false)
function aimsnap() 
if GetConVarNumber("LucidAIM") != 1 then return end
	local suspect = LocalPlayer()
	local trace = util.GetPlayerTrace( suspect ) 
	local trace2 = util.TraceLine( trace ) 
	if trace2.HitNonWorld then 
		local target = trace2.Entity 
		if target:IsPlayer() then 
			local targethead = target:LookupBone("ValveBiped.Bip01_Head1")
			local targetheadpos,targetheadang = target:GetBonePosition(targethead) 
			suspect:SetEyeAngles((targetheadpos - suspect:GetShootPos()):Angle()) 
		end
	end
end
hook.Add("Think","aimsnap",aimsnap) 

-- aim snap

-- aim bot

CreateClientConVar("l_aimbot", "0", false, false)
CreateClientConVar("l_aimbot_ignore_friends", "0", false, false)
CreateClientConVar("l_aimbot_ignore_buddies", "0", false, false)
CreateClientConVar("l_aimbot_ignore_team", "0", false, false)

local Locked
local aimBuddies = {}


local target

local function shitaimbot(cmd)

if GetConVarNumber("l_aimbot") != 1 then return end

	local AimBone
	local lpos = LocalPlayer():GetShootPos()
	

	
	
	local aimPlayers = {}
	for _, v in pairs(player.GetAll()) do
	
		table.insert(aimPlayers, v)
		
		if GetConVarNumber("l_aimbot_ignore_team") == 1 then
			if v:Team() == LocalPlayer():Team() then
				table.RemoveByValue(aimPlayers, v)
			end
		end
		
		if GetConVarNumber("l_aimbot_ignore_friends") == 1 then
			if v:GetFriendStatus() != "none" then
				table.RemoveByValue(aimPlayers, v)
			end
		end
		
		if v == LocalPlayer() then
			table.RemoveByValue(aimPlayers, v)
		end
		
		if !CanSeeOBB(v) then
			table.RemoveByValue(aimPlayers, v)
		end
		
		if v:Team() == TEAM_SPECTATOR then
			table.RemoveByValue(aimPlayers, v)
		end
			
	end



	
	if shitAim.TargetMethod["rage"] then
		for _, v in pairs(aimPlayers) do
			if v:Alive() then
				target = v
			end
		end
	end
	
	if shitAim.TargetMethod["closest"] then
		local allply = aimPlayers
        local plyDist = 100000
        for i = 1, #allply do
            v = allply[i]
			if v:Alive() then
            local plyDist2 = LocalPlayer():GetPos():Distance(v:GetPos())
            if plyDist2 < plyDist then
                plyDist = plyDist2
                target = v
            end
			end
		end
	end

	if shitAim.TargetMethod["aimpoint"] then
		local allply = aimPlayers
        local plyDist = 100000
        for i = 1, #allply do
            v = allply[i]
			if v:Alive() then
            local plyDist2 = LocalPlayer():GetEyeTrace().HitPos:Distance(v:GetPos())
            if plyDist2 < plyDist then
                plyDist = plyDist2
                target = v
            end
			end
		end
	end


for _, b in pairs(aimPlayers) do
	if !HasHead(target) then
		AimBone = target:LocalToWorld(target:OBBCenter())
		else
		AimBone = target:GetBonePosition(target:LookupBone("ValveBiped.Bip01_Head1"))
	end
end



	
			if input.IsKeyDown(shitAim.Settings["AimBotKey"]) then
				if GetConVarNumber("l_aimbot_ignore_team") == 1 and target:Team() == LocalPlayer():Team() then return end
				if GetConVarNumber("l_aimbot_ignore_friends") == 1 and target:GetFriendStatus() != "none" then return end
				if !AimBone then return end
				
				cmd:SetViewAngles((AimBone - lpos):Angle())
			end
end



cvars.AddChangeCallback("l_aimbot", function()
        if GetConVarNumber("l_aimbot") == 1 then
                hook.Add("CreateMove", "aimbotshit", shitaimbot)
        else
                hook.Remove("aimbotshit")
        end
end)

-- aim bot

-- PropESP
hook.Add( "HUDPaint", "PropESP", function()
	for k,v in pairs ( ents.FindByClass( "prop_physics" ) ) do
		if GetConVarNumber("propchams") == 1 then
			cam.Start3D(EyePos(), EyeAngles())
				if v:IsValid() then
					render.SuppressEngineLighting( false )
					render.MaterialOverride( propchams )
					render.SetBlend(0.2)
					render.SetColorModulation( 0, 255, 0)
					v:DrawModel()
			cam.End3D()
			end
		end
	end
end)
-- PropESP

-- Rainbow Physgun --
-- Desc: Your Physgun will change colors rapidly, clientside only. --

local Num = 0
local function rainbow()
	if GetConVarNumber("_rainbowphys") == 1 then
    Num = Num + 1
        LocalPlayer():SetWeaponColor(Vector(math.Rand(0,1),math.Rand(0,1),math.Rand(0,1)))
        Num = 0
	end
end

if GetConVarNumber("_rainbowphys") == 1 then
	hook.Add("Think","rainbowphis",rainbow)
else
	hook.Remove("Think","rainbowphis",rainbow)
end

cvars.AddChangeCallback("_rainbowphys", function() 
	if GetConVarNumber("_rainbowphys") == 1 then
		hook.Add("CreateMove", "rainbowphis", rainbow)
	else
		hook.Remove("CreateMove", "rainbowphis")
	    LocalPlayer():SetWeaponColor(Vector(0,1,1))
        Num = 0
	end
end)

-- Rainbow Physgun

-- watermark
hook.Add( "HUDPaint", "watermark", function()
draw.SimpleTextOutlined( "Lucid's Cheat", "dat", ScrW()/50, ScrH()/40, cyan, TEXT_ALIGN_TOP, TEXT_ALIGN_CENTER, 50, Color(0,0,0,0) )
end)
-- watermark¯/ø,