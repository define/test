@Test.module "MainApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Todo extends App.Views.ItemView
		template: "main/edit/templates/edit_todo"
		modelEvents:
				"updated" : "render"

		# define trigger that fires event when button Add was pressed
#		triggers:
#			"click #update-item" : "update:item:action"