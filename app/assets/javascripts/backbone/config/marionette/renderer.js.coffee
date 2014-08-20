do (Marionette) ->
	_.extend Marionette.Renderer,
		lookups: ["app/assets/javascripts/backbone/apps/", "app/assets/javascripts/backbone/components/", "backbone/apps/", "backbone/components/"]

		render: (template, data) ->
			return if template is false
			path = @getTemplate(template)
			throw "Template #{template} not found!" unless path
			path(data)

		getTemplate: (template) ->
			for lookup in @lookups
				for path in [template, @withTemplate(template)]
					if JST[lookup + path  + ".jst"]
						return JST[lookup + path  + ".jst"]
					else if JST[lookup + path]
						return JST[lookup + path]
#					return JST[lookup + path  + ".jst"] if JST[lookup + path  + ".jst"]

		withTemplate: (string) ->
			array = string.split("/")
			array.splice(-1, 0, "templates")
			array.join("/")

#		render: (template, data) ->
#			path = @getTemplate(template)
#			throw "Template #{template} not found!" unless path
#			path(data)

#		getTemplate: (template) ->
#			for path in [template, template.split("/").insertAt(-1, "templates").join("/")]
#				for lookup in @lookups
#					return JST[lookup + path] if JST[lookup + path]

