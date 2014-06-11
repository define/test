@Test.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false

	API =
		showTodoItems: ->
			console.log "show_controller"
			MainApp.List.Controller.listMain()

	MainApp.on "start", ->
		API.showTodoItems()