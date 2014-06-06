@Test = do (Backbone, Marionette) ->

	App = new Marionette.Application

	App.addRegions
		headerReagion: "#header-region"
		mainRegion:" #main-region"
		footerRegion: "#footer-region"

	App