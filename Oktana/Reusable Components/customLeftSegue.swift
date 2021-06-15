//
//  customLeftSegue.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 14/06/21.
//

import UIKit

class customLeftSegue: UIStoryboardSegue {
    override func perform() {
            let src = self.source
            let dst = self.destination

        src.view.superview?.addSubview(dst.view)
        dst.view.center = src.view.center
            dst.view.transform = CGAffineTransform(translationX: -src.view.frame.size.width, y: 0)

            UIView.animate(withDuration: 0.25,
                                  delay: 0.0,
                                options: .curveEaseInOut,
                             animations: {
                                    dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
                                    },
                            completion: { finished in
                                    src.present(dst, animated: false, completion: nil)
                                        }
                            )
        }
}
