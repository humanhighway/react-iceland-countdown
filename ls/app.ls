require! {
	\react
	\./components/CountDownApp
	\./../sass/app.scss
}

props = 
	place: \冰島 
	target-day: "2015/03/26 20:30:00"
	tags: [ 'iceland' 'Blue Lagoon' 'Vik' 'Kerið' 'Reykjavík' 
					'Hverfjall' 'Hallgrimskirkja' 'Pingvellir National Park' 'Gullfoss' 'Jökulsárlón'
					'Vatnajökull National Park' 'Skogarfoss' 'Klambratún' 'Egilsstaðir' 'Landmannalaugar'
					'Höfn' 'Dettifoss' 'Grjotagja' 'Namaskard' 'Krafla'
					'Godafoss Wasserfall' 'Diamond Circle' 'Skútustaðir' 'Seyðisfjörður'
					'Akureyrarkirkja' 'Akureyri' 'Frostastaðavatn' 'Snæfellsnesvegur'
					'Snæfellsjökull' 'Reynisdrangar' 'Askja' 'Dynjandi' 'Budardalur'
					'Siglufjörður' 'Hólmavík' 'Geysir' 'Mývatn' ]

react.render do
	CountDownApp props, null
	document.get-element-by-id \app


# play sound form soundcloud API
SC
	..initialize client_id: \af75459baf4e59d94d49fd80a6dc787e
	..get do
		\/tracks
		q: 'sigur rós'
		(tracks) !-> 
			random-index = Math.floor tracks.length * Math.random!
			track = tracks[random-index]
			SC.stream do
				"/tracks/#{track.id}"
				(sound) !-> sound.play! 

