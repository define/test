Backbone.Marionette.Renderer.render = (template, data) ->
	path = JST["backbone/apps/" + template]
	unless path
		throw "Template #{template} not found!"
	path(data)

#do (Marionette) ->
#	_.extend Marionette.Renderer,
#		render: (template, data) ->
#			path = JST["backbone/apps/" + template]
#			unless path
#				throw "Template #{template} not found!"
#			path(data)