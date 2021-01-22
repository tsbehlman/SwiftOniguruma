//
//  OnigCompileOptions.swift
//  Oniguruma
//
//  Created by Trevor Behlman on 1/23/21.
//

import Foundation

import COniguruma

public struct OnigCompileOptions: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = OnigCompileOptions(rawValue: ONIG_OPTION_NONE)
    public static let ignoreCase = OnigCompileOptions(rawValue: ONIG_OPTION_IGNORECASE)
    public static let extend = OnigCompileOptions(rawValue: ONIG_OPTION_EXTEND)
    public static let multiline = OnigCompileOptions(rawValue: ONIG_OPTION_MULTILINE)
    public static let singleLine = OnigCompileOptions(rawValue: ONIG_OPTION_SINGLELINE)
    public static let findLongest = OnigCompileOptions(rawValue: ONIG_OPTION_FIND_LONGEST)
    public static let findNotEmpty = OnigCompileOptions(rawValue: ONIG_OPTION_FIND_NOT_EMPTY)
    public static let negateSingleLine = OnigCompileOptions(rawValue: ONIG_OPTION_NEGATE_SINGLELINE)
    public static let dontCaptureGroup = OnigCompileOptions(rawValue: ONIG_OPTION_DONT_CAPTURE_GROUP)
    public static let captureGroup = OnigCompileOptions(rawValue: ONIG_OPTION_CAPTURE_GROUP)
    public static let wordIsAscii = OnigCompileOptions(rawValue: ONIG_OPTION_WORD_IS_ASCII)
    public static let digitIsAscii = OnigCompileOptions(rawValue: ONIG_OPTION_DIGIT_IS_ASCII)
    public static let spaceIsAscii = OnigCompileOptions(rawValue: ONIG_OPTION_SPACE_IS_ASCII)
    public static let posixIsAscii = OnigCompileOptions(rawValue: ONIG_OPTION_POSIX_IS_ASCII)
    public static let textSegmentExtendedGraphemeCluster = OnigCompileOptions(rawValue: ONIG_OPTION_TEXT_SEGMENT_EXTENDED_GRAPHEME_CLUSTER)
    public static let textSegmentWord = OnigCompileOptions(rawValue: ONIG_OPTION_TEXT_SEGMENT_WORD)
}
