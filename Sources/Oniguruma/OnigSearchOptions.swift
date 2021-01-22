//
//  OnigOptions.swift
//  Oniguruma
//
//  Created by Trevor Behlman on 1/23/21.
//

import COniguruma

public struct OnigSearchOptions: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public static let none = OnigSearchOptions(rawValue: ONIG_OPTION_NONE)
    public static let notbol = OnigSearchOptions(rawValue: ONIG_OPTION_NOTBOL)
    public static let noteol = OnigSearchOptions(rawValue: ONIG_OPTION_NOTEOL)
    public static let posixRegion = OnigSearchOptions(rawValue: ONIG_OPTION_POSIX_REGION)
    public static let checkValidityOfString = OnigSearchOptions(rawValue: ONIG_OPTION_CHECK_VALIDITY_OF_STRING)
    public static let notBeginString = OnigSearchOptions(rawValue: ONIG_OPTION_NOT_BEGIN_STRING)
    public static let notEndString = OnigSearchOptions(rawValue: ONIG_OPTION_NOT_END_STRING)
    public static let notBeginPosition = OnigSearchOptions(rawValue: ONIG_OPTION_NOT_BEGIN_POSITION)
}
