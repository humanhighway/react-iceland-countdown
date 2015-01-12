React = require \react

const ONEDAY = 1000 * 60 * 60 * 24

CountDownLabel = React.create-class do

	get-initial-state: -> time: void

	component-will-mount: ->
		@target-day = new Date @props.targetday
		set-interval @countdown, 1000

	render: ->
		return <span></span> if @state.time is void
		<h2> { @state.time } </h2>

	countdown: ->
		countdown-time = @target-day - new Date!
		day = Math.floor countdown-time / ONEDAY
		hours = new Date(countdown-time).get-hours! - 8
		minutes = new Date(countdown-time).get-minutes!
		seconds = new Date(countdown-time).get-seconds!
		time = "#{day} 天 #{hours} 時 #{minutes} 分 #{seconds} 秒"
		@set-state { time: time }

module.exports = CountDownLabel