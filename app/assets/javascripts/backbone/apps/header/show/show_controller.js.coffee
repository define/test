@Test.module "HeaderApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	Show.Controller =

		show: ->
			links = @getLinkCollection()

			headerView = @getHeaderView links
			App.headerRegion.show(headerView)

		getLinkCollection: ->
			new Backbone.Collection [
				{ name: "TODO" }
				{ name: "Link2" }
				{ name: "Link3" }
			]


		getHeaderView: (links) ->
			new Show.Header
				collection: links