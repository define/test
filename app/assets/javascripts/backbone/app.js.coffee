@Test = do (Backbone, Marionette) ->

	App = new Marionette.Application

	App.addRegions
		headerRegion: "#header-region"
		mainRegion:" #main-region"
		footerRegion: "#footer-region"

	App.addInitializer ->
		App.module("HeaderApp").start()
		App.module("MainApp").start()
		App.module("FooterApp").start()


	App.on "initialize:after", ->
		#if Backbone.history
		#	Backbone.history.start()
		@startHistory()
		console.log @rootRoute
		@navigate(@rootRoute, trigger : true) unless @getCurrentRoute()

	App.rootRoute = Routes.todo_index_path()

	App.reqres.setHandler "default:region", ->
		App.mainRegion

	App