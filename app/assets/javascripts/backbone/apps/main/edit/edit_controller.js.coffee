@Test.module "MainApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Controller extends App.Controllers.Base

	# creates and returns EditView
		initialize: (options) ->
			{ todo, id } = options
			todo or= App.request "todo_item:get_item", id

			@listenTo todo, "updated", ->
				App.vent.trigger "todo:updated", todo

			App.execute "when:fetched", todo, =>
				console.log "todo_fetched " + todo.id
				@editView = @getEditView todo

				# if user pressed Cancel - catch it and fire event
				@editView.on "edit:view:cancel:action" ,  ->
					console.log "catched pressing Cancel in edit.Controller"
					App.vent.trigger "edit:view:cancel:action"

				@show @editView

		getEditView: (todo) ->
			new Edit.Todo
				model:todo

