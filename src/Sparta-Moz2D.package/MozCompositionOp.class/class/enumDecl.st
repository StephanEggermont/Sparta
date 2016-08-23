enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
	OP_OVER 0
	OP_ADD 1
	OP_ATOP 2
	OP_OUT 3
	OP_IN 4
	OP_SOURCE 5
	OP_DEST_IN 6
	OP_DEST_OUT 7
	OP_DEST_OVER 8
	OP_DEST_ATOP 9
	OP_XOR 10
	OP_MULTIPLY 11
	OP_SCREEN 12
	OP_OVERLAY 13
	OP_DARKEN 14
	OP_LIGHTEN 15
	OP_COLOR_DODGE 16
	OP_COLOR_BURN 17
	OP_HARD_LIGHT 18
	OP_SOFT_LIGHT 19
	OP_DIFFERENCE 20
	OP_EXCLUSION 21
	OP_HUE 22
	OP_SATURATION 23
	OP_COLOR 24
	OP_LUMINOSITY 25
	OP_COUNT 26
	)