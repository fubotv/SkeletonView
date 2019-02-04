//  Copyright © 2017 SkeletonView. All rights reserved.

import UIKit

public extension UIView {
    
    @IBInspectable
    var isSkeletonable: Bool {
        get { return skeletonable }
        set { skeletonable = newValue }
    }
    
    var isSkeletonActive: Bool {
        return status == .on || (subviewsSkeletonables.first(where: { $0.isSkeletonActive }) != nil)
    }

    var skeletonLayer: SkeletonLayer? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.skeletonLayer) as? SkeletonLayer }
        set { objc_setAssociatedObject(self, &AssociatedKeys.skeletonLayer, newValue, AssociationPolicy.retain.objc) }
    }
}

    fileprivate var skeletonable: Bool! {
        get { return ao_get(pkey: &ViewAssociatedKeys.skeletonable) as? Bool ?? false }
        set { ao_set(newValue, pkey: &ViewAssociatedKeys.skeletonable) }
    }
}

