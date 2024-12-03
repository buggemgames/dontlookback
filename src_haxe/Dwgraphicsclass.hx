import flash.display.*;
import flash.events.*;
import flash.geom.*;
import flash.net.*;

class Dwgraphicsclass extends Sprite
{
    public var temptile : BitmapData;
    
    public var images : Array<Dynamic> = new Array<Dynamic>();
    
    public var backgrounds : Array<Dynamic> = new Array<Dynamic>();
    
    public var alphamult : Int;
    
    public var bfontpos : Int;
    
    public var tiles : Array<Dynamic> = new Array<Dynamic>();
    
    public var bfontmask : Array<Dynamic> = new Array<Dynamic>();
    
    public var bg_rect : Rectangle;
    
    public var screenbuffer : BitmapData;
    
    public var bfont : Array<Dynamic> = new Array<Dynamic>();
    
    public var bfont_rect : Rectangle;
    
    public var updatebackground : Bool;
    
    public var cur : Int;
    
    public var bfontlen : Array<Dynamic> = new Array<Dynamic>();
    
    public var bfontmask_rect : Rectangle;
    
    public var stemp : String;
    
    public var images_rect : Rectangle;
    
    public var buffer : BitmapData;
    
    public var temp : Int;
    
    public var tiles_rect : Rectangle;
    
    public var temp3 : Int;
    
    public var temp2 : Int;
    
    public var backbuffer : BitmapData;
    
    public var screen : Bitmap;
    
    public var ct : ColorTransform;
    
    public var tl : Point;
    
    public function new()
    {
        super();
    }
    
    public function makebfont() : Void
    {
        var maprow : Array<Dynamic> = null;
        var i : Float = Math.NaN;
        var t : BitmapData = null;
        var temprect : Rectangle = null;
        for (j in 0...16)
        {
            for (i in 0...16)
            {
                t = new BitmapData(8, 8, true, 0);
                temprect = new Rectangle(i * 8, j * 8, 8, 8);
                t.copyPixels(buffer, temprect, tl);
                bfont.push(t);
            }
        }
        i = 0;
        while (i < 256)
        {
            bfontlen.push(6);
            i++;
        }
        var tstring : String = "4,3,5,7,6,7,6,3,4,4,7,7,3,5,2,5,6,5,6,6,6,6,6,6,6,6,2,3,5,5,5,6,7,6,6,6,6,5,5,6,6,3,6,6,5,7,7,6,6,6,6,6,5,6,7,7,7,7,5,4,5,4,5,6,4,6,6,6,6,5,5,6,6,3,6,6,5,7,7,6,6,6,6,6,5,6,7,7,7,7,5,5,3,5,6,4";
        maprow = new Array<Dynamic>();
        maprow = tstring.split(",");
        for (k in 0...96)
        {
            bfontlen[k + 32] = as3hx.Compat.parseInt(maprow[k]);
        }
    }
    
    public function drawentities(obj : Entityclass, help : Helpclass) : Void
    {
        var j : Int = 0;
        var k : Int = 0;
        var i : Int = 0;
        while (i < obj.nentity)
        {
            if (obj.entities[i].size == 1)
            {
                for (j in 0...2)
                {
                    for (k in 0...2)
                    {
                        backbuffer.copyPixels(tiles[obj.entities[i].drawframe + j + k * 20], tiles_rect, new Point(obj.entities[i].xp + j * 16, obj.entities[i].yp + k * 16));
                    }
                }
            }
            else if (obj.entities[i].size == 2)
            {
                for (j in 0...4)
                {
                    for (k in 0...5)
                    {
                        backbuffer.copyPixels(tiles[obj.entities[i].drawframe + j + k * 20], tiles_rect, new Point(obj.entities[i].xp + j * 16, obj.entities[i].yp + k * 16));
                    }
                }
            }
            else if (!obj.entities[i].invis)
            {
                if (obj.entities[i].type == 28)
                {
                    backbuffer.copyPixels(tiles[obj.entities[i].drawframe], tiles_rect, new Point(obj.entities[i].xp, obj.entities[i].yp + 2 * help.sine[as3hx.Compat.parseInt(help.slowsine)]));
                }
                else
                {
                    backbuffer.copyPixels(tiles[obj.entities[i].drawframe], tiles_rect, new Point(obj.entities[i].xp, obj.entities[i].yp));
                }
            }
            i++;
        }
    }
    
