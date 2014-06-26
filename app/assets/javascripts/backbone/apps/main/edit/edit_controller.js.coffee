@Test.module "MainApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Controller extends App.Controllers.Base

	# creates and returns EditView
		initialize: (options) ->
			{ todo, id } = options
			todo or= App.request "todo_item:get_item", id

			@listenTo todo, "updated", ->
				App.vent.trigger "todo:updated", todo

			App.execute "when:fetched", todo, =>
				@editView = @getEditView todo

				@show @editView

		getEditView: (todo) ->
			new Edit.Todo
				model:todo

