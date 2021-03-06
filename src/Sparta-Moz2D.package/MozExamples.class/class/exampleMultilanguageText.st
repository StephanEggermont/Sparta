examples
exampleMultilanguageText
	|canvas font |
	canvas := MozCanvas extent: 700@200.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
	
	canvas transform
		translateBy: 100@50;
		apply.

	font := canvas font
		size: 28;
		weightThin;
		sansSerif;
		build.

	canvas text
		string: 'Sparta  Спарта  斯巴達  سپارٹا  ස්පාටා';
		font: font;
		origin: 20@30;
		fill;
		draw;
		string: '😂🙈🚀';
		origin: 20@60;
		draw.

	canvas asForm asMorph openInWindowLabeled: 'Text'