React = require \react
const API_KEY = \61f94764165d971d8d920d84ef0bfdc0
const PER_PAGE = 5

class TagPageRecord

	get-current-page-index: (tag) ->
		id = JSON.stringify tag
		if !@has-own-property id
			index = Math.floor 100 * Math.random!
			@[id] = page-index: index
		else 
			obj = @[id]
			index = obj.page-index + 1			
			obj.page-index = 0 if obj.page-index > obj.page-total
			obj.page-index = 1
		index

	update-tag-page-total: (tag, page-total) !->
		id = JSON.stringify tag
		throw "no tag! #{id}" if !@has-own-property id
		@[id].page-total = page-total		

tag-page-record = new TagPageRecord

GalleryBackground = React.create-class do

	get-initial-state: ->
		current-photo-index: -1, photos: []

	component-will-mount: !->
		@get-photo-data!

	render: ->
		return <span></span> if @state.current-photo-index < 0

		photo = @state.photos[@state.current-photo-index]

		current-photo-url = "https://farm#{photo.farm}.static.flickr.com/#{photo.server}/#{photo.id}_#{photo.secret}_b.jpg"

		<div onClick={@click-handler}>
			<img className="bg" src={current-photo-url} />
		</div>

	click-handler: (e) !-> 
		return if @state.current-photo-index < 0
		@poll-background!

	get-photo-data: (current-tag) !->
		@current-tag = if current-tag then current-tag else @get-random-tag! 
		per-page = PER_PAGE
		page = tag-page-record.get-current-page-index @current-tag
		url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{API_KEY}&tags=#{@current-tag}&per_page=#{per-page}&page=#{page}&format=json&jsoncallback=?"

		$.getJSON do
			url
			@display-background

	display-background: (resp) !->
		if resp.photos.photo.length < 1
			tag-page-record.update-tag-page-total @current-tag, resp.photos.pages
			@get-photo-data @current-tag
		else
			tag-page-record.update-tag-page-total @current-tag, resp.photos.pages
			@set-state photos: resp.photos.photo, current-photo-index: 0
			@poll-background!

	poll-background: ->
		@update-background!
		clear-interval @interval
		@interval = set-interval @update-background, 10000

	update-background: !->
		current-photo-index = @state.current-photo-index
		if @state.photos.length - 1 is current-photo-index
			@get-photo-data!
		else 
			@set-state current-photo-index: current-photo-index + 1

	get-random-tag: ->
		tags = @props.tags
		tag = tags[ Math.floor( Math.random! * tags.length )]

module.exports = GalleryBackground
