@Test.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
	API =
		showHeader: ->
			HeaderApp.Show.Controller.showHeader()

	HeaderApp.on "start", ->
		API.showHeader()
