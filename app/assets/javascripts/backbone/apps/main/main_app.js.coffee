@Test.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false

	API =
		showTodoItems: ->
			#console.log "show_controller"
			MainApp.List.Controller.listMain()

		newTODOItem: ->
			MainApp.New.Controller.newTODO()

	App.reqres.setHandler "new:todo:view",  ->
		console.log "create new todo view"
		API.newTODOItem()

	MainApp.on "start", ->
		API.showTodoItems()