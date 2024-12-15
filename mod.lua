function data()
return {
	info = {
		minorVersion = 0,
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
				key = "traxx1_vorspann",
				name = _("Vorspann_traxx1"),
				values = { "No", "Yes", },
				tooltip = _("option_vorspann_traxx1_desc"),
				defaultIndex = 0,
			},
			{
				key = "traxx1_fake",
				name = _("Fake_traxx1"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_traxx1_desc"),
				defaultIndex = 0,
			},
			{
				key = "traxx1_pz",
				name = _("pz_traxx1"),
				values = { "No", "Yes", },
				tooltip = _("option_pz_traxx1_desc"),
				defaultIndex = 1,
			},
			{
				key = "traxx1_gz",
				name = _("gz_traxx1"),
				values = { "No", "Yes", },
				tooltip = _("option_gz_traxx1_desc"),
				defaultIndex = 1,
			},
			{
				key = "traxx1_ch",
				name = _("ch_traxx1"),
				values = { "No", "Yes", },
				tooltip = _("option_ch_traxx1_desc"),
				defaultIndex = 1,
			},
			{
				key = "traxx1_sa",
				name = _("sa_traxx1"),
				values = { "No", "Yes", },
				tooltip = _("option_sa_traxx1_desc"),
				defaultIndex = 1,
			},
			{
				key = "traxx1_db",
				name = _("db_traxx1"),
				values = { "No", "Yes", },
				tooltip = _("option_db_traxx1_desc"),
				defaultIndex = 1,
			},
			{
				key = "traxx1_sbb",
				name = _("sbb_traxx1"),
				values = { "No", "Yes", },
				tooltip = _("option_sbb_traxx1_desc"),
				defaultIndex = 1,
			},
			{
				key = "traxx1_privat",
				name = _("privat_traxx1"),
				values = { "No", "Yes", },
				tooltip = _("option_privat_traxx1_desc"),
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

		local pzFilter = function(fileName, data)
			if data.metadata.transportVehicle and data.metadata.traxx1 and data.metadata.traxx1.pz == true then
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2
			end
			return data
		end

		local gzFilter = function(fileName, data)
			if data.metadata.transportVehicle and data.metadata.traxx1 and data.metadata.traxx1.gz == true then
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
		
		local saFilter = function(fileName, data)
			if data.metadata.transportVehicle and data.metadata.traxx1 and data.metadata.traxx1.sa == true then
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2
			end
			return data
		end
		
		local dbFilter = function(fileName, data)
			if data.metadata.transportVehicle and data.metadata.traxx1 and data.metadata.traxx1.db == true then
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2
			end
			return data
		end
		
		local sbbFilter = function(fileName, data)
			if data.metadata.transportVehicle and data.metadata.traxx1 and data.metadata.traxx1.sbb == true then
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2
			end
			return data
		end
		
		local privatFilter = function(fileName, data)
			if data.metadata.transportVehicle and data.metadata.traxx1 and data.metadata.traxx1.privat == true then
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2
			end
			return data
		end


		if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["traxx1_vorspann"] == 0 then
				--addFileFilter("model/transportVehicle", vorspannFilter)
				addModifier("loadModel", vorspannFilter)
			end
			if params["traxx1_fake"] == 0 then
				addModifier("loadModel", fakeFilter)
			end
			if params["traxx1_pz"] == 0 then
				addModifier("loadModel", pzFilter)
			end
			if params["traxx1_gz"] == 0 then
				addModifier("loadModel", gzFilter)
			end
			if params["traxx1_ch"] == 0 then
				addModifier("loadModel", chFilter)
			end
			if params["traxx1_sa"] == 0 then
				addModifier("loadModel", saFilter)
			end
			if params["traxx1_db"] == 0 then
				addModifier("loadModel", dbFilter)
			end
			if params["traxx1_sbb"] == 0 then
				addModifier("loadModel", sbbFilter)
			end
			if params["traxx1_privat"] == 0 then
				addModifier("loadModel", privatFilter)
			end

		else
			--addFileFilter("model/transportVehicle", vorspannFilter)
			addModifier("loadModel", fakeFilter)
			addModifier("loadModel", pzFilter)
			addModifier("loadModel", gzFilter)
			addModifier("loadModel", chFilter)
			addModifier("loadModel", saFilter)
			addModifier("loadModel", dbFilter)
			addModifier("loadModel", sbbFilter)
			addModifier("loadModel", privatFilter)
		end
	end
}
end
