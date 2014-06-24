@Test.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.todo_item extends App.Entities.Model
		urlRoot: -> Routes.todo_index_path()

	class Entities.todo_itemCollection extends App.Entities.Collection
		model : Entities.todo_item
		url: -> Routes.todo_index_path()

	API =
		getTODO_Items: ->
			#load items from server
			todos = new Entities.todo_itemCollection
			todos.fetch
				reset: true
			todos

	App.reqres.setHandler "todo_item:get_list", ->
		API.getTODO_Items()