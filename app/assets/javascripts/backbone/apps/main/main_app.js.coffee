@Test.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false

	class MainApp.Router extends Marionette.AppRouter
		appRoutes:
			"todo/:id/edit"	: "editItem"
			"todo"			: "showTodoItems"


	API =
		showTodoItems: ->
			console.log "MainApp.showTodoItems()"
			new MainApp.List.Controller

		newTODOItem: ->
			newView = MainApp.New.Controller.newTODO()
			newView

		editItem: (id, member) ->
			console.log "MainApp.editItem()"
#			new MainApp.Edit.Controller
#				id: id
#				todo: member

			MainApp.Edit.Controller.edit id, member

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

#	this call is unnecessary now, we open list by default when no client's route is specified
#	MainApp.on "start", ->
#		console.log "MainApp on start"
#		API.showTodoItems() this call is unnecessary now, we open list as default rout

	App.addInitializer ->
		new MainApp.Router
			controller: API