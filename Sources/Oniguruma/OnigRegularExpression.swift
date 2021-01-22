//
//  OnigRegularExpression.swift
//  OnigurumaPackageDescription
//
//  Created by Trevor Behlman on 1/23/21.
//

import Foundation
import COniguruma

public class OnigRegularExpression {
    private var onigRegex: OnigRegex? = nil
    public let pattern: String

    public init?(pattern: String, options: OnigCompileOptions = .none, syntax: OnigSyntax = .onigurumaDefault) {
        self.pattern = pattern
        var err: OnigErrorInfo = .init()
        var status: Int32 = ONIG_NORMAL

        pattern.utf8CString.withUnsafeBytes() { pointer in
            let patternStart = pointer.bindMemory(to: OnigUChar.self).baseAddress!
            let patternEnd = patternStart.advanced(by: pointer.distance(from: pointer.startIndex, to: pointer.endIndex))
            status = onig_new(
                &onigRegex,
                patternStart,
                patternEnd,
                options.rawValue,
                &OnigEncodingUTF8,
                syntax.rawValue,
                &err
            )
        }

        if status != ONIG_NORMAL {
            /*let error = OnigErrorInfo()
            let errorStringPointer = UnsafeMutablePointer<OnigUChar>.allocate(capacity: Int(ONIG_MAX_ERROR_MESSAGE_LEN))
            onig_error_code_to_str(errorStringPointer, status, &error)*/
            onig_free(onigRegex)
            return nil
        }
    }

    deinit {
        onig_free(onigRegex)
    }

    public func firstMatch(in string: String, options: OnigSearchOptions, range: NSRange) -> OnigResult? {
        return firstMatch(in: string, options: options, range: String.Index(utf16Offset: range.lowerBound, in: string)..<String.Index(utf16Offset: range.upperBound, in: string))
    }

    public func firstMatch(in string: String, options: OnigSearchOptions, range: Range<String.Index>) -> OnigResult? {
        let location = string[string.startIndex..<range.lowerBound].utf8.count
        let length = string[range].utf8.count

        let region = onig_region_new()
        var status: Int32 = 0

        string.utf8CString.withUnsafeBytes() { pointer in
            let stringPointer = pointer.bindMemory(to: OnigUChar.self).baseAddress!
            let stringMaxPointer = stringPointer.advanced(by: pointer.count)
            let stringStartPointer = stringPointer.advanced(by: location)
            let stringEndPointer = stringStartPointer.advanced(by: length)
            status = onig_search(onigRegex, stringPointer, stringMaxPointer, stringStartPointer, stringEndPointer, region, options.rawValue)
        }

        if status != ONIG_MISMATCH {
            return OnigResult(forRegion: region!.pointee, in: string)
        } else {
            onig_region_free(region, 1)
            return nil
        }
    }
}
