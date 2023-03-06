import UIKit

extension String {
    public func withLineHeight(height: CGFloat) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = height
        paragraphStyle.maximumLineHeight = height
        let attributedText = NSMutableAttributedString(
            string: self,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return attributedText
    }

    public func withFont(font: UIFont) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(
            string: self,
            attributes: [NSAttributedString.Key.font: font])
        return attributedText
    }
}

extension NSMutableAttributedString {
    public func withKern(kern: CGFloat) -> NSMutableAttributedString {
        guard length > 0 else {
            return self
        }
        addAttribute(.kern, value: kern, range: NSRange(location: 0, length: length))
        return self
    }

    public func underlined() -> NSMutableAttributedString {
        guard length > 0 else {
            return self
        }
        addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: length)
        )
        return self
    }

    public func withLineSpacing(spacing: CGFloat) -> NSMutableAttributedString {
        guard length > 0 else {
            return self
        }
        let paragraphStyle = currentParagraphStyle
        paragraphStyle.lineSpacing = spacing
        addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
        return self
    }

    public func withLineHeight(height: CGFloat) -> NSMutableAttributedString {
        guard length > 0 else {
            return self
        }

        let paragraphStyle = currentParagraphStyle
        paragraphStyle.minimumLineHeight = height
        paragraphStyle.maximumLineHeight = height
        addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
        return self
    }

    public func withColor(color: UIColor) -> NSMutableAttributedString {
        guard length > 0 else {
            return self
        }
        addAttribute(.foregroundColor, value: color, range: NSRange(location: 0, length: length))
        return self
    }

    public func withTextAlignment(alignment: NSTextAlignment) -> NSMutableAttributedString {
        guard length > 0 else {
            return self
        }
        let paragraphStyle = currentParagraphStyle
        paragraphStyle.alignment = alignment
        addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
        return self
    }

    private var currentParagraphStyle: NSMutableParagraphStyle {
        let attributes = attributes(at: 0, effectiveRange: nil)
        return attributes[.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
    }
}

extension RangeExpression where Bound == String.Index  {
    public func nsRange<S: StringProtocol>(in string: S) -> NSRange { .init(self, in: string) }
}
