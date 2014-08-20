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
		console.log "initialize:after in App"
		@startHistory()
		console.log "@rootRoute ="+@rootRoute+" getCurrentRoute()= "+@getCurrentRoute()
		@navigate(@rootRoute, trigger : true) unless @getCurrentRoute()
#		@navigate("todo/1/edit", trigger : true) unless @getCurrentRoute()

	App.rootRoute = "todo" #Routes.todo_index_path()

	App.Constants = {
		base_url : "http://127.0.0.1:3000/"
	}

	App.reqres.setHandler "default:region", ->
		App.mainRegion

	App