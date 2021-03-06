!! TSpartaPathBuilder

I declare an API of a path builder.

!! Overview

I provide a set of methods to create an arbitrary vector path.
I can work in both relative and absolute mode, that influences on how path is created.

!! Public API and Key Messages

- ==absolute== - switch to absolute coordinates mode. Every Point provided as argument to my methods is supposed to be specified in global coordinates.
- ==relative== - switch to relative coordinates mode. Points provided as arguments are treated as related deltas from current path's end point.
- ==moveTo:== - moves current end point to a Point.
- ==lineTo:== - adds a line segment from current end point to a Point
- ==curveVia:to:== - adds a Quadratic Bezier curve via an anchor point to aPoint
- ==curveVia:and:to:== - adds a Cubic Bezier curve via two anchor points to a Point
- ==*ArcTo:== - adds an arc segment to a Point.
- ==close== - closes a path, connecting current end point with start point with line
- ==finish== - to end path construction and return an instance SpartaPath. Any message send to PathBuilder after finish will result in a crash.

!! Example:

Create a rectangle path similar to (20@20 corner: 40@40):
[[[language=smalltalk
path := canvas path
	relative;
	moveTo: 20@20;
	lineTo: 0@20;
	lineTo: (20@0) negated;
	lineTo: (0@20) negated;
	close;
	finish.
]]]

!! Internal Representation and Key Implementation Points.


    Implementation Points