    public function bprint(x : Int, y : Int, t : String, r : Int, g : Int, b : Int, cen : Bool = false) : Void
    {
        printmask(x, y, t, cen);
        print(x, y, t, r, g, b, cen);
    }
    
    public function bprinttemptile(x : Int, y : Int, t : String, r : Int, g : Int, b : Int, cen : Bool = false) : Void
    {
        printmasktemptile(x, y, t, cen);
        printtemptile(x, y, t, r, g, b, cen);
    }
    
    public function addbackground() : Void
    {
        var t : BitmapData = new BitmapData(160, 144, true, 0);
        t.copyPixels(buffer, bg_rect, tl);
        backgrounds.push(t);
    }
    
    public function init() : Void
    {
        updatebackground = true;
        tiles_rect = new Rectangle(0, 0, 16, 16);
        bfont_rect = new Rectangle(0, 0, 8, 8);
        bfontmask_rect = new Rectangle(0, 0, 9, 9);
        bg_rect = new Rectangle(0, 0, 160, 144);
        tl = new Point(0, 0);
        ct = new ColorTransform(0, 0, 0, 1, 255, 255, 255, 1);
        backbuffer = new BitmapData(160, 144, false, 0);
        screenbuffer = new BitmapData(160, 144, false, 0);
        temptile = new BitmapData(16, 16, false, 0);
        screen = new Bitmap(screenbuffer);
        screen.width = 640;
        screen.height = 576;
        addChild(screen);
    }
    
    public function len(t : String) : Int
    {
        bfontpos = 0;
        var i : Int = 0;
        while (i < t.length)
        {
            cur = t.charCodeAt(i);
            bfontpos += bfontlen[cur];
            i++;
        }
        return bfontpos;
    }
    
    public function render() : Void
    {
        screenbuffer.lock();
        screenbuffer.copyPixels(backbuffer, backbuffer.rect, tl, null, null, false);
        screenbuffer.unlock();
        backbuffer.lock();
        backbuffer.fillRect(backbuffer.rect, 0);
        backbuffer.unlock();
    }
    
    public function drawimage(t : Int, xp : Int, yp : Int, cent : Bool = false) : Void
    {
        if (cent)
        {
            backbuffer.copyPixels(images[t], new Rectangle(0, 0, images[t].width, images[t].height), new Point(80 - as3hx.Compat.parseInt(images[t].width / 2), yp));
        }
        else
        {
            backbuffer.copyPixels(images[t], new Rectangle(0, 0, images[t].width, images[t].height), new Point(xp, yp));
        }
    }
    
    public function printmask(x : Int, y : Int, t : String, cen : Bool = false) : Void
    {
        if (cen)
        {
            x = as3hx.Compat.parseInt(80 - len(t) / 2);
        }
        bfontpos = 0;
        var i : Int = 0;
        while (i < t.length)
        {
            cur = t.charCodeAt(i);
            backbuffer.copyPixels(bfontmask[cur], bfont_rect, new Point(x + bfontpos - 1, y));
            bfontpos += bfontlen[cur];
            i++;
        }
    }
    
    public function screenshake() : Void
    {
        screenbuffer.lock();
        screenbuffer.copyPixels(backbuffer, backbuffer.rect, tl, null, null, false);
        screenbuffer.copyPixels(backbuffer, backbuffer.rect, new Point(Math.random() * 5 - 3, Math.random() * 5 - 3), null, null, false);
        screenbuffer.unlock();
        backbuffer.lock();
        backbuffer.fillRect(backbuffer.rect, 0);
        backbuffer.unlock();
    }
    
    public function printmasktemptile(x : Int, y : Int, t : String, cen : Bool = false) : Void
    {
        if (cen)
        {
            x = as3hx.Compat.parseInt(80 - len(t) / 2);
        }
        bfontpos = 0;
        var i : Int = 0;
        while (i < t.length)
        {
            cur = t.charCodeAt(i);
            temptile.copyPixels(bfontmask[cur], bfont_rect, new Point(x + bfontpos - 1, y));
            bfontpos += bfontlen[cur];
            i++;
        }
    }
    
    public function flashlight() : Void
    {
        backbuffer.fillRect(backbuffer.rect, 9383213);
    }
    
