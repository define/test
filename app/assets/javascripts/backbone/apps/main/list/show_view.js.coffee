@Test.module "MainApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Item extends Marionette.ItemView
		template: "main/list/templates/_item"
		tagName: "li"

	class List.Items extends Marionette.CompositeView
		template: "main/list/templates/items"
		itemView: List.Item
		itemViewContainer: "ul"