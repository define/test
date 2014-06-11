@Test.module "MainApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =
		listMain: ->
			itemsList = App.request "todo_item:get_list"

			mainView = @getMainView itemsList
			App.mainRegion.show mainView

		getMainView: (itemsList) ->
			new List.Items
				collection: itemsList
