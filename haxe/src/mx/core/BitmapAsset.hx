package mx.core;

import flash.display.BitmapData;
import flash.display.PixelSnapping;

class BitmapAsset extends FlexBitmap implements IFlexAsset implements IFlexDisplayObject
{
    public var measuredWidth(get, never) : Float;
    public var measuredHeight(get, never) : Float;

    private static inline var VERSION : String = "3.2.0.3794";
    
    public function new(bitmapData : BitmapData = null, pixelSnapping : PixelSnapping = PixelSnapping.AUTO, smoothing : Bool = false)
    {
        super(bitmapData, pixelSnapping, smoothing);
    }
    
    private function get_measuredWidth() : Float
    {
        if (bitmapData != null)
        {
            return bitmapData.width;
        }
        return 0;
    }
    
    private function get_measuredHeight() : Float
    {
        if (bitmapData != null)
        {
            return bitmapData.height;
        }
        return 0;
    }
    
    public function setActualSize(newWidth : Float, newHeight : Float) : Void
    {
        width = newWidth;
        height = newHeight;
    }
    
    public function move(x : Float, y : Float) : Void
    {
        this.x = x;
        this.y = y;
    }
}


