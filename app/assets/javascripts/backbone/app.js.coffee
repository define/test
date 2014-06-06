@Test = do (Backbone, Marionette) ->

	App = new Marionette.Application

	App.addRegions
		headerReagion: "#header-region"
		mainRegion:" #main-region"
		footerRegion: "#footer-region"

	App.on "initialize:after", ->
		if Backbone.history
			Backbone.history.start()

	App