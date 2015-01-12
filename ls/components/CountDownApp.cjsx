React = require \react
require! \./CountDownLabel.cjsx

CountDownApp = React.create-class do

	render: ->
		<div>
			<h2>距離 <span className="place"> {@props.place} </span> 還有</h2>
			<CountDownLabel targetday={@props.target-day} />
		</div>

module.exports = CountDownApp