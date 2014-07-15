@Test.module "MainApp.List", (List, App, Backbone, Marionette, $, _) ->

	# layout that contains view with commands - panel, view with items collection - items
	# and view opened when new item is creating - new
	class List.Layout extends App.Views.Layout
		template: "main/list/templates/list_layout"

		regions:
			panelRegion:	"#panel-region"
			newRegion:		"#new-region"
			itemsRegion:	"#items-region"

	# displays single item
	class List.Item extends App.Views.ItemView
		template: "main/list/templates/_item"
		tagName: "li"
		className: "item-member"

		modelEvents:
			"change": "render" # render item when model was changed (ie when user toggles is_completed state)

		events:
			"click #btn-delete" : "performDelete"
		#	"click" : -> @trigger "item:member:clicked", @model !!! SL opening item view by click works without this event

		# define trigger that fires event when item clicked
		triggers:
#			"click"	: "item:member:clicked"
			"click #btn-edit" : "item:member:clicked"
			"click #btn-toggle-completed" : "item:toggle:completed"

		performDelete: (e) ->
			e.stopPropagation
			console.log "performDelete"
			alert "delete action will be passed to the controller"
			@trigger "delete:item"

	# displays collection of items
	class List.Items extends App.Views.CompositeView
		template: "main/list/templates/items"
		itemView: List.Item
		itemViewContainer: "ul"

	# contains commands: Add and etc
	class List.Panel extends App.Views.ItemView
		template: "main/list/templates/_panel"

		# define trigger that fires event when button Add was pressed
		triggers:
			"click #new-item"	: "create:item:action"
			#"click"				: "item:member:clicked" SL - it seems unnecessary here. All works with trigger in Item
