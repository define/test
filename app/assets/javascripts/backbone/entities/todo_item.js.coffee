@Test.Module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.todo_item extends Backbone.Model

	class Entities.todo_itemCollection extends Backbone.Collection
		model : Entities.todo_item

	API =
		getTODO_Items: ->
			new Entities.todo_itemCollection [
				{ title: "TODO item 1" }
				{ title: "TODO item 2" }
				{ title: "TODO item 3" }
			]

	App.reqres.addHandler "todo_item:get_list", ->
		API.getTODO_Items()