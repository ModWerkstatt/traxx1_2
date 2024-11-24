function data()
return {
	info = {
		minorVersion = 1,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "train", "bombardier", "traxx", "electric", "universal" },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },
        params = {
			{
				key = "br185_vorspann",
				name = _("Vorspann_br185"),
				values = { "No", "Yes", },
				tooltip = _("option_vorspann_br185_desc"),
				defaultIndex = 0,
			},
			{
				key = "br185_fake",
				name = _("Fake_br185"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_br185_desc"),
				defaultIndex = 0,
			},
			{
				key = "br185_ch",
				name = _("ch_br185"),
				values = { "No", "Yes", },
				tooltip = _("option_ch_br185_desc"),				
				defaultIndex = 1,
			},
			{
				key = "br185_privat",
				name = _("privat_br185"),
				values = { "No", "Yes", },
				tooltip = _("option_privat_br185_desc"),				
				defaultIndex = 1,
			},
        },
	},
	options = {
	},
	runFn = function (settings, modParams)
		
		local vorspannFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.traxx1 and data.metadata.traxx1.vorspann == true then				
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2
				--return false
			end	
			--return true
			return data
		end 
		
		local fakeFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.traxx1 and data.metadata.traxx1.fake == true then		
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		
		local chFilter = function(fileName, data)		
			if data.metadata.transportVehicle and data.metadata.traxx1 and data.metadata.traxx1.ch == true then			
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2				
			end				
			return data
		end 
		
		
		if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]					
			if params["br185_vorspann"] == 0 then				
				--addFileFilter("model/transportVehicle", vorspannFilter)	
				addModifier("loadModel", vorspannFilter)
			end
			if params["br185_fake"] == 0 then				
				addModifier("loadModel", fakeFilter)
			end
			if params["br185_ch"] == 0 then				
				addModifier("loadModel", chFilter)
			end
			if params["br185_privat"] == 0 then				
				addModifier("loadModel", acFilter)
			end
			
		else
			--addFileFilter("model/transportVehicle", vorspannFilter)			
			addModifier("loadModel", fakeFilter)
			addModifier("loadModel", chFilter)
			addModifier("loadModel", privatFilter)
		end			
	end
}
end
