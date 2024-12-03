import flash.display.*;
import flash.events.*;
import flash.geom.*;
import flash.net.*;

class Helpclass extends Sprite
{
    public var glowdir : Int;
    
    public var globaltemp3 : Int;
    
    public var glow : Int;
    
    public var slowsine : Int;
    
    public var sine : Array<Dynamic>;
    
    public var globaltemp : Int;
    
    public var cosine : Array<Dynamic>;
    
    public var globaltemp2 : Int;
    
    public function new()
    {
        super();
    }
    
    public function removeObject(obj : Dynamic, arr : Array<Dynamic>) : Void
    {
        var i : Dynamic = null;
        for (i in arr)
        {
            if (i == obj)
            {
                arr.splice(arr.indexOf(i), 1);
                break;
            }
        }
    }
    
    public function init() : Void
    {
        sine = new Array<Dynamic>();
        cosine = new Array<Dynamic>();
        for (i in 0...64)
        {
            sine[i] = Math.sin(i * 6.283 / 64);
            cosine[i] = Math.cos(i * 6.283 / 64);
        }
        glow = 0;
        glowdir = 0;
        slowsine = 0;
    }
    
    public function updateglow() : Void
    {
        ++slowsine;
        if (slowsine >= 64)
        {
            slowsine = 0;
        }
        if (glowdir == 0)
        {
            glow += 2;
            if (glow >= 62)
            {
                glowdir = 1;
            }
        }
        else
        {
            glow -= 2;
            if (glow < 2)
            {
                glowdir = 0;
            }
        }
    }
}


