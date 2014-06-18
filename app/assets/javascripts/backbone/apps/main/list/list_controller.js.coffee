@Test.module "MainApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		listMain: ->
			console.log "1"
			itemsList = App.request "todo_item:get_list"

			@layout = @getLayoutView itemsList

			@layout.on "show", =>
				@panelRegion()
				@mainRegion(itemsList)

			App.mainRegion.show @layout

			console.log "2"

			#mainView = @getMainView itemsList
			#App.mainRegion.show mainView

		getMainView: (itemsList) ->
			new List.Items
				collection: itemsList

		getLayoutView: (todo_list) ->
			new List.Layout
				collection: todo_list

		panelRegion: ->
			panelView = @getPanelView()

			console.log "showing panel view"

			# attach handler to create new item action
			panelView.on "create:item:action", =>
				@newRegion()

			@layout.panelRegion.show panelView

		mainRegion: (items) ->
			mainView = @getMainView(items)
			@layout.itemsRegion.show mainView

		getPanelView: ->
			new List.Panel

		newRegion: ->
			newView = App.request "new:todo:view"

			console.log "request and showing view to create a new item"

			# attach handler to cancel action
			newView.on "view:cancel:action", =>
				@layout.newRegion.close()

			@layout.newRegion.show newView
