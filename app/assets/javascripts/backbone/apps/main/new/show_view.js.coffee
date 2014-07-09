@Test.module "MainApp.New", (New, App, Backbone, Marionette, $, _) ->

	class New.Todo extends App.Views.ItemView
		template: "main/new/templates/new_todo"

		# trigger to fire event when Cancel button was pressed
		triggers:
			"click #cancel-new-item" : "new:view:cancel:action"