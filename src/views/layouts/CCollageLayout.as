package views.layouts {
import flash.display.DisplayObject;
import flash.geom.Rectangle;

public class CCollageLayout implements ILayoutBuilder {
    private var mImageSpacing:int = 0;
    public function CCollageLayout() {

    }

    public function arrange(images:Vector.<DisplayObject>, bounds:Rectangle, imageSpacing:int = 1):void {
        mImageSpacing = imageSpacing;
        var S:Number = bounds.width * bounds.height;
        var candidates:Vector.<Layout> = new Vector.<Layout>();
        var numLayouts:int = 50;
        for (var i:int = 0; i < numLayouts; i++){
            var root:Node = Node.container(Node.V);
            var internalNodes:Vector.<Node> = new Vector.<Node>();
            var leafs:Vector.<Node> = new Vector.<Node>();

            createTree(root, internalNodes, images.length - 1);
            fillLeafs(internalNodes, leafs, images);
            makeLayout(root, bounds.width, bounds.height);
            candidates.push(Layout.create(root, computeCost(leafs, S)))
        }
        candidates.sort(sortByCost);
        var best:Layout = candidates.shift();
        scaleAndPositionLeafs(best.root, (bounds.width - best.root.width)/2,(bounds.height - best.root.height)/2);
        candidates.length = 0;
    }

    private function makeLayout(root:Node, width:Number, height:Number):void {
        var ar:Number = computeAspectRatio(root);
        var rootWidth:Number;
        var rootHeight:Number;
        if (width < ar * height)
            rootWidth = width;
        else
            rootWidth = ar * height;
        rootHeight = rootWidth/ar;
        computeDimensions(root, rootWidth, rootHeight);
    }

    private function computeAspectRatio(node:Node):Number {
        if (!node)
            return 0;
        if (node.isLeaf) // it's a leaf, return image aspect ratio
            return node.ratio = node.value.width/node.value.height;
        if (node.isHorizontal) {
            node.ratio = computeAspectRatio(node.left) + computeAspectRatio(node.right)
        } else {
            if (node.left && node.right)
                node.ratio = 1/(1/computeAspectRatio(node.left) + 1/computeAspectRatio(node.right));
            else if (node.left)
                node.ratio = 1/(1/computeAspectRatio(node.left));
            else
                node.ratio = 1/(1/computeAspectRatio(node.right));
        }
        return node.ratio;
    }

    private function computeDimensions(node:Node, width:Number, height:Number):void {
        if (!node)
            return;
        var w:Number = Math.min(width, node.ratio * height);
        var h:Number = w/node.ratio;
        node.width = w;
        node.height = h;
        computeDimensions(node.left, w, h);
        computeDimensions(node.right, w, h);
    }

    private function scaleAndPositionLeafs(node:Node, px:Number, py:Number):void {
        if (!node)
            return;
        if (node.isHorizontal && node.left) {
            scaleAndPositionLeafs(node.left, px, py);
            scaleAndPositionLeafs(node.right, px + node.left.width, py);
        } else if (node.isVertical && node.left){
            scaleAndPositionLeafs(node.left, px, py);
            scaleAndPositionLeafs(node.right, px, py + node.left.height)
        } else if(node.isLeaf) {
            node.scaleAndPosition(px, py, mImageSpacing);
        }
     }

    private function createTree(root:Node, tree:Vector.<Node>, size:int):void {
        tree.push(root);
        while (tree.length < size){
            var n:Node = pickRandom(tree.filter(excludeFullNodes));
            var c:Node = Node.randomContainer();
            if (!n.left)
                n.left = c;
            else
                n.right = c;
            tree.push(c);
        }
    }

    private function fillLeafs(tree:Vector.<Node>, leafs:Vector.<Node>, images:Vector.<DisplayObject>):void{
        if (!images.length)
            return;
        var img:DisplayObject;
        for (var i:int = 0; i < images.length; i++){
            img = images[i];
            var node:Node = pickRandom(tree.filter(excludeFullNodes));
            if (!node.left)
                leafs.push(node.left = Node.createLeaf(img));
            else
                leafs.push(node.right = Node.createLeaf(img));
        }
    }

    /** coverage of canvas */
    private function computeCost(leafs:Vector.<Node>, S:Number):Number {
        var summ:Number = 0;
        for each (var leaf:Node in leafs){
            summ += (leaf.width * leaf.height)/S;
        }
        return 1 - summ;
    }

    private function pickRandom(tree:Vector.<Node>):Node {
        var index:int = Math.random() * tree.length;
        return tree[index];
    }

    private function excludeFullNodes(item:Node, index:int, vec:Vector.<Node>):Boolean {
        return !(item.left && item.right);
    }

    private function sortByCost(a:Layout , b:Layout):int{
        if (a.cost > b.cost)
            return 1;
        if (a.cost < b.cost)
            return -1;
        return 0;
    }
}
}

import flash.display.DisplayObject;

internal class Layout {
    private var mRoot:Node;
    private var mCost:Number;
    public static function create(root:Node, cost:Number):Layout {
        var i:Layout = new Layout();
        i.mRoot = root;
        i.mCost = cost;
        return i;
    }

    public function Layout():void { }
    public function get cost():Number {return mCost;}
    public function get root():Node {return mRoot;}
}

internal class Node {

    private var mLeft:Node;
    private var mRight:Node;
    private var mValue:DisplayObject;
    private var mLabel:int;
    private var mAspectRatio:Number;
    private var mWidth:Number;
    private var mHeight:Number;
    public static const V:int = 1; // V vertical split
    public static const H:int = 2; // H horizontal split
    public static const L:int = 3; // L leaf type

    public static function container(label:int):Node {
        var n:Node = new Node();
        n.mLabel = label;
        return n;
    }

    public static function randomContainer():Node {
        var n:Node = new Node();
        n.mLabel = Math.random() > .5 ? Node.H : Node.V;
        return n;
    }

    public static function createLeaf(val:DisplayObject):Node{
        var n:Node = new Node();
        n.mLabel = L;
        n.mValue = val;
        n.mWidth = val.width;
        n.mHeight = val.height;
        return n;
    }

    public function Node():void{}

    public function scaleAndPosition(px:Number, py:Number, space:int):void {
        if (!isLeaf)
            return;
        if (!value)
            return;
        value.x = px + space;
        value.y = py + space;
        value.width = mWidth - space  * 2;
        value.height = mHeight - space * 2;
    }

    public function get label():int{ return mLabel; }
    public function get value():DisplayObject{ return mValue;}
    public function get isLeaf():Boolean{ return label == L; }
    public function get isVertical():Boolean { return label == H; }// horizontally sliced
    public function get isHorizontal():Boolean { return label == V; }// vertically sliced

    public function set left(v:Node):void{ mLeft = v; }
    public function get left():Node { return mLeft; }
    public function set right(v:Node):void { mRight = v; }
    public function get right():Node { return mRight; }
    public function set ratio(v:Number):void{ mAspectRatio = v; }
    public function get ratio():Number {return mAspectRatio; }
    public function set width(v:Number):void { mWidth = v; }
    public function get width():Number { return mWidth; }
    public function set height(v:Number):void { mHeight = v; }
    public function get height():Number { return mHeight; }



}