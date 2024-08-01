
-- [Client] doesn't need to hear all this, he's a highly trained professional!
if CLIENT then

	-- EP2 Waterfall doesn't seem to cache correctly
	game.AddParticles( "particles/waterfall.pcf" )

	-- We've assured the [Server] that nothing will go wrong...
	return

end

-- Create a function to make the map actually useable for normal people
local function rp_cosmoscity_fixes()

	-- If this isn't the one single map it should be applied to...
	if string.lower( game.GetMap() ) != "rp_cosmoscity_v1b" then

		-- Don't run, duh.
		return
		
	end

	-- The map has a proprietary day-night system meant for the OCRP gamemode, and 99% of you will never use it.
	for _, v in pairs( ents.FindByName( "daynight_brush" ) ) do

		v:Remove()

	end

	-- The map has a proprietary spawn system meant for the OCRP gamemode, and 99% of you will never use it.
	for _, v in pairs( ents.FindByClass( "func_spawntrigger" ) ) do

		v:Remove()

	end

	-- The map has a proprietary blah blah blah you get the fuckin' idea 'er, boyo!
	for _, v in pairs( ents.FindByClass( "info_player_start" ) ) do

		v:Remove()

	end

	-- Make a handful of new, actually *useable* spawnpoints.
	-- If you *need* more than 4 let me know and I'll add them.

	-- setpos 273.829407 -3543.691406 72.031250;setang 10.361517 -91.247726 0.000000
	local newSpawn = ents.Create( "info_player_start" )
	newSpawn:SetPos( Vector( 288 , -3580 , 72 ) )
	newSpawn:SetAngles( Angle( 0 , 270 , 0 ) )
	newSpawn:Spawn()
	newSpawn:Activate()

	local newSpawn2 = ents.Create( "info_player_start" )
	newSpawn2:SetPos( Vector( 376 , -3580 , 72 ) )
	newSpawn2:SetAngles( Angle( 0 , 270 , 0 ) )
	newSpawn2:Spawn()
	newSpawn2:Activate()

	local newSpawn3 = ents.Create( "info_player_start" )
	newSpawn3:SetPos( Vector( 288 , -3660 , 72 ) )
	newSpawn3:SetAngles( Angle( 0 , 270 , 0 ) )
	newSpawn3:Spawn()
	newSpawn3:Activate()

	local newSpawn4 = ents.Create( "info_player_start" )
	newSpawn4:SetPos( Vector( 376 , -3660 , 72 ) )
	newSpawn4:SetAngles( Angle( 0 , 270 , 0 ) )
	newSpawn4:Spawn()
	newSpawn4:Activate()

	-- Map has no env_cubemap entities either
	-- local cubemapFix = ents.Create( "env_cubemap" )
	-- cubemapFix:Spawn()
	-- cubemapFix:Activate()

end

-- Now we call the function on initial load, and on cleanups...
hook.Add( "InitPostEntity" , "rp_cosmoscity_fixes_InitPostEntity" , rp_cosmoscity_fixes )
hook.Add( "PostCleanupMap" , "rp_cosmoscity_fixes_PostCleanupMap" , rp_cosmoscity_fixes )
