@Test.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Header extends Entities.Model

	class Entities.HeaderCollection extends Entities.Collection
		model: Entities.Header

	API =
		getHeaders: ->
			new Backbone.Collection [
				{ name: "TODO" }
				{ name: "Link2" }
				{ name: "Link3" }
			]

	App.reqres.setHandler "header:entities", ->
		API.getHeaders()
