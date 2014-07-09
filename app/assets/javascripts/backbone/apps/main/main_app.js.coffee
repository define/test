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

		editItem: (id, member) ->
			new MainApp.Edit.Controller
				id: id
				todo: member

#			MainApp.Edit.Controller.editItem member

	App.reqres.setHandler "new:todo:view",  ->
		console.log "create new todo view"
		API.newTODOItem()

	App.vent.on "item:member:clicked", (member) ->
		App.navigate Routes.edit_todo_path(member.id)
		API.editItem member.id, member

	App.vent.on "edit:view:cancel:action", ->
		# Cancel was pressed on Edit form - show items list
		console.log "Cancel on edit view pressed - go back to the list view"
		App.navigate Routes.todo_index_path()
		API.showTodoItems()

	MainApp.on "start", ->
		API.showTodoItems()

	App.addInitializer ->
		new MainApp.Router
			controller: API