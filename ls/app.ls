require! {
	\react
	\./components/CountDownApp.cjsx
	\./../sass/app.scss
}

props = 
	place: \__ #\冰島 
	target-day: "2015-03-26 20:30:00"
	keyword-place: <[ iceland bluelogon ]>

react.render do
	CountDownApp props, null
	document.get-element-by-id \app
