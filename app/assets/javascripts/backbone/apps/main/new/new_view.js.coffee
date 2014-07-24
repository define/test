@Test.module "MainApp.New", (New, App, Backbone, Marionette, $, _) ->

	class New.Todo extends App.Views.ItemView
		template: "main/new/templates/new_todo"

		events:
			"submit form": "saveItem"

		# trigger to fire event when Save or Cancel button was pressed
		triggers:
			"click #cancel-new-item" : "new:view:cancel:action"
#			"click #save-new-item"   : "new:view:save:action"

		saveItem: (e) ->
			console.log "Save clicked"

#			disable post on server
			e.preventDefault()
			e.stopPropagation()

#			save values from form into model and send to the backend
			data = Backbone.Syphon.serialize @
			@model.set data
			@model.save data

#			send message that new item was created
			@trigger "new:view:save:action", @model