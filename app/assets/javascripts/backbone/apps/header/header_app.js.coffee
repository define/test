@Test.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->

	API =
		show: ->
			HeaderApp.Show.Controller.show()

	HeaderApp.on "start", ->
		API.show()
