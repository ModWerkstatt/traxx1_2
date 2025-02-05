local soundsetutil = require "soundsetutil"

function data()

local data = soundsetutil.makeSoundSet()
	
soundsetutil.addTrackParam01
(data, "vehicle/train/traxx1/gw_roll_n.wav", 25.0,
		{ 
		{ .0, .0 },
		{ .2, .5 },
		{ 1.0, 1.3 } },
		{
		{ .0, 0.4 }, 
		{ 1.0, 1.3 } },
		"speed01")
				
		
soundsetutil.addTrackParam01
(data, "vehicle/train/traxx1/146_stand.wav", 25.0,
		{ 
		{ .0, 0.3 },
		{ .3, .0 },
		{ 1.0, .0 } },
		{
		{ .0, 1.0 },
		{ 1.0, 1.0 } },
		"speed01")
	
	
soundsetutil.addTrackParam01
(data, "vehicle/train/traxx1/146_luft.wav", 25.0,
		{
			{ .0, .0 },
			{ .20, .0 },
			{ .205, .5 },
			{ 1.0, 0.9 } },
		{
			{ .0, 1.0 },
			{ 1.0, 1.0 } }, 
		"speed01")	
	
soundsetutil.addTrackParam01
(data, "vehicle/train/traxx1/146_fahrt1.wav", 25.0,
		{ 
		{ .0, 0.0 },
		{ .001, 0.3 },
		{ .128, 1.0 },
		{ .129, 0.0 },
		{ 1.0, 0.0 } },
		{
		{ .0, 0.85 },
		{ .1, 1.0 },
		{ 1.0, 1.1 }},
		"speed01")
	
soundsetutil.addTrackParam01
(data, "vehicle/train/traxx1/146_fahrt2.wav", 25.0,
		{ 
		{ .0, 0.0 },
		{ .120, 0.0 },
		{ .129, 1.0 },
		{ .515, .6 },
		{ 1.0, 0.3 } },
		{
		{ .0, 0.55 },
		{ .1, .8 },
		{ 1.0, 1.2 }},
		"speed01")
	--[[
soundsetutil.addTrackParam01
(data, "vehicle/train/traxx1/146_besch.wav", 25.0,
		{ 
		{ .0, 0.0 },
		{ .14, 0.0 },
		{ .195, 0.4 },
		{ .265, 0.7 },
		{ .365, 0.7 },
		{ .415, 0.4 },
		{ .515, 0.4 },
		{ .615, 0.8 },
		{ .715, 0.8 },
		{ .765, 0.5 },
		{ .865, 0.4 },
		{ 1.0,0.2 } },
		{
		{ .0, 0.0 },
		{ .115, 0.4 },
		{ 1.0, 1.0 } },
		"speed01")	
]]		

soundsetutil.addEvent(data, "horn", { "vehicle/train/traxx1/146_makro.wav" }, 50.0)
soundsetutil.addTrackSqueal(data, "vehicle/train/traxx1/kurve.wav", 25.0)
soundsetutil.addTrackBrake(data, "vehicle/train/traxx1/bremse_neu.wav", 25.0, 1.0)


return data

end