@Test.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

	class Form.Controller extends Marionette.Controller

		initialize: (options = {}) ->
			@contentView = options.view

			@formLayout = @getFormLayout options.config

			@listenTo @formLayout, "show", @formContentRegion
			@listenTo @formLayout, "close", @close

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