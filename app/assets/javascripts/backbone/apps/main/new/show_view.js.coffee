@Test.module "MainApp.New", (New, App, Backbone, Marionette, $, _) ->

	class New.Todo extends App.Views.ItemView
		template: "main/new/templates/new_todo"

		triggers:
			"click #cancel-new-item" : "view:cancel:action"