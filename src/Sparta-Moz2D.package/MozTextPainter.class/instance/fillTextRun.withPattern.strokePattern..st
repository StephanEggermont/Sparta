drawing
fillTextRun: aTextRun withPattern: aFillPattern strokePattern: aStrokePattern
	| aMetricsProvider aDrawMode |
	self
		assert: [ aTextRun isNotNil ]
		description: [ 'A text run must not be nil' ].

	aMetricsProvider := aTextRun metricsProvider.
	(clip and: [ aMetricsProvider isNotNil ]) ifTrue: [ 
		maxWidth ifNotNil: [ aMetricsProvider width: maxWidth ].
		aMetricsProvider measureTextRun: aTextRun.
		end := end min: aMetricsProvider longestSubstring ].

	aDrawMode := drawMode ifNil: [ MozTextDrawMode GLYPH_FILL value ].
	aDrawMode := aDrawMode | MozTextDrawMode GLYPH_STROKE value.

	self
		primDrawTextRun: aTextRun
		provider: (aMetricsProvider ifNotNil: #propertyProvider ifNil: [ FFIExternalObject null ])
		x: baseline x
		y: baseline y
		drawMode: aDrawMode
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		fillPattern: (aFillPattern asMozPatternOn: canvas)
		strokePattern: (aStrokePattern asMozPatternOn: canvas)