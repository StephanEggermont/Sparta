geometry - testing
strokeContainsPoint: aPoint options: aStrokeOptions on: aSpartaCanvas
	"Return true if a given point lies within this path as if it would be stroked with provided stroke options"
	<return: #Boolean>

	^ (aSpartaCanvas path
		moveTo: self from;
		lineTo: self to;
		build) strokeContainsPoint: aPoint options: aStrokeOptions on: aSpartaCanvas