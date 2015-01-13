React = require \react
require! \./CountDownLabel
require! \./GalleryBackground

CountDownApp = React.create-class do
	render: ->
		<div className="container">
			<h2>距離 <span className="place"> {@props.place} </span> 還有</h2>
			<CountDownLabel targetday={@props.target-day} />
			<GalleryBackground tags={@props.tags} />
		</div>

module.exports = CountDownApp