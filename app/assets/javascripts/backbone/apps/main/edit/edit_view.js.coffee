@Test.module "MainApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Layout extends App.Views.Layout
		template: "main/edit/templates/edit_layout"
		modelEvents:
				"updated" : "render"

		# define triggers that fires event when button Add or Cancel was pressed
#		triggers:
#			"click #cancel-item" : "edit:view:cancel:action"
#			"click #update-item" : "update:item:action"

		regions:
			formRegion: "#form-region"

	class Edit.Todo extends App.Views.ItemView
		template: "main/edit/templates/edit_todo"

#		form:
#			buttons:
#				primary: "foo"
#				cancel: "bar cancel"
#				placement: "left"
#			footer: false
#			focusFirstInput: false