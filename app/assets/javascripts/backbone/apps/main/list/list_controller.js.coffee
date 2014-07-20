@Test.module "MainApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: ->
			# get items collection
			console.log "MainApp.List_initialize"
			@itemsList = App.request "todo_items:get_list"

			App.execute "when:fetched", @itemsList, =>

				console.log "MainApp.List_initialized"

				@layout = @getLayoutView @itemsList

				@listenTo @layout, "show", =>
					@panelRegion()
					@itemsRegion @itemsList

				@show @layout

		panelRegion: ->
			panelView = @getPanelView()

			console.log "showing panel view"

			# attach handler to create new item
			@listenTo panelView.on "create:item:action", =>
				@newRegion()

			@layout.panelRegion.show panelView


		newRegion: ->
			newView = App.request "new:todo:view"

			console.log "request and showing view to create a new item"

			# attach handler to perform cancel action
			newView.on "new:view:cancel:action", =>
				console.log "trigger new:view:cancel:action was fired"
				@layout.newRegion.close()

			@listenTo newView, "new:view:save:action", (model) ->
				console.log "message: new:view:save:action id=#{model.id} name=#{model.get("name")}"
				@itemsList.create(model)
#				@itemsList.save()
				@layout.newRegion.close()

			@layout.newRegion.show newView


		itemsRegion: (items) ->
			mainView = @getMainView(items)

			mainView.on "childview:item:member:clicked", (child, args) ->
				App.vent.trigger "item:member:clicked", args.model

			@listenTo mainView, "childview:delete:item", (args) ->
				alert "delete item with id=#{args.model.id} message now processing in controller"

			@listenTo mainView, "childview:item:toggle:completed", (args) ->
				console.log "list controller: toggling priority"
				args.model.set("is_completed", ! args.model.get "is_completed")

#			@listenTo mainView, "childview:item:member:clicked", (child, args) ->
#				App.vent.trigger "item:member:clicked", args.model

			@layout.itemsRegion.show mainView


		getMainView: (itemsList) ->
			new List.Items
				collection: itemsList

		getPanelView: ->
			new List.Panel

		getLayoutView: (todo_list) ->
			new List.Layout
				collection: todo_list