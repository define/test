@Test.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

	class Form.Controller extends Marionette.Controller

		initialize: (options = {}) ->
			@contentView = options.view

			@formLayout = @getFormLayout options.config

			@listenTo @formLayout, "show", @formContentRegion
			@listenTo @formLayout, "close", @close
			@listenTo @formLayout, "form:submit", @formSubmit
			@listenTo @formLayout, "form:cancel", @formCancel

		formCancel: ->
			@contentView.triggerMethod "form:cancel"

		formSubmit: ->
			data = Backbone.Syphon.serialize @formLayout
			if @contentView.triggerMethod("form:submit", data) isnt false
				console.log("form submit")
				console.log(data)
				model = @contentView.model
				@processFormSubmit data, model

		processFormSubmit: (data, model) ->
			model.save data

		formContentRegion: ->
			@formLayout.formContentRegion.show @contentView

		getFormLayout: (options = {}) ->
			config = @getDefaultConfig _.result(@contentView, "form")

			buttons = @getDefaultButtons config.buttons

			new Form.FormWrapper
				config: config
				model: @contentView.model
				buttons: buttons

		getDefaultConfig: (config = {}) ->
			_.defaults config,
				footer: true
				focusFirstInput: true
				buttons: @getDefaultButtons config.buttons

		getDefaultButtons: (buttons = {}) ->
			_.defaults buttons,
				primary: "Save"
				cancel: "Cancel"
				placement: "right"


		onClose: ->
			console.log "onClose", @

	App.reqres.setHandler "form:wrapper", (contentView, options = {}) ->
		throw new Error "No model found inside of form's contentView" unless contentView.model
		formController = new Form.Controller
			view: contentView
			config: options
		formController.formLayout