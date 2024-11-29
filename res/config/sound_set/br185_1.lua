local soundeffectsutil = require "soundeffectsutil"

function data()
return {
	tracks = {
		{ name = "vehicle/br146_0/gw_roll_n.wav", refDist = 20.0 },	
		{ name = "vehicle/br146_0/146_stand.wav", refDist = 20.0 },
		{ name = "vehicle/br146_0/146_luft.wav", refDist = 20.0 },
		{ name = "vehicle/br146_0/146_fahrt2.wav", refDist = 20.0 },				
		{ name = "vehicle/br146_0/146_besch.wav", refDist = 20.0 },
		
		{ name = "vehicle/br146_0/146_fahrt1.wav", refDist = 20.0 },			
		
		{ name = "vehicle/br146_0/kurve.wav", refDist = 15.0 },
		{ name = "vehicle/br146_0/bremse_neu.wav", refDist = 20.0 },
		{ name = "vehicle/br146_0/146_fahrt1.wav", refDist = 20.0 },					
	},
	
	events =  {
		horn = { names = { "vehicle/br146_0/146_makro.wav" }, refDist = 20.0 }
	},

	updateFn = function (input)
		local speed01 = input.speed / input.topSpeed
		local refWeight = 20.0	
		local axleRefWeight = 10.0
		
		return {
			tracks = {
				--Roll
				{ 
					gain = soundeffectsutil.sampleCurve({ 
									{ .0, .0 },
									{ .2, .5 },
									{ 1.0, 1.3 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ 
									{ .0, 0.4 }, 
									{ 1.0, 1.3 } }, input.speed01)
				},
			--stand
				{ 
					gain = soundeffectsutil.sampleCurve({ 
									{ .0, 0.3 },
									{ .3, .0 },
									{ 1.0, .0 } }, input.power01),
					pitch = soundeffectsutil.sampleCurve({ 
									{ .0, 1.0 },
									{ 1.0, 1.0 } }, input.speed01)
				},
				--luefter
				{ 
					gain = soundeffectsutil.sampleCurve({ 
									{ .0, .0 },
									{ .215, .0 },
									{ .245, .9 },
									{ 1.0, 0.9 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ 
									{ .0, 1.0 },
									{ 1.0, 1.0 } }, input.power01)
				},
			-- fahrt 2
				{
					gain = soundeffectsutil.sampleCurve({ 
									{ .0, 0.0 },
									{ .115, 0.0 },
									{ .135, 1.0 },
									{ .515, .6 },
									{ 1.0, 0.3 } }, input.speed01)								
							soundeffectsutil.sampleCurve({ 				
									{ .0, 0.2 },
									{ .1, .6 },
									{ 1.0, 1.0 }}, input.power01),
					pitch = soundeffectsutil.sampleCurve({ 
									{ .0, 0.0 },
									{ .124, 0.0 },
									{ .125, 0.8 },
									{ .215, 1.0 },
									{ .415, 1.3 },
									{ 1.0, 1.7 } }, input.speed01)		
				},
			--Beschleunigung					
				{
					gain = soundeffectsutil.sampleCurve({ 
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
									{ 1.0,0.2 } }, input.speed01)
					soundeffectsutil.sampleCurve({ 
									{ .0, 0.0 },
									{ .1, 0.0 },
									{ .3, 0.5 },									
									{ 1.0,1.0 } }, input.power01),							
					pitch = soundeffectsutil.sampleCurve({ 
									{ .0, 0.0 },
									{ .115, 0.4 },
									{ 1.0, 1.0 } }, input.speed01)		
			},
			
				br146_fahrt1 (input),
				soundeffectsutil.squeal(input.speed, input.sideForce, input.maxSideForce),
				soundeffectsutil.brake(input.speed, input.brakeDecel, 1.25),
				soundeffectsutil.ebremse(input.speed, input.brakeDecel, 0.7),				
		},
			events = {
						horn = { gain = 0.9, pitch = 1.0 }			
			}
		}
	end
	}
end
