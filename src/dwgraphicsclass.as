package
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.net.*;
   
   public class dwgraphicsclass extends Sprite
   {
      public var temptile:BitmapData;
      
      public var images:Array = new Array();
      
      public var backgrounds:Array = new Array();
      
      public var alphamult:uint;
      
      public var bfontpos:int;
      
      public var tiles:Array = new Array();
      
      public var bfontmask:Array = new Array();
      
      public var bg_rect:Rectangle;
      
      public var screenbuffer:BitmapData;
      
      public var bfont:Array = new Array();
      
      public var bfont_rect:Rectangle;
      
      public var updatebackground:Boolean;
      
      public var cur:int;
      
      public var bfontlen:Array = new Array();
      
      public var bfontmask_rect:Rectangle;
      
      public var stemp:String;
      
      public var images_rect:Rectangle;
      
      public var buffer:BitmapData;
      
      public var temp:int;
      
      public var tiles_rect:Rectangle;
      
      public var temp3:int;
      
      public var temp2:int;
      
      public var backbuffer:BitmapData;
      
      public var screen:Bitmap;
      
      public var ct:ColorTransform;
      
      public var tl:Point;
      
      public function dwgraphicsclass()
      {
         super();
      }
      
      public function makebfont() : void
      {
         var maprow:Array = null;
         var i:Number = NaN;
         var t:BitmapData = null;
         var temprect:Rectangle = null;
         for(var j:Number = 0; j < 16; j++)
         {
            for(i = 0; i < 16; i++)
            {
               t = new BitmapData(8,8,true,0);
               temprect = new Rectangle(i * 8,j * 8,8,8);
               t.copyPixels(buffer,temprect,tl);
               bfont.push(t);
            }
         }
         for(i = 0; i < 256; bfontlen.push(6),i++)
         {
         }
         var tstring:String = "4,3,5,7,6,7,6,3,4,4,7,7,3,5,2,5,6,5,6,6,6,6,6,6,6,6,2,3,5,5,5,6,7,6,6,6,6,5,5,6,6,3,6,6,5,7,7,6,6,6,6,6,5,6,7,7,7,7,5,4,5,4,5,6,4,6,6,6,6,5,5,6,6,3,6,6,5,7,7,6,6,6,6,6,5,6,7,7,7,7,5,5,3,5,6,4";
         maprow = new Array();
         maprow = tstring.split(",");
         for(var k:int = 0; k < 96; k++)
         {
            bfontlen[k + 32] = int(maprow[k]);
         }
      }
      
      public function drawentities(obj:entityclass, help:helpclass) : void
      {
         var j:int = 0;
         var k:int = 0;
         for(var i:int = 0; i < obj.nentity; i++)
         {
            if(obj.entities[i].size == 1)
            {
               for(j = 0; j < 2; j++)
               {
                  for(k = 0; k < 2; k++)
                  {
                     backbuffer.copyPixels(tiles[obj.entities[i].drawframe + j + k * 20],tiles_rect,new Point(obj.entities[i].xp + j * 16,obj.entities[i].yp + k * 16));
                  }
               }
            }
            else if(obj.entities[i].size == 2)
            {
               for(j = 0; j < 4; j++)
               {
                  for(k = 0; k < 5; k++)
                  {
                     backbuffer.copyPixels(tiles[obj.entities[i].drawframe + j + k * 20],tiles_rect,new Point(obj.entities[i].xp + j * 16,obj.entities[i].yp + k * 16));
                  }
               }
            }
            else if(!obj.entities[i].invis)
            {
               if(obj.entities[i].type == 28)
               {
                  backbuffer.copyPixels(tiles[obj.entities[i].drawframe],tiles_rect,new Point(obj.entities[i].xp,obj.entities[i].yp + 2 * help.sine[int(help.slowsine)]));
               }
               else
               {
                  backbuffer.copyPixels(tiles[obj.entities[i].drawframe],tiles_rect,new Point(obj.entities[i].xp,obj.entities[i].yp));
               }
            }
         }
      }
      
      public function bprint(x:int, y:int, t:String, r:int, g:int, b:int, cen:Boolean = false) : void
      {
         printmask(x,y,t,cen);
         print(x,y,t,r,g,b,cen);
      }
      
      public function bprinttemptile(x:int, y:int, t:String, r:int, g:int, b:int, cen:Boolean = false) : void
      {
         printmasktemptile(x,y,t,cen);
         printtemptile(x,y,t,r,g,b,cen);
      }
      
      public function addbackground() : void
      {
         var t:BitmapData = new BitmapData(160,144,true,0);
         t.copyPixels(buffer,bg_rect,tl);
         backgrounds.push(t);
      }
      
      public function init() : void
      {
         updatebackground = true;
         tiles_rect = new Rectangle(0,0,16,16);
         bfont_rect = new Rectangle(0,0,8,8);
         bfontmask_rect = new Rectangle(0,0,9,9);
         bg_rect = new Rectangle(0,0,160,144);
         tl = new Point(0,0);
         ct = new ColorTransform(0,0,0,1,255,255,255,1);
         backbuffer = new BitmapData(160,144,false,0);
         screenbuffer = new BitmapData(160,144,false,0);
         temptile = new BitmapData(16,16,false,0);
         screen = new Bitmap(screenbuffer);
         screen.width = 640;
         screen.height = 576;
         addChild(screen);
      }
      
      public function len(t:String) : int
      {
         bfontpos = 0;
         for(var i:int = 0; i < t.length; i++)
         {
            cur = t.charCodeAt(i);
            bfontpos += bfontlen[cur];
         }
         return bfontpos;
      }
      
      public function render() : void
      {
         screenbuffer.lock();
         screenbuffer.copyPixels(backbuffer,backbuffer.rect,tl,null,null,false);
         screenbuffer.unlock();
         backbuffer.lock();
         backbuffer.fillRect(backbuffer.rect,0);
         backbuffer.unlock();
      }
      
      public function drawimage(t:int, xp:int, yp:int, cent:Boolean = false) : void
      {
         if(cent)
         {
            backbuffer.copyPixels(images[t],new Rectangle(0,0,images[t].width,images[t].height),new Point(80 - int(images[t].width / 2),yp));
         }
         else
         {
            backbuffer.copyPixels(images[t],new Rectangle(0,0,images[t].width,images[t].height),new Point(xp,yp));
         }
      }
      
      public function printmask(x:int, y:int, t:String, cen:Boolean = false) : void
      {
         if(cen)
         {
            x = 80 - len(t) / 2;
         }
         bfontpos = 0;
         for(var i:int = 0; i < t.length; i++)
         {
            cur = t.charCodeAt(i);
            backbuffer.copyPixels(bfontmask[cur],bfont_rect,new Point(x + bfontpos - 1,y));
            bfontpos += bfontlen[cur];
         }
      }
      
      public function screenshake() : void
      {
         screenbuffer.lock();
         screenbuffer.copyPixels(backbuffer,backbuffer.rect,tl,null,null,false);
         screenbuffer.copyPixels(backbuffer,backbuffer.rect,new Point(Math.random() * 5 - 3,Math.random() * 5 - 3),null,null,false);
         screenbuffer.unlock();
         backbuffer.lock();
         backbuffer.fillRect(backbuffer.rect,0);
         backbuffer.unlock();
      }
      
      public function printmasktemptile(x:int, y:int, t:String, cen:Boolean = false) : void
      {
         if(cen)
         {
            x = 80 - len(t) / 2;
         }
         bfontpos = 0;
         for(var i:int = 0; i < t.length; i++)
         {
            cur = t.charCodeAt(i);
            temptile.copyPixels(bfontmask[cur],bfont_rect,new Point(x + bfontpos - 1,y));
            bfontpos += bfontlen[cur];
         }
      }
      
      public function flashlight() : void
      {
         backbuffer.fillRect(backbuffer.rect,9383213);
      }
      
      public function RGB(red:Number, green:Number, blue:Number) : Number
      {
         return blue | green << 8 | red << 16;
      }
      
      public function printtemptile(x:int, y:int, t:String, r:int, g:int, b:int, cen:Boolean = false) : void
      {
         if(r < 0)
         {
            r = 0;
         }
         if(g < 0)
         {
            g = 0;
         }
         if(b < 0)
         {
            b = 0;
         }
         if(r > 255)
         {
            r = 255;
         }
         if(g > 255)
         {
            g = 255;
         }
         if(b > 255)
         {
            b = 255;
         }
         ct.color = RGB(r,g,b);
         if(cen)
         {
            x = 80 - len(t) / 2;
         }
         bfontpos = 0;
         for(var i:int = 0; i < t.length; i++)
         {
            cur = t.charCodeAt(i);
            bfont[cur].colorTransform(bfont_rect,ct);
            temptile.copyPixels(bfont[cur],bfont_rect,new Point(x + bfontpos,y));
            bfontpos += bfontlen[cur];
         }
      }
      
      public function print(x:int, y:int, t:String, r:int, g:int, b:int, cen:Boolean = false) : void
      {
         if(r < 0)
         {
            r = 0;
         }
         if(g < 0)
         {
            g = 0;
         }
         if(b < 0)
         {
            b = 0;
         }
         if(r > 255)
         {
            r = 255;
         }
         if(g > 255)
         {
            g = 255;
         }
         if(b > 255)
         {
            b = 255;
         }
         ct.color = RGB(r,g,b);
         if(cen)
         {
            x = 80 - len(t) / 2;
         }
         bfontpos = 0;
         for(var i:int = 0; i < t.length; i++)
         {
            cur = t.charCodeAt(i);
            bfont[cur].colorTransform(bfont_rect,ct);
            backbuffer.copyPixels(bfont[cur],bfont_rect,new Point(x + bfontpos,y));
            bfontpos += bfontlen[cur];
         }
      }
      
      public function drawbuffertile(x:int, y:int, t:int) : void
      {
         buffer.copyPixels(tiles[t],tiles_rect,new Point(x,y));
      }
      
      public function maketilearray() : void
      {
         var i:Number = NaN;
         var t:BitmapData = null;
         var temprect:Rectangle = null;
         for(var j:Number = 0; j < 15; j++)
         {
            for(i = 0; i < 20; i++)
            {
               t = new BitmapData(16,16,true,0);
               temprect = new Rectangle(i * 16,j * 16,16,16);
               t.copyPixels(buffer,temprect,tl);
               tiles.push(t);
            }
         }
      }
      
      public function addimage() : void
      {
         var t:BitmapData = new BitmapData(buffer.width,buffer.height,true,0);
         t.copyPixels(buffer,new Rectangle(0,0,buffer.width,buffer.height),tl);
         images.push(t);
      }
      
      public function makebfontmask() : void
      {
         var i:Number = NaN;
         var t:BitmapData = null;
         var temprect:Rectangle = null;
         for(var j:Number = 0; j < 16; j++)
         {
            for(i = 0; i < 16; i++)
            {
               t = new BitmapData(9,9,true,0);
               temprect = new Rectangle(i * 9,j * 9,9,9);
               t.copyPixels(buffer,temprect,tl);
               bfontmask.push(t);
            }
         }
      }
      
      public function drawbackground(t:int) : void
      {
         backbuffer.copyPixels(backgrounds[t],bg_rect,tl);
      }
      
      public function drawbossmeter(game:gameclass) : void
      {
         if(game.hpposition > game.currenthp * 120 / game.totalhp)
         {
            game.hpposition -= 2;
         }
         if(game.hpposition < game.currenthp * 120 / game.totalhp)
         {
            game.hpposition = game.currenthp * 120 / game.totalhp;
         }
         backbuffer.fillRect(new Rectangle(19,130,122,8),1114884);
         backbuffer.fillRect(new Rectangle(20,131,game.hpposition,6),9383213);
      }
      
      public function drawtile(x:int, y:int, t:int) : void
      {
         backbuffer.copyPixels(tiles[t],tiles_rect,new Point(x,y));
      }
   }
}

