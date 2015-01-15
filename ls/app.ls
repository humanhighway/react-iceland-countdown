require! {
	\react
	\./components/CountDownApp
	\./BGMModel
	\./../sass/app.scss
}

props = 
	place: \冰島 
	target-day: "2015/03/26 19:00:00"
	tags: [ 'iceland' 'Blue Lagoon' 'Vik' 'Kerið' 'Reykjavík' 
					'Hverfjall' 'Hallgrimskirkja' 'Pingvellir National Park' 'Gullfoss' 'Jökulsárlón'
					'Vatnajökull National Park' 'Skogarfoss' 'Klambratún' 'Egilsstaðir' 'Landmannalaugar'
					'Höfn' 'Dettifoss' 'Grjotagja' 'Namaskard' 'Krafla'
					'Godafoss Wasserfall' 'Diamond Circle' 'Skútustaðir' 'Seyðisfjörður'
					'Akureyrarkirkja' 'Akureyri' 'Frostastaðavatn' 'Snæfellsnesvegur'
					'Snæfellsjökull' 'Reynisdrangar' 'Askja' 'Dynjandi' 'Budardalur'
					'Siglufjörður' 'Hólmavík' 'Geysir' 'Mývatn' ]

# init react app

react.render do
	CountDownApp props, null
	document.get-element-by-id \app

# play bgm

$ document .ready !~> 
	set-timeout do
		!~> bgm = new BGMModel!
		0