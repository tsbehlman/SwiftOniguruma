//
//  OnigSyntax.swift
//  Oniguruma
//
//  Created by Trevor Behlman on 1/23/21.
//

import Foundation
import COniguruma

public struct OnigSyntax {
    let rawValue: UnsafeMutablePointer<OnigSyntaxType>

    public init(rawValue: UnsafeMutablePointer<OnigSyntaxType>) {
        self.rawValue = rawValue
    }

    public static let onigurumaDefault = OnigSyntax(rawValue: OnigDefaultSyntax)
    public static let asIs = OnigSyntax(rawValue: &OnigSyntaxASIS)
    public static let posixBasic = OnigSyntax(rawValue: &OnigSyntaxPosixBasic)
    public static let posixExtended = OnigSyntax(rawValue: &OnigSyntaxPosixExtended)
    public static let emacs = OnigSyntax(rawValue: &OnigSyntaxEmacs)
    public static let grep = OnigSyntax(rawValue: &OnigSyntaxGrep)
    public static let gnuRegex = OnigSyntax(rawValue: &OnigSyntaxGnuRegex)
    public static let java = OnigSyntax(rawValue: &OnigSyntaxJava)
    public static let perl = OnigSyntax(rawValue: &OnigSyntaxPerl)
    public static let perlNG = OnigSyntax(rawValue: &OnigSyntaxPerl_NG)
    public static let ruby = OnigSyntax(rawValue: &OnigSyntaxRuby)
    public static let oniguruma = OnigSyntax(rawValue: &OnigSyntaxOniguruma)
}
