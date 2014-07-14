@Test.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Button extends App.Entities.Model

	class Entities.ButtonsCollection extends App.Entities.Collection
		model : Entities.Button

	API =
		getFormButtons: (buttons, model) ->
			buttons = @getDefaultButtons buttons, model

			array = []
			array.push { type: "cancel",  className: "button small secondary radius", text: buttons.cancel }
			array.push { type: "primary", className: "button small radius",           text: buttons.primary }

			array.reverse() if buttons.placement is "left"

			buttonCollection = new Entities.ButtonsCollection array
			buttonCollection.placement = buttons.placement
			buttonCollection
			
		getDefaultButtons: (buttons, model) ->
			_.defaults buttons,
				primary: if model.isNew() then "Create" else "Update"
				cancel: "Cancel"
				placement: "right"

	App.reqres.setHandler "form:button:entities", (buttons = {}, model) ->
		API.getFormButtons buttons, model