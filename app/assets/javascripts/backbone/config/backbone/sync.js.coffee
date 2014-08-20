#do (Backbone) ->
#	BASE_URL = 'http://127.0.0.1:3000/'
#	baseSync = Backbone.sync
#
#	Backbone.sync = (method, model, options) ->
#		url = _.result(model, 'url')
#		options.url = BASE_URL+url if url && !options.url
#		console.log "sync for url: " + url
#		console.log "resutl url is: " + options.url
#
#		# enable cross-domain calls
#		options.crossDomain = true if !options.crossDomain
#		options.xhrFields = {withCredentials:true} if !options.xhrFields
#
#		baseSync method, model, options