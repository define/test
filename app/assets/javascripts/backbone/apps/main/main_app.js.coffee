@Test.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false

	class MainApp.Router extends Marionette.AppRouter
		appRoutes:
			"todo/:id/edit"	: "editItem"
			"todo"			: "showTodoItems"


	API =
		showTodoItems: ->
			console.log "show_controller"
			new MainApp.List.Controller

		newTODOItem: ->
			MainApp.New.Controller.newTODO()

		editItem: ->
			new MainApp.Edit.Controller

	App.reqres.setHandler "new:todo:view",  ->
		console.log "create new todo view"
		API.newTODOItem()

	App.vent.on "todo:member:clicked", (member) ->
		App.navigate Routes.edit_todo_path(member.id)
		API.edit member.id, member

	MainApp.on "start", ->
		API.showTodoItems()

	App.addInitializer ->
		new MainApp.Router
			controller: API