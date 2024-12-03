package mx.utils;

import flash.errors.SecurityError;
import flash.display.DisplayObject;
import mx.core.IRepeaterClient;
import mx.core.MxInternal;

class NameUtil
{
    private static inline var VERSION : String = "3.2.0.3794";
    
    private static var counter : Int = 0;
    
    public function new()
    {
    }
    
    public static function displayObjectToString(displayObject : DisplayObject) : String
    {
        var result : String = null;
        var o : DisplayObject = null;
        var s : String = null;
        var indices : Array<Dynamic> = null;
        try
        {
            o = displayObject;
            while (o != null)
            {
                if (o.parent != null && o.stage != null && o.parent == o.stage)
                {
                    break;
                }
                s = o.name;
                if (Std.is(o, IRepeaterClient))
                {
                    indices = cast((o), IRepeaterClient).instanceIndices;
                    if (indices != null)
                    {
                        s += "[" + indices.join("][") + "]";
                    }
                }
                result = (result == null) ? s : s + "." + result;
                o = o.parent;
            }
        }
        catch (e : SecurityError)
        {
        }
        return result;
    }
    
    public static function createUniqueName(object : Dynamic) : String
    {
        if (object == null)
        {
            return null;
        }
        var name : Dynamic = Type.getClassName(object);
        var index : Int = as3hx.Compat.parseInt(name.indexOf("::"));
        if (index != -1)
        {
            name = name.substr(index + 2);
        }
        var charCode : Int = as3hx.Compat.parseInt(name.charCodeAt(name.length - 1));
        if (charCode >= 48 && charCode <= 57)
        {
            name += "_";
        }
        return name + counter++;
    }
}


