@Test.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.todo_item extends Backbone.Model

	class Entities.todo_itemCollection extends Backbone.Collection
		model : Entities.todo_item

	API =
		getTODO_Items: ->
			new Entities.todo_itemCollection [
				{ title: "TODO item 1", completed: false }
				{ title: "TODO item 2", completed: false }
				{ title: "TODO item 3", completed: true }
			]

	App.reqres.setHandler "todo_item:get_list", ->
		API.getTODO_Items()