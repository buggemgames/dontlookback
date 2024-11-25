package
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.net.*;
   
   public class helpclass extends Sprite
   {
      public var glowdir:int;
      
      public var globaltemp3:int;
      
      public var glow:int;
      
      public var slowsine:int;
      
      public var sine:Array;
      
      public var globaltemp:int;
      
      public var cosine:Array;
      
      public var globaltemp2:int;
      
      public function helpclass()
      {
         super();
      }
      
      public function removeObject(obj:Object, arr:Array) : void
      {
         var i:String = null;
         for(i in arr)
         {
            if(arr[i] == obj)
            {
               arr.splice(i,1);
               break;
            }
         }
      }
      
      public function init() : void
      {
         sine = new Array();
         cosine = new Array();
         for(var i:int = 0; i < 64; i++)
         {
            sine[i] = Math.sin(i * 6.283 / 64);
            cosine[i] = Math.cos(i * 6.283 / 64);
         }
         glow = 0;
         glowdir = 0;
         slowsine = 0;
      }
      
      public function updateglow() : void
      {
         ++slowsine;
         if(slowsine >= 64)
         {
            slowsine = 0;
         }
         if(glowdir == 0)
         {
            glow += 2;
            if(glow >= 62)
            {
               glowdir = 1;
            }
         }
         else
         {
            glow -= 2;
            if(glow < 2)
            {
               glowdir = 0;
            }
         }
      }
   }
}

