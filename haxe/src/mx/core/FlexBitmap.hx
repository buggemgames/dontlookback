package mx.core;

import flash.errors.Error;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.PixelSnapping;
import mx.utils.NameUtil;

class FlexBitmap extends Bitmap
{
    private static inline var VERSION : String = "3.2.0.3794";
    
    public function new(bitmapData : BitmapData = null, pixelSnapping : PixelSnapping = PixelSnapping.AUTO, smoothing : Bool = false)
    {
        super(bitmapData, pixelSnapping, smoothing);
        try
        {
            name = NameUtil.createUniqueName(this);
        }
        catch (e : Error)
        {
        }
    }
    
    override public function toString() : String
    {
        return NameUtil.displayObjectToString(this);
    }
}


