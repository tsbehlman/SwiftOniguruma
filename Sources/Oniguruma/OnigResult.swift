//
//  OnigResult.swift
//  Oniguruma
//
//  Created by Trevor Behlman on 1/24/21.
//

import Foundation
import COniguruma

func makeIndexRange(from start: Int32, to end: Int32, in string: String) -> Range<String.Index> {
    let lowerBound = string.index(string.startIndex, offsetBy: String.IndexDistance(start))
    let upperBound = string.index(string.startIndex, offsetBy: String.IndexDistance(end))
    return lowerBound..<upperBound
}

public class OnigResult {
    private var region: OnigRegion
    private let string: String
    public var range: NSRange {
        get {
            NSRange(indexRange, in: string)
        }
    }
    public let indexRange: Range<String.Index>
    public let resultType: NSTextCheckingResult.CheckingType = .regularExpression
    public let numberOfRanges: Int

    init(forRegion region: OnigRegion, in string: String) {
        self.region = region
        self.string = string
        indexRange = makeIndexRange(from: region.beg.pointee, to: region.end.pointee, in: string)
        numberOfRanges = Int(region.num_regs)
    }

    deinit {
        onig_region_free(&region, 1)
    }

    public func range(at index: Int) -> NSRange {
        return NSRange(indexRange(at: index), in: string)
    }

    public func indexRange(at index: Int) -> Range<String.Index> {
        if index == 0 {
            return indexRange
        }

        return makeIndexRange(from: region.beg.advanced(by: index).pointee, to: region.end.advanced(by: index).pointee, in: string)
    }
}
