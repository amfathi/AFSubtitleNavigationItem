//
//  AFSubtitleNavigationItem.swift
//  AFSubtitleNavigationItem
//
//  Created by Ahmed Fathi on 1/5/19.
//

import UIKit

/// AF Custom `TitleLabel` class used to detect if the title label is already exits in the `navigationBar's` subviews.
fileprivate class AFTitleLabel: UILabel { }

/// AF Custom `SubtitleLabel` class used to detect if the title label is already exits in the `navigationBar's` subviews.
fileprivate class AFSubtitleLabel: UILabel { }

/// AF Custom `TitleView` class used to detect if current title view is actully AF View.
fileprivate class AFTitleView: UIView { }

public extension UINavigationItem {
    
    public struct appearance {
        public static var titleTextColor: UIColor?
        public static var titleTextFont: UIFont?
        public static var titleTextShadowColor: UIColor?
        public static var titleTextShadowOffset: CGSize?
        
        public static var subtitleTextColor: UIColor?
        public static var subtitleTextFont: UIFont?
        public static var subtitleTextShadowColor: UIColor?
        public static var subtitleTextShadowOffset: CGSize?
    }
    
    /// AF: A fully customized title label. `nil` if `isSubtitleEnabled` is false.
    ///
    /// ```
    /// // Customizing titleLabel
    /// navigationItem.titleLabel.text = "Title"
    /// navigationItem.titleLabel.textColor = .darkGray
    /// navigationItem.titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    /// ```
    ///
    public var titleLabel: UILabel? {
        if let titleView = titleView {
            for subview in titleView.subviews {
                if let titleLabel = subview as? AFTitleLabel {
                    return titleLabel
                }
            }
        }
        return nil
    }
    
    /// AF: A fully customized subtitle label. `nil` if `isSubtitleEnabled` is false.
    ///
    /// ```
    /// // Customizing subtitleLabel
    /// navigationItem.subtitleLabel.text = "Subtitle"
    /// navigationItem.subtitleLabel.textColor = .darkGray
    /// navigationItem.subtitleLabel.font = UIFont.systemFont(ofSize: 13, weight: .thin)
    /// ```
    ///
    public var subtitleLabel: UILabel? {
        if let titleView = titleView {
            for subview in titleView.subviews {
                if let subtitleLabel = subview as? AFSubtitleLabel {
                    return subtitleLabel
                }
            }
        }
        return nil
    }
    
    /// AF: Private title view to be add to the navigation item.
    private var _titleView: UIView {
        let titleView = AFTitleView()
        
        // Title Label
        let titleLabel = AFTitleLabel()
        titleView.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor, constant: -4).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor).isActive = true
        
        // Subtitle Label
        let subtitleLabel = AFSubtitleLabel()
        titleView.addSubview(subtitleLabel)
        subtitleLabel.textAlignment = .center
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor).isActive = true
        
        // Appearance
        applyAppearance()
        
        return titleView
    }
    
    private func applyAppearance() {
        appearance.titleTextColor.map { titleLabel?.textColor = $0 }
        appearance.titleTextFont.map { titleLabel?.font = $0 }
        appearance.titleTextShadowColor.map { titleLabel?.shadowColor = $0 }
        appearance.titleTextShadowOffset.map { titleLabel?.shadowOffset = $0 }
        appearance.subtitleTextColor.map { subtitleLabel?.textColor = $0 }
        appearance.subtitleTextFont.map { subtitleLabel?.font = $0 }
        appearance.subtitleTextShadowColor.map { subtitleLabel?.shadowColor = $0 }
        appearance.subtitleTextShadowOffset.map { subtitleLabel?.shadowOffset = $0 }
    }
    
    /// AF: Set to `true` to have the ability for `titleLabel` and `subtitleLabel` in your `navigationItem`.
    /// Set it to `false` to ignore the custom title\subtitle and display `navigationItem.title` if not `nil`.
    public var isSubtitleEnabled: Bool {
        get {
            return titleView?.isKind(of: AFTitleView.self) ?? false
        }
        set {
            if newValue {
                titleView = _titleView
                _titleView.heightAnchor.constraint(equalToConstant: 44)
            } else {
                titleView = nil
            }
        }
    }
}
