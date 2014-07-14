do (Backbone) ->

	_.extend Backbone.Marionette.Application::,

		navigate: (route, options = {}) ->
#			route = "#" + route if route.charAt(0) is "/"
			console.log "navigate to: " + route
			Backbone.history.navigate route, options

		getCurrentRoute: ->
			frag = Backbone.history.fragment
			if _.isEmpty(frag) then null else frag

		startHistory: ->
			if Backbone.history
				Backbone.history.start()
