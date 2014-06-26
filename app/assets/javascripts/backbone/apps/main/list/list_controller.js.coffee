@Test.module "MainApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: ->
			# get items collection
			console.log "MainApp.List_initialize"
			itemsList = App.request "todo_items:get_list"
			App.execute "when:fetched", itemsList, =>

				console.log "MainApp.List_initialized"

				@layout = @getLayoutView itemsList

				@listenTo @layout, "show", =>
					@panelRegion()
					@itemsRegion itemsList

				@show @layout

		getMainView: (itemsList) ->
			new List.Items
				collection: itemsList

		getLayoutView: (todo_list) ->
			new List.Layout
				collection: todo_list

		panelRegion: ->
			panelView = @getPanelView()

			console.log "showing panel view"

			# attach handler to create new item
			panelView.on "create:item:action", =>
				@newRegion()

			@layout.panelRegion.show panelView

		itemsRegion: (items) ->
			mainView = @getMainView(items)
			@layout.itemsRegion.show mainView

			@listenTo mainView, "childview:todo:member:clicked", (child, args) ->
				App.vent.trigger "todo:member:clicked", args.model


		getPanelView: ->
			new List.Panel

		newRegion: ->
			newView = App.request "new:todo:view"

			console.log "request and showing view to create a new item"

			# attach handler to perform cancel action
			newView.on "view:cancel:action", =>
				@layout.newRegion.close()

			@layout.newRegion.show newView
