@Test.module "MainApp.New", (New, App, Backbone, Marionette, $, _) ->

	New.Controller =

		newTODO: ->
			newView = @getNewView()

			newView

		getNewView: ->
			new New.Todo

