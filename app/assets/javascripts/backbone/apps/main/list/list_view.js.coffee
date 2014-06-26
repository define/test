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
			"click"				: "item:member:clicked"
