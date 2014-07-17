@Test.module "MainApp.New", (New, App, Backbone, Marionette, $, _) ->

	New.Controller =

		# creates and returns NewView
		newTODO: ->
			newView = @getNewView()

			newView

		getNewView: ->
			new New.Todo
				model : App.request "todo_item:create"