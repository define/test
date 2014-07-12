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
			new Form.FormWrapper
				config: config

		getDefaultConfig: (config = {}) ->
			_.defaults config,
				footer: true
				focusFirstInput: true

		onClose: ->
			console.log "onClose", @

	App.reqres.setHandler "form:wrapper", (contentView, options = {}) ->
		formController = new Form.Controller
			view: contentView
			config: options
		formController.formLayout