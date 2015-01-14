require! \detect

# play BGM form soundcloud API
class BGMModel
	!->
		SC
			..initialize client_id: \af75459baf4e59d94d49fd80a6dc787e
			..get do
				\/tracks
				q: 'sigur rós', use-HTML5-audio: true, prefer-flash: false
				(tracks) !~>
					@tracks = tracks
					@play!

	play: !->

		if @tracks-shuffle is void or @tracks-shuffle.length < 1
			@tracks-shuffle = @tracks.sort -> if 4 * Math.random! > 2 then 1 else -1

		track = @tracks-shuffle.pop!

		SC.stream do
			"/tracks/#{track.id}"
			(sound) !~>
				@current-sound = sound
				@current-sound.onfinish = !~> @play!
				@current-sound.play!
				is-iOS = detect.parse navigator.userAgent .os.family is \iOS
				if is-iOS or @is-user-click-page
					$ document .one \click, !~>
						@current-sound.play!
						@is-user-click-page = true

module.exports = BGMModel