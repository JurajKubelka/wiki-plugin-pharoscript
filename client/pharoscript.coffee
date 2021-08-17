###
 * Federated Wiki : Pharo Script Plugin
 *
 * Licensed under the MIT license.
 * https://github.com/fedwiki/wiki-plugin-pharoscript/blob/master/LICENSE.txt
###

escape = (str) ->
	String(str)
		.replace(/&/g, '&amp;')
		.replace(/"/g, '&quot;')
		.replace(/'/g, '&#39;')
		.replace(/</g, '&lt;')
		.replace(/>/g, '&gt;')

class window.plugins.pharoscript
	load = (callback) ->
		wiki.getScript '/plugins/pharoscript/prettify.js', callback
		if (!$("link[href='/plugins/pharoscript/prettify.css']").length)
			$('<link href="/plugins/pharoscript/prettify.css" rel="stylesheet" type="text/css">').appendTo("head")

	@emit: (div, item) ->
		load -> div.append "<pre class='prettyprint'>#{prettyPrintOne(escape(item.text))}</pre>"
	@bind: (div, item) ->
		load -> div.dblclick -> wiki.textEditor div, item
		