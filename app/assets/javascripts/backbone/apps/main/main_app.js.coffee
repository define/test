@Test.Module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false

	API =
		showTodoItems: ->
		  	# add call controller's method

	MainApp.on "start", ->
		API.showTodoItems()