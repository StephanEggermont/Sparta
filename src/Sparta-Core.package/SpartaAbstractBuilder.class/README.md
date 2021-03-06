# SpartaAbstractBuilder
I am a root class of all sparta builders.

- [Painter](../SpartaAbstractPainter.class/README.md)
 - [Fill](../SpartaFillPainter.class/README.md)
 - [Stroke](../SpartaStrokePainter.class/README.md)
 - [Filter](../SpartaFilterPainter.class/README.md)
 - [Text](../SpartaTextPainter.class/README.md)
 - [Mask](../SpartaMaskPainter.class/README.md)
- [Path](../TSpartaPathBuilder.trait/README.md)
- [Font](../SpartaFontBuilder.class/README.md)

## Overview
All builders must be created and managed by canvas.

Every builder provides a way to reset resources to support reuse instead of recreation on every access.

## Public API and Key Messages

- `canvas` - return currently associated canvas 
- `canvas:` set canvas to which builder should be associated
- `reset` - reset and clean used resources

## Internal Representation and Key Implementation Points.

### Instance Variables
 - canvas: `<SpartaCanvas>` - associated sparta canvas. Subclasses can refer to it directly and use in FFI calls.

### Implementation Points

Builders may or may not be backend specific
