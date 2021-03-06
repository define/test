@Test.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Model extends Backbone.Model

		save: (data, options = {}) ->
			isNew = @isNew()

			data or= []
			modified = new Date().toISOString()
			data.modified_date = modified
			data.created_date = modified if isNew

			_.defaults options,
				wait: true
				success: _.bind(@saveSuccess, @, isNew)

			#call save from base class
			super data, options

		saveSuccess: (isNew) =>
			console.info "success", @, isNew
			if isNew ## model is being created
				@trigger "created", @
			else ## model is being updated
				@trigger "updated", @