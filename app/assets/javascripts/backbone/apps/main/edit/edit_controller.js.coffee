@Test.module "MainApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Controller extends App.Controllers.Base

		initialize: (options) ->
			{ todo, id } = options
			todo or= App.request "todo_item:get_item", id
#			todo = App.request "todo_item:get_item", id

			@listenTo todo, "updated", ->
				App.vent.trigger "todo:updated", todo

			App.execute "when:fetched", todo, =>
				console.log "todo_fetched id: #{todo.id} " + todo.name
				@editView = @getEditView todo

				# if user has pressed Cancel - catch it and fire event
				@editView.on "edit:view:cancel:action" ,  ->
					console.log "catched pressing Cancel in edit.Controller"
					App.vent.trigger "edit:view:cancel:action"

				console.log "show EditView"
				@show @editView

		# creates and returns EditView
		getEditView: (todo) ->
			new Edit.Todo
				model:todo

