//
//  Display.swift
//  Counter
//
//  Created by Brian Hill github.com/brianhill on 1/26/16.
//

import UIKit

// Each digit has 8 segments, lettered a-h.
let segments = 8

// We'll still call it a seven-segment component (SSC), even though the decimal point gives it an eight part.

// Coordinates within a 11x20 grid.

let gridWidth = CGFloat(11)
let gridHeight = CGFloat(20)

//              11
//    012345678901
//  0 aaaaaaaaabb
//  1 aaaaaaaaabb
//  2 ff       bb
//  3 ff       bb
//  4 ff       bb
//  5 ff       bb
//  6 ff       bb
//  7 ff       bb
//  8 ff       bb
//  9 fxgggggggxb
// 10 exgggggggxc
// 11 ee       cc
// 12 ee       cc
// 13 ee       cc
// 14 ee       cc
// 15 ee       cc
// 16 ee   hh  cc
// 17 ee   hh  cc
// 18 dddddddddcc
// 19 dddddddddcc
// 20

let segmentOutlines = [
    0,  0,  9,  0,  9,  2,  0,  2, // a
    9,  0, 11,  0, 11, 10,  9, 10, // b
    9, 10, 11, 10, 11, 20,  9, 20, // c
    0, 18,  9, 18,  9, 20,  0, 20, // d
    0, 10,  2, 10,  2, 18,  0, 18, // e
    0,  2,  2,  2,  2, 10,  0, 10, // f
    1,  9, 10,  9, 10, 11,  1, 11, // g -- g actually overstrikes a bit of b, c, e and f. These overstrikes are shown with x's in the diagram above.
    5, 16,  7, 16,  7, 18,  5, 18, // h
]

let middle = gridHeight / 2.0
let tiltPlusMinus = CGFloat(1.0)

let ledOnColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [1.0, 0.1, 0.2, 1.0]) // mostly red, but with a little green and a little more blue
let ledOffColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [0.2, 0.1, 0.1, 1.0]) // reddish gray

let segmentMasks = [
    0b00111111, // 0
    0b00000110, // 1
    0b01011011, // 2
    0b01001111, // 3
    0b01100110, // 4
    0b01101101, // 5
    0b01111101, // 6
    0b00000111, // 7
    0b01111111, // 8
    0b01101111, // 9
    0b10000000, // .
    0b01000000, // -
    0b00000000, //
]

func indicesToPoint(i: Int, j: Int, insetRect: CGRect) -> CGPoint {
    let offset = 8 * i + 2 * j
    let rawX = segmentOutlines[offset]
    let rawY = segmentOutlines[offset + 1]
    let x = insetRect.origin.x + (CGFloat(rawX) - tiltPlusMinus * (CGFloat(rawY) - middle) / middle) * insetRect.size.width / gridWidth
    let y = insetRect.origin.y + CGFloat(rawY) * insetRect.size.height / gridHeight
    return CGPointMake(x, y)
}

let insetFraction = CGFloat(0.25)

// This function creates a rect that is inset from the supplied rect.
// The SSC will actually only fill the inset rect.
func rectToInsetRect(rect: CGRect) -> CGRect {
    let width = rect.size.width
    let height = rect.size.height
    let insetWidthAmount = insetFraction * width
    let insetHeightAmount = insetFraction * height
    return CGRectMake(rect.origin.x + insetWidthAmount, rect.origin.y + insetHeightAmount, width - 2.0 * insetWidthAmount, height - 2.0 * insetHeightAmount)
}

class Display: UIView {
    
    // Draws a segment given its four corners, supplied in clockwise order.
    // I put one bug in this code. Find it and fix it. Once it's fixed, you'll
    // see a nicely drawn 8.
    func drawSegment(context: CGContextRef, upperLeft: CGPoint, upperRight: CGPoint, lowerRight: CGPoint, lowerLeft: CGPoint, on:Bool) {
        let color = on ? ledOnColor : ledOffColor
        CGContextSetFillColorWithColor(context, color)
        CGContextMoveToPoint(context, upperLeft.x, upperLeft.y)
        CGContextAddLineToPoint(context, upperRight.x, upperRight.y)
        CGContextAddLineToPoint(context, lowerRight.x, lowerRight.y)
        CGContextAddLineToPoint(context, lowerLeft.x, lowerLeft.y)
        CGContextAddLineToPoint(context, upperLeft.x, upperLeft.y)
        CGContextFillPath(context)
    }
    
    // Draws one seven-segment component (SSC).
    func drawSSC(context:CGContextRef, sscRect:CGRect, mask:Int) {
        let insetRect = rectToInsetRect(sscRect)
        for segment in 0 ..< segments {
            let upperLeft  = indicesToPoint(segment, j:0, insetRect:insetRect)
            let upperRight = indicesToPoint(segment, j:1, insetRect:insetRect)
            let lowerRight = indicesToPoint(segment, j:2, insetRect:insetRect)
            let lowerLeft  = indicesToPoint(segment, j:3, insetRect:insetRect)
            let on = Bool(mask & 1<<segment)
            self.drawSegment(context, upperLeft:upperLeft, upperRight:upperRight, lowerRight:lowerRight, lowerLeft:lowerLeft, on:on)
        }
    }
    
    // Here are the 15 masks, one for each digit of the 15-digit display. This constant array is currently unused.
    // Mask is for the following display: -1.23456790 99
    let masks = [
        segmentMasks[11], // -
        segmentMasks[1],  // 1
        segmentMasks[10], // .
        segmentMasks[2],  // 2
        segmentMasks[3],  // 3
        segmentMasks[4],  // 4
        segmentMasks[5],  // 5
        segmentMasks[6],  // 6
        segmentMasks[7],  // 7
        segmentMasks[8],  // 8
        segmentMasks[9],  // 9
        segmentMasks[0],  // 0
        segmentMasks[12], //
        segmentMasks[9],  // 9
        segmentMasks[9],  // 9
    ]
    
    // This is a 15-digit display.
    let digits = 15

    // When you are done with this function, it should draw all 15 SSC's and it should use the masks array above to
    // make the 15 SSCs show -1.23456790 99.
    // Except for the bug fix in drawSegment, there is no need to modify any code outside of this function.
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        let bounds = self.bounds
        let segmentHeight = bounds.size.height
        let xOrigin = bounds.origin.x
        let yOrigin = bounds.origin.y
        // This needs re-doing. The segmentWidth is the whole view width. It should only be one-fifteenth of that.
        let sscRect = CGRectMake(xOrigin, yOrigin, bounds.size.width, segmentHeight)
        // This needs completing. It only draws one SSC. It needs to be put in a loop to show all 15 SSCs.
        drawSSC(context, sscRect:sscRect, mask:segmentMasks[8])
    }

}