    public function RGB(red : Int, green : Int, blue : Int) : Int
    {
        return blue | green << 8 | red << 16;
    }
    
    public function printtemptile(x : Int, y : Int, t : String, r : Int, g : Int, b : Int, cen : Bool = false) : Void
    {
        if (r < 0)
        {
            r = 0;
        }
        if (g < 0)
        {
            g = 0;
        }
        if (b < 0)
        {
            b = 0;
        }
        if (r > 255)
        {
            r = 255;
        }
        if (g > 255)
        {
            g = 255;
        }
        if (b > 255)
        {
            b = 255;
        }
        ct.color = RGB(r, g, b);
        if (cen)
        {
            x = as3hx.Compat.parseInt(80 - len(t) / 2);
        }
        bfontpos = 0;
        var i : Int = 0;
        while (i < t.length)
        {
            cur = t.charCodeAt(i);
            bfont[cur].colorTransform(bfont_rect, ct);
            temptile.copyPixels(bfont[cur], bfont_rect, new Point(x + bfontpos, y));
            bfontpos += bfontlen[cur];
            i++;
        }
    }
    
    public function print(x : Int, y : Int, t : String, r : Int, g : Int, b : Int, cen : Bool = false) : Void
    {
        if (r < 0)
        {
            r = 0;
        }
        if (g < 0)
        {
            g = 0;
        }
        if (b < 0)
        {
            b = 0;
        }
        if (r > 255)
        {
            r = 255;
        }
        if (g > 255)
        {
            g = 255;
        }
        if (b > 255)
        {
            b = 255;
        }
        ct.color = RGB(r, g, b);
        if (cen)
        {
            x = as3hx.Compat.parseInt(80 - len(t) / 2);
        }
        bfontpos = 0;
        var i : Int = 0;
        while (i < t.length)
        {
            cur = t.charCodeAt(i);
            bfont[cur].colorTransform(bfont_rect, ct);
            backbuffer.copyPixels(bfont[cur], bfont_rect, new Point(x + bfontpos, y));
            bfontpos += bfontlen[cur];
            i++;
        }
    }
    
    public function drawbuffertile(x : Int, y : Int, t : Int) : Void
    {
        buffer.copyPixels(tiles[t], tiles_rect, new Point(x, y));
    }
    
    public function maketilearray() : Void
    {
        var i : Float = Math.NaN;
        var t : BitmapData = null;
        var temprect : Rectangle = null;
        for (j in 0...15)
        {
            for (i in 0...20)
            {
                t = new BitmapData(16, 16, true, 0);
                temprect = new Rectangle(i * 16, j * 16, 16, 16);
                t.copyPixels(buffer, temprect, tl);
                tiles.push(t);
            }
        }
    }
    
    public function addimage() : Void
    {
        var t : BitmapData = new BitmapData(buffer.width, buffer.height, true, 0);
        t.copyPixels(buffer, new Rectangle(0, 0, buffer.width, buffer.height), tl);
        images.push(t);
    }
    
    public function makebfontmask() : Void
    {
        var i : Float = Math.NaN;
        var t : BitmapData = null;
        var temprect : Rectangle = null;
        for (j in 0...16)
        {
            for (i in 0...16)
            {
                t = new BitmapData(9, 9, true, 0);
                temprect = new Rectangle(i * 9, j * 9, 9, 9);
                t.copyPixels(buffer, temprect, tl);
                bfontmask.push(t);
            }
        }
    }
    
    public function drawbackground(t : Int) : Void
    {
        backbuffer.copyPixels(backgrounds[t], bg_rect, tl);
    }
    
    public function drawbossmeter(game : Gameclass) : Void
    {
        if (game.hpposition > game.currenthp * 120 / game.totalhp)
        {
            game.hpposition -= 2;
        }
        if (game.hpposition < game.currenthp * 120 / game.totalhp)
        {
            game.hpposition = game.currenthp * 120 / game.totalhp;
        }
        backbuffer.fillRect(new Rectangle(19, 130, 122, 8), 1114884);
        backbuffer.fillRect(new Rectangle(20, 131, game.hpposition, 6), 9383213);
    }
    
    public function drawtile(x : Int, y : Int, t : Int) : Void
    {
        backbuffer.copyPixels(tiles[t], tiles_rect, new Point(x, y));
    }
}


