@Test.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->

	API =
		show: ->
			FooterApp.Show.Controller.show()

	FooterApp.on "start", ->
		API.show()
