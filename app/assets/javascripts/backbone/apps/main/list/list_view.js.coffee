@Test.module "MainApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "main/list/templates/list_layout"

		regions:
			panelRegion:	"#panel-region"
			newRegion:		"#new-region"
			itemsRegion:	"#items-region"

	class List.Item extends App.Views.ItemView
		template: "main/list/templates/_item"
		tagName: "li"

	class List.Items extends App.Views.CompositeView
		template: "main/list/templates/items"
		itemView: List.Item
		itemViewContainer: "ul"

	class List.Panel extends App.Views.ItemView
		template: "main/list/templates/_panel"

		triggers:
			"click #new-item" : "create:item:action"
