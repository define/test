@Test.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

	class Form.FormWrapper extends App.Views.Layout
		template: "form/form"

		tagName: "form"
		attributes: ->
			"data-type": @getFormDataType()

		regions:
			formContentRegion: "#form-content-region"

		ui:
			buttonContainer: "ul.inline-list"

		triggers:
			"submit" 							: "form:submit"
			"click [data-form-button='cancel']"	: "form:cancel"

		serializeData: ->
			footer: @options.config.footer
			buttons: @options.config.buttons ? false

		onShow: ->
			_.defer =>
				@focusFirstInput() if @options.config.focusFirstInput
				@buttonPlacement() if @options.config.buttons

		buttonPlacement: ->
			@ui.buttonContainer.addClass @options.config.buttons.placement

		focusFirstInput: ->
			@$(":input:visible:enabled:first").focus()

		getFormDataType: ->
			if @model.isNew() then "new" else "edit"