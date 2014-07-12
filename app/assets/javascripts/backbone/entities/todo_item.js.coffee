@Test.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.todo_item extends App.Entities.Model
		urlRoot: -> Routes.todo_index_path()

	class Entities.todo_itemCollection extends App.Entities.Collection
		model : Entities.todo_item
		url: -> Routes.todo_index_path()

	API =
		getTODO_Items: ->
			#load items from server
			console.log "todos_entities.getTODO_Items"
			todos = new Entities.todo_itemCollection
			todos.fetch
				reset: true
			todos

		getTODO_Item: (id) ->
			member = new Entities.todo_item
				id: id
			member.fetch
				reset: true

			console.log "item loaded id: #{member.id} name #{member.name}"
			member

	App.reqres.setHandler "todo_items:get_list", ->
		console.log "todo_items.handler"
		API.getTODO_Items()

	App.reqres.setHandler "todo_item:get_item", (id) ->
		console.log "todo_item.handler"
		API.getTODO_Item id