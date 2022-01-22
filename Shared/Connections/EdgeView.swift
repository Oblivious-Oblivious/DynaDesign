//
//  EdgeView.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 10/01/22.
//

import SwiftUI

typealias AnimatablePoint = AnimatablePair<CGFloat, CGFloat>;
typealias AnimatableCorners = AnimatablePair<AnimatablePoint, AnimatablePoint>;

public protocol Animatable {
    /* The type defining the data to be animated */
    associatedtype AnimatableData: VectorArithmetic;
    
    /* The data to be animated */
    var animatable_data: Self.AnimatableData { get set };
}

struct EdgeView: Shape {
    var startx: CGFloat = 0;
    var starty: CGFloat = 0;
    var endx: CGFloat = 0;
    var endy: CGFloat = 0;
    
    init(link: LinkModel) {
        self.startx = link.start.x;
        self.starty = link.start.y;
        self.endx = link.end.x;
        self.endy = link.end.y;
    }
    
    func path(in rect: CGRect) -> Path {
        var link_path = Path();
        
        link_path.move(
            to: CGPoint(x: startx, y: starty)
        );
        
        link_path.addLine(
            to: CGPoint(x: endx, y: endy)
        );
        
        return link_path;
    }
    
    var animatableData: AnimatableCorners {
        get {
            return AnimatablePair(
                AnimatablePair(self.startx, self.starty),
                AnimatablePair(self.endx, self.endy)
            );
        }

        set {
            startx = newValue.first.first;
            starty = newValue.first.second;
            endx = newValue.second.first;
            endy = newValue.second.second;
        }
    }
}

struct EdgeView_Previews: PreviewProvider {
    static var previews: some View {
        let link1 = LinkModel(
            start: CGPoint(x: -100, y: -100),
            end: CGPoint(x: 100, y: 100)
        );
        let link2 = LinkModel(
            start: CGPoint(x: 100, y: -100),
            end: CGPoint(x: -100, y: 100)
        );
        
        return ZStack {
            EdgeView(link: link1)
                .stroke(lineWidth: 4)
            EdgeView(link: link2)
                .stroke(Color.blue, lineWidth: 2);
        }
    }
}
