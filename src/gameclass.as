package
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.net.*;
   
   public class gameclass extends Sprite
   {
      public var restorehighlighted:Boolean;
      
      public var inmenu:Boolean;
      
      public var startspecial:Boolean;
      
      public var screenshake:int;
      
      public var kongversion:Boolean;
      
      public var teststring:String;
      
      public var showcreditline:int;
      
      public var flashlight:int;
      
      public var visithighlighted:Boolean;
      
      public var hpposition:int;
      
      public var paused:Boolean;
      
      public var savepoint:int;
      
      public var startroom:int;
      
      public var currenthp:int;
      
      public var bg:int;
      
      public var door_right:int;
      
      public var totalhp:int;
      
      public var startx:int;
      
      public var starty:int;
      
      public var globalsound:int;
      
      public var hasgun:Boolean;
      
      public var jumpheld:Boolean;
      
      public var raindelay:int;
      
      public var muted:Boolean;
      
      public var nblocks:int;
      
      public var debugmode:Boolean;
      
      public var showtitle:int;
      
      public var showimage:int;
      
      public var newgamehighlighted:Boolean;
      
      public var currentimage:int;
      
      public var hascontrol:Boolean;
      
      public var blocks:Array = new Array();
      
      public var enemycount:int;
      
      public var mutebutton:int;
      
      public var offlinehighlighted:Boolean;
      
      public var state:int;
      
      public var statedelay:int;
      
      public var door_down:int;
      
      public var rain:Boolean;
      
      public var isshooting:Boolean;
      
      public var toggledeath:Boolean;
      
      public var test:Boolean;
      
      public var lastx:int;
      
      public var lasty:int;
      
      public var mx:int;
      
      public var my:int;
      
      public var ongroundlasttime:Boolean;
      
      public var eurydicemode:Boolean;
      
      public var entdir:int;
      
      public var showblocks:Boolean;
      
      public var shotdelay:int;
      
      public var door_up:int;
      
      public var currentroom:int;
      
      public var gamecookie:SharedObject;
      
      public var showmenu:int;
      
      public var infocus:Boolean;
      
      public var entvx:int;
      
      public var enty:int;
      
      public var standaloneversion:Boolean;
      
      public var entx:int;
      
      public var entvy:int;
      
      public var door_left:int;
      
      public var onkongregate:Boolean;
      
      public function gameclass(obj:entityclass, help:helpclass, music:musicclass)
      {
         super();
         gamecookie = SharedObject.getLocal("dwdontlookback");
         kongversion = false;
         standaloneversion = true;
         if(kongversion)
         {
         }
         if(gamecookie.data.counter == undefined)
         {
            gamecookie.data.counter = 0;
         }
         else
         {
            savepoint = gamecookie.data.counter;
         }
         infocus = true;
         paused = false;
         muted = false;
         globalsound = 1;
         mutebutton = 0;
         addEventListener(Event.DEACTIVATE,windowNotActive);
         addEventListener(Event.ACTIVATE,windowActive);
         showtitle = 0;
         showcreditline = 0;
         showmenu = 0;
         lastx = 0;
         lasty = 0;
         test = false;
         teststring = "Test=TRUE";
         jumpheld = false;
         shotdelay = 0;
         hasgun = false;
         hascontrol = true;
         rain = true;
         raindelay = 0;
         showblocks = false;
         nblocks = 0;
         currentroom = 0;
         gotoroom(0,obj,help,music);
         state = 1;
         statedelay = 0;
         updatestate(obj,help,music);
      }
      
      public function setsavepoint(t:int) : void
      {
         savepoint = t;
         gamecookie.data.counter = savepoint;
      }
      
      public function resetenemycount() : void
      {
         enemycount = 0;
      }
      
      public function createblock(xp:int, yp:int, w:int, h:int) : void
      {
         var block:Object = new Object();
         block.type = 0;
         block.xp = xp;
         block.yp = yp;
         block.w = w;
         block.h = h;
         block.rect = new Rectangle(xp,yp,w,h);
         blocks.push(block);
         ++nblocks;
      }
      
      public function windowActive(e:Event) : void
      {
         infocus = true;
      }
      
      public function createladder(xp:int, yp:int, w:int, h:int) : void
      {
         var block:Object = new Object();
         block.type = 2;
         block.xp = xp;
         block.yp = yp;
         block.w = w;
         block.h = h;
         block.rect = new Rectangle(xp,yp,w,h);
         blocks.push(block);
         ++nblocks;
      }
      
      public function createtrigger(xp:int, yp:int, w:int, h:int, t:int) : void
      {
         var block:Object = new Object();
         block.type = 1;
         block.xp = xp;
         block.yp = yp;
         block.w = w;
         block.h = h;
         block.rect = new Rectangle(xp,yp,w,h);
         block.trigger = t;
         blocks.push(block);
         ++nblocks;
      }
      
      public function removeallblocks(help:helpclass) : void
      {
         while(nblocks > 0)
         {
            removeblock(help,0);
         }
      }
      
      public function updatestate(obj:entityclass, help:helpclass, music:musicclass) : void
      {
         var vci:Number = NaN;
         --statedelay;
         if(statedelay <= 0)
         {
            statedelay = 0;
         }
         if(statedelay <= 0)
         {
            switch(state)
            {
               case 0:
                  break;
               case 1:
                  state = 17;
                  statedelay = 10;
                  resetenemycount();
                  startspecial = false;
                  currentroom = 0;
                  entx = 30;
                  enty = 94;
                  obj.createentity(entx,enty,0);
                  obj.entities[obj.getplayer()].onground = true;
                  obj.entities[obj.getplayer()].dir = 0;
                  obj.entities[obj.getplayer()].drawframe = 20;
                  inmenu = true;
                  hascontrol = false;
                  break;
               case 2:
                  state = 0;
                  removetrigger(help,2);
                  rain = false;
                  break;
               case 3:
                  state = 0;
                  removetrigger(help,3);
                  rain = true;
                  break;
               case 4:
                  if(obj.flags[3] == 1)
                  {
                     removetrigger(help,4);
                     state = 0;
                  }
                  else
                  {
                     state = 5;
                     statedelay = 6;
                     music.stopstep();
                     removetrigger(help,4);
                     hascontrol = false;
                  }
                  break;
               case 5:
                  help.globaltemp = obj.getplayer();
                  if(obj.entities[help.globaltemp].onground)
                  {
                     state = 6;
                     statedelay = 4;
                     obj.entities[help.globaltemp].pickupmode = 1;
                     obj.entities[help.globaltemp].pickupframe = 0;
                  }
                  break;
               case 6:
                  state = 7;
                  statedelay = 4;
                  showimage = 150;
                  currentimage = 0;
                  obj.changeflag(3,1);
                  obj.removeentitytype(help,8);
                  break;
               case 7:
                  state = 0;
                  hascontrol = true;
                  hasgun = true;
                  break;
               case 8:
                  if(showimage > 20)
                  {
                     showimage = 20;
                  }
                  removetrigger(help,8);
                  state = 0;
                  break;
               case 9:
                  if(obj.flags[4] == 0)
                  {
                     obj.changeflag(4,1);
                     showimage = 150;
                     currentimage = 2;
                  }
                  removetrigger(help,9);
                  state = 0;
                  break;
               case 10:
                  removetrigger(help,10);
                  if(obj.flags[26] == 0)
                  {
                     state = 11;
                     hascontrol = false;
                     currenthp = 3;
                     totalhp = 3;
                     hpposition = 120;
                     music.play(2);
                  }
                  else
                  {
                     state = 0;
                  }
                  break;
               case 11:
                  help.globaltemp = obj.getplayer();
                  if(obj.entities[help.globaltemp].onground)
                  {
                     obj.createentity(165,94,26);
                     obj.createentity(5,108,25);
                     obj.createentity(5,93,25,1);
                     obj.createentity(5,78,25);
                     obj.createentity(5,63,25,1);
                     obj.createentity(150,108,25);
                     obj.createentity(150,93,25,1);
                     obj.createentity(150,78,25);
                     obj.createentity(150,63,25,1);
                     hascontrol = true;
                     state = 0;
                  }
                  break;
               case 12:
                  obj.removeentitytype(help,25);
                  obj.changeflag(26,1);
                  state = 0;
                  currenthp = 0;
                  totalhp = 0;
                  hpposition = 0;
                  break;
               case 13:
                  obj.removeentitytype(help,23);
                  totalhp = 0;
                  currenthp = 0;
                  removeblockat(help,40,90);
                  removeblockat(help,20,70);
                  removeblockat(help,100,-10);
                  state = 0;
                  break;
               case 14:
                  hascontrol = false;
                  help.globaltemp = obj.getplayer();
                  obj.entities[help.globaltemp].vx = 2;
                  obj.entities[help.globaltemp].dir = 1;
                  if(currentroom == 52)
                  {
                     if(obj.entities[help.globaltemp].xp >= 80)
                     {
                        music.playef(20);
                        state = 15;
                        statedelay = 10;
                        obj.entities[help.globaltemp].vx = 0;
                     }
                  }
                  if(obj.entities[help.globaltemp].vx != 0 && Boolean(obj.entities[help.globaltemp].onground))
                  {
                     music.playstep(music.steptype);
                  }
                  else
                  {
                     music.stopstep();
                  }
                  break;
               case 15:
                  eurydicemode = true;
                  state = 16;
                  statedelay = 60;
                  break;
               case 16:
                  help.globaltemp = obj.getplayer();
                  obj.entities[help.globaltemp].vx = -2;
                  obj.entities[help.globaltemp].dir = 0;
                  if(currentroom == 53)
                  {
                     obj.entities[help.globaltemp].vx = 0;
                     hascontrol = true;
                     state = 0;
                  }
                  if(obj.entities[help.globaltemp].vx != 0 && Boolean(obj.entities[help.globaltemp].onground))
                  {
                     music.playstep(music.steptype);
                  }
                  else
                  {
                     music.stopstep();
                  }
                  break;
               case 17:
                  state = 18;
                  showcreditline = 5;
                  break;
               case 18:
                  --showcreditline;
                  if(showcreditline == 1)
                  {
                     state = 19;
                  }
                  break;
               case 19:
                  state = 20;
                  statedelay = 80;
                  break;
               case 20:
                  ++showcreditline;
                  if(showcreditline >= 5)
                  {
                     state = 21;
                     statedelay = 60;
                     showcreditline = 0;
                  }
                  break;
               case 21:
                  state = 22;
                  showtitle = 5;
                  break;
               case 22:
                  --showtitle;
                  if(showtitle == 1)
                  {
                     state = 23;
                  }
                  break;
               case 23:
                  showmenu = 1;
                  state = 0;
                  break;
               case 24:
                  ++showtitle;
                  if(showtitle >= 5)
                  {
                     state = 25;
                  }
                  break;
               case 25:
                  showtitle = 0;
                  state = 26;
                  statedelay = 20;
                  break;
               case 26:
                  newgamehighlighted = false;
                  inmenu = false;
                  hascontrol = true;
                  state = 27;
                  statedelay = 15;
                  setsavepoint(0);
                  break;
               case 27:
                  showimage = 160;
                  currentimage = 1;
                  state = 0;
                  break;
               case 28:
                  hascontrol = false;
                  help.globaltemp = obj.getplayer();
                  obj.entities[help.globaltemp].vx = -2;
                  obj.entities[help.globaltemp].dir = 0;
                  if(currentroom == 86)
                  {
                     if(obj.entities[help.globaltemp].xp <= 90)
                     {
                        state = 29;
                        statedelay = 90;
                        obj.entities[help.globaltemp].vx = 0;
                     }
                  }
                  if(obj.entities[help.globaltemp].vx != 0 && Boolean(obj.entities[help.globaltemp].onground))
                  {
                     music.playstep(music.steptype);
                  }
                  else
                  {
                     music.stopstep();
                  }
                  break;
               case 29:
                  obj.entities[obj.geteurydice()].state = 1;
                  obj.entities[obj.getplayer()].state = 1;
                  state = 30;
                  statedelay = 75;
                  break;
               case 30:
                  state = 31;
                  statedelay = 1;
                  startspecial = false;
                  currentroom = 0;
                  entx = 30;
                  enty = 94;
                  obj.removeentitytype(help,0);
                  obj.createentity(entx,enty,0);
                  obj.entities[obj.getplayer()].onground = true;
                  obj.entities[obj.getplayer()].dir = 0;
                  obj.entities[obj.getplayer()].drawframe = 20;
                  inmenu = true;
                  hascontrol = false;
                  break;
               case 31:
                  for(vci = 0; vci < 300; obj.flags[vci] = 0,vci++)
                  {
                  }
                  currentroom = 0;
                  bg = 8;
                  door_right = 5;
                  toggledeath = false;
                  flashlight = 0;
                  screenshake = 0;
                  eurydicemode = false;
                  rain = true;
                  hasgun = false;
                  createtrigger(130,0,10,150,8);
                  state = 17;
                  statedelay = 10;
                  obj.removeentitytype(help,31);
                  break;
               case 32:
                  removetrigger(help,32);
                  if(obj.flags[250] == 0)
                  {
                     music.play(0);
                     state = 0;
                     obj.changeflag(250,1);
                  }
                  else
                  {
                     state = 0;
                  }
                  break;
               case 33:
                  ++showtitle;
                  if(showtitle >= 5)
                  {
                     state = 34;
                  }
                  break;
               case 34:
                  showtitle = 0;
                  state = 35;
                  statedelay = 20;
                  break;
               case 35:
                  state = 0;
                  hascontrol = true;
                  hasgun = true;
                  rain = false;
                  restorehighlighted = false;
                  inmenu = false;
                  eurydicemode = false;
                  obj.restartroom = true;
                  obj.restartmode = 0;
                  obj.restartcounter = 0;
                  obj.norestartsound = true;
                  entdir = 1;
                  if(savepoint >= 1)
                  {
                     obj.flags[1] = 1;
                     obj.flags[2] = 1;
                     obj.flags[3] = 1;
                     obj.flags[4] = 1;
                     obj.flags[250] = 1;
                  }
                  if(savepoint >= 2)
                  {
                     obj.flags[13] = 1;
                     obj.flags[14] = 1;
                     obj.flags[15] = 1;
                  }
                  if(savepoint >= 5)
                  {
                     obj.flags[26] = 1;
                  }
                  if(savepoint >= 6)
                  {
                     obj.flags[48] = 1;
                     obj.flags[49] = 1;
                  }
                  if(savepoint >= 7)
                  {
                     obj.flags[50] = 1;
                     obj.flags[51] = 1;
                  }
                  if(savepoint == 1)
                  {
                     music.changeamb(1);
                     music.steptype = 1;
                     currentroom = 8;
                     entx = 2;
                     enty = 109;
                  }
                  else if(savepoint == 2)
                  {
                     music.changeamb(1);
                     music.steptype = 1;
                     currentroom = 16;
                     entx = 2;
                     enty = 106;
                  }
                  else if(savepoint == 3)
                  {
                     currentroom = 27;
                     entx = 2;
                     enty = 94;
                     music.changeamb(2);
                     music.steptype = 1;
                  }
                  else if(savepoint == 4)
                  {
                     currentroom = 37;
                     entx = 2;
                     enty = 94;
                     music.changeamb(1);
                     music.steptype = 1;
                  }
                  else if(savepoint == 5)
                  {
                     currentroom = 39;
                     entx = 2;
                     enty = 94;
                     music.changeamb(1);
                     music.steptype = 1;
                  }
                  else if(savepoint == 6)
                  {
                     currentroom = 45;
                     entx = 2;
                     enty = 74;
                     music.changeamb(1);
                     music.steptype = 1;
                  }
                  else if(savepoint == 7)
                  {
                     currentroom = 47;
                     entx = 2;
                     enty = 57;
                     music.changeamb(1);
                     music.steptype = 1;
                  }
                  else if(savepoint == 8)
                  {
                     currentroom = 49;
                     entx = 2;
                     enty = 94;
                     music.changeamb(3);
                     music.steptype = 1;
                  }
                  else if(savepoint == 9)
                  {
                     currentroom = 64;
                     entx = 150;
                     enty = 94;
                     entdir = 0;
                     music.changeamb(1);
                     music.steptype = 1;
                     music.play(3);
                     eurydicemode = true;
                  }
                  else if(savepoint == 10)
                  {
                     currentroom = 69;
                     entx = 150;
                     enty = 94;
                     entdir = 0;
                     music.changeamb(1);
                     music.steptype = 1;
                     music.play(3);
                     eurydicemode = true;
                  }
                  else if(savepoint == 11)
                  {
                     currentroom = 75;
                     entx = 150;
                     enty = 94;
                     entdir = 0;
                     music.changeamb(1);
                     music.steptype = 1;
                     music.play(3);
                     eurydicemode = true;
                  }
            }
         }
      }
      
      public function createdamage(xp:int, yp:int, w:int, h:int) : void
      {
         var block:Object = new Object();
         block.type = 3;
         block.xp = xp;
         block.yp = yp;
         block.w = w;
         block.h = h;
         block.rect = new Rectangle(xp,yp,w,h);
         blocks.push(block);
         ++nblocks;
      }
      
      public function removeblockat(help:helpclass, x:int, y:int) : void
      {
         for(var i:int = 0; i < nblocks; i++)
         {
            if(blocks[i].xp == x && blocks[i].yp == y)
            {
               removeblock(help,i);
            }
         }
      }
      
      public function removeblock(help:helpclass, t:int) : void
      {
         help.removeObject(blocks[t],blocks);
         --nblocks;
      }
      
      public function windowNotActive(e:Event) : void
      {
         infocus = false;
      }
      
      public function removetrigger(help:helpclass, t:int) : void
      {
         for(var i:int = 0; i < nblocks; i++)
         {
            if(blocks[i].type == 1)
            {
               if(blocks[i].trigger == t)
               {
                  removeblock(help,i);
               }
            }
         }
      }
      
      public function gotoroom(t:int, obj:entityclass, help:helpclass, music:musicclass) : void
      {
         if(t == currentroom || t == startroom && startspecial == true)
         {
            obj.resetflags();
         }
         else
         {
            obj.confirmflags();
         }
         removeallblocks(help);
         obj.removeallentities(help);
         door_up = -2;
         door_down = -2;
         door_right = -2;
         door_left = -2;
         currentroom = t;
         switch(t)
         {
            case 0:
               bg = 8;
               door_right = 5;
               toggledeath = false;
               flashlight = 0;
               screenshake = 0;
               eurydicemode = false;
               createblock(-10,110,180,100);
               createtrigger(130,0,10,150,8);
               break;
            case 1:
               bg = 2;
               door_right = 2;
               door_left = 7;
               createblock(-10,125,180,100);
               obj.createentity(90,109,6,0,0,1);
               createtrigger(-10,110,180,100,32);
               break;
            case 2:
               bg = 5;
               door_right = 3;
               door_left = 1;
               createblock(-10,125,180,100);
               createtrigger(70,0,20,160,4);
               obj.createentity(75,121,8,0,0,3);
               break;
            case 3:
               bg = 3;
               door_right = 4;
               door_left = 2;
               createdamage(-10,130,180,100);
               createblock(-10,125,65,100);
               createblock(130,125,40,100);
               createblock(73,119,12,4);
               createblock(101,112,12,4);
               break;
            case 4:
               music.changeamb(0);
               music.steptype = 0;
               bg = 4;
               door_right = 8;
               door_left = 3;
               rain = true;
               createblock(-10,125,180,100);
               createblock(72,-2,200,10);
               obj.createentity(165,50,2,0,0,2);
               break;
            case 5:
               bg = 6;
               door_left = 0;
               door_right = 6;
               createblock(-10,110,180,100);
               createblock(90,88,90,90);
               createtrigger(10,0,10,150,9);
               createtrigger(130,0,10,150,8);
               break;
            case 6:
               bg = 0;
               door_left = 5;
               door_down = 7;
               createblock(-10,88,80,100);
               break;
            case 7:
               bg = 1;
               door_up = 6;
               door_right = 1;
               createblock(0,0,28,128);
               createblock(0,-2,70,10);
               createblock(-10,125,180,100);
               createtrigger(-10,110,180,100,32);
               break;
            case 8:
               music.changeamb(1);
               music.steptype = 1;
               bg = 9;
               door_left = 4;
               door_right = 9;
               rain = false;
               createblock(-10,125,180,100);
               obj.createentity(50,18,11);
               obj.createentity(100,15,11);
               obj.createentity(70,58,2,0,0,5);
               if(savepoint < 1)
               {
                  setsavepoint(1);
               }
               break;
            case 9:
               bg = 10;
               door_left = 8;
               door_right = 10;
               createblock(-10,125,180,100);
               obj.createentity(10,14,11);
               obj.createentity(130,42,11);
               obj.createentity(110,35,9,0,0,6);
               break;
            case 10:
               bg = 11;
               door_left = 9;
               door_right = 11;
               createblock(-10,125,180,100);
               createblock(-10,-10,180,15);
               createblock(132,36,60,150);
               createladder(117,17,2,85);
               obj.createentity(15,32,2,0,0,9);
               obj.createentity(140,6,9,0,0,7);
               obj.createentity(40,6,9,0,0,12);
               break;
            case 11:
               bg = 12;
               door_left = 10;
               door_down = 12;
               createblock(-10,36,105,13);
               createblock(-10,-10,180,15);
               createblock(111,0,9,22);
               createblock(138,0,30,150);
               createblock(78,87,90,70);
               createblock(0,88,48,100);
               createblock(-10,36,35,100);
               obj.createentity(122,8,9,0,0,11);
               break;
            case 12:
               bg = 13;
               door_right = 13;
               createblock(-10,122,180,100);
               createblock(0,0,15,160);
               createblock(102,-1,80,66);
               createblock(146,100,40,30);
               obj.createentity(150,84,6,0,0,13);
               obj.createentity(30,65,2,0,0,14);
               obj.createentity(165,80,2,0,0,15);
               break;
            case 13:
               bg = 14;
               door_left = 12;
               door_right = 14;
               createblock(-20,100,200,80);
               createblock(-20,0,200,44);
               createblock(-20,-1,30,66);
               obj.createentity(50,55,19);
               obj.createentity(85,75,19);
               obj.createentity(120,55,19);
               startspecial = true;
               startx = 2;
               starty = 84;
               startroom = 13;
               break;
            case 14:
               bg = 15;
               door_left = 13;
               door_right = 15;
               music.fadeout();
               createblock(-20,100,75,80);
               createblock(-20,0,200,44);
               createblock(-10,122,180,100);
               obj.createentity(30,55,19);
               obj.createentity(40,60,19);
               startspecial = false;
               break;
            case 15:
               bg = 16;
               door_left = 14;
               door_right = 16;
               createblock(-10,122,180,100);
               break;
            case 16:
               bg = 17;
               door_left = 15;
               door_down = 17;
               createblock(-10,122,40,100);
               if(savepoint < 2)
               {
                  setsavepoint(2);
               }
               break;
            case 17:
               music.changeamb(1);
               music.steptype = 1;
               music.play(1);
               bg = 18;
               door_down = 18;
               createblock(-10,-50,15,300);
               createblock(155,-50,15,300);
               break;
            case 18:
               music.changeamb(-1);
               music.steptype = 2;
               bg = 7;
               door_down = 20;
               createblock(-10,-50,15,300);
               createblock(155,-50,15,300);
               break;
            case 20:
               bg = 7;
               door_down = 21;
               createblock(-10,-50,15,300);
               createblock(155,-50,15,300);
               break;
            case 21:
               bg = 7;
               door_right = 22;
               createblock(-10,-50,15,300);
               createblock(155,-10,15,60);
               createblock(-10,125,180,100);
               break;
            case 22:
               bg = 7;
               door_left = 21;
               door_right = 23;
               createblock(-10,-10,15,60);
               createblock(-100,125,280,100);
               obj.createentity(-60,106,6,0,0,16);
               obj.createentity(170,106,6,0,0,22);
               break;
            case 23:
               bg = 7;
               door_left = 22;
               door_right = 25;
               createblock(-10,125,180,100);
               createblock(100,110,100,100);
               obj.createentity(30,-80,9,0,0,18);
               obj.createentity(65,-60,9,0,0,19);
               obj.createentity(100,-40,9,0,0,20);
               obj.createentity(135,-20,9,0,0,21);
               break;
            case 24:
               bg = 7;
               door_left = 23;
               door_right = 25;
               createblock(-10,-10,180,15);
               createblock(-10,110,180,100);
               createblock(130,90,25,5);
               createblock(90,70,25,5);
               createblock(50,50,25,5);
               createblock(50,0,5,50);
               createblock(130,50,25,5);
               createblock(90,30,40,5);
               createblock(130,30,5,25);
               createblock(155,50,20,100);
               obj.createentity(20,50,20);
               obj.createentity(20,70,20);
               obj.createentity(20,90,20);
               obj.createentity(20,6,11);
               obj.createentity(60,6,11);
               obj.createentity(100,6,11);
               break;
            case 25:
               bg = 7;
               door_left = 23;
               door_right = 26;
               createblock(-10,-10,180,15);
               createblock(-10,110,180,100);
               createblock(20,95,15,51);
               createblock(30,5,50,30);
               createblock(30,80,50,40);
               createblock(110,5,60,30);
               createblock(110,80,60,40);
               obj.createentity(80,5,21);
               obj.createentity(100,100,21);
               obj.createentity(50,40,19);
               obj.createentity(80,30,20);
               obj.createentity(80,90,20);
               break;
            case 26:
               music.changeamb(-1);
               music.steptype = 2;
               bg = 7;
               door_left = 25;
               door_right = 27;
               createblock(-10,-10,180,15);
               createblock(-10,110,180,100);
               createblock(-10,80,50,40);
               break;
            case 27:
               music.changeamb(2);
               music.steptype = 1;
               bg = 19;
               door_left = 26;
               door_right = 28;
               createblock(-10,110,180,100);
               startspecial = false;
               if(savepoint < 3)
               {
                  setsavepoint(3);
               }
               break;
            case 28:
               bg = 20;
               door_left = 27;
               door_right = 29;
               createblock(-10,110,93,100);
               createdamage(-10,125,180,100);
               obj.createentity(110,110,22,0,0,80);
               obj.createentity(140,105,22,0,0,80);
               obj.createentity(60,88,24);
               obj.createentity(90,75,24);
               obj.createentity(120,75,24);
               obj.createentity(150,75,24);
               createblock(150,76,16,4);
               startspecial = true;
               startx = 40;
               starty = 94;
               startroom = 28;
               break;
            case 29:
               bg = 21;
               door_left = 28;
               door_right = 30;
               createdamage(-10,125,180,100);
               obj.createentity(0,75,24);
               obj.createentity(16,75,24);
               obj.createentity(32,75,24);
               obj.createentity(48,75,24);
               obj.createentity(70,105,22,0,0,65);
               obj.createentity(82,105,22,0,0,55);
               obj.createentity(94,105,22,0,0,45);
               obj.createentity(106,75,24);
               obj.createentity(122,75,24);
               obj.createentity(138,75,24);
               obj.createentity(154,75,24);
               createblock(0,76,16,4);
               createblock(138,76,16,4);
               createblock(154,76,16,4);
               break;
            case 30:
               bg = 22;
               door_left = 29;
               door_right = 31;
               createdamage(-10,125,180,100);
               obj.createentity(0,75,24);
               obj.createentity(80,50,23,0,0,40);
               obj.createentity(20,95,22,0,0,80);
               obj.createentity(70,95,22,0,0,20);
               obj.createentity(100,95,22,0,0,20);
               createblock(0,76,16,4);
               createblock(42,64,16,4);
               createblock(122,42,40,6);
               startspecial = true;
               startx = 45;
               starty = 48;
               startroom = 30;
               break;
            case 31:
               bg = 23;
               door_left = 30;
               door_right = 32;
               createdamage(-10,125,180,100);
               createblock(-10,42,74,6);
               createblock(107,70,16,6);
               createblock(155,63,16,6);
               createdamage(130,100,25,7);
               createblock(130,107,25,6);
               obj.createentity(80,95,22,0,0,89);
               obj.createentity(128,95,22,0,0,80);
               obj.createentity(140,95,22,0,0,60);
               obj.createentity(128,95,22,0,0,35);
               obj.createentity(140,95,22,0,0,15);
               obj.createentity(170,40,2,0,0,24);
               startspecial = true;
               startx = 110;
               starty = 54;
               startroom = 31;
               break;
            case 32:
               bg = 24;
               door_left = 31;
               door_right = 33;
               createdamage(-10,125,180,100);
               createblock(-10,63,26,6);
               obj.createentity(40,50,23,0,0,-15);
               obj.createentity(80,40,23,0,0,-13);
               obj.createentity(120,30,23,0,0,-11);
               obj.createentity(136,30,23,0,0,-11);
               obj.createentity(152,30,23,0,0,-11);
               startspecial = true;
               startx = 2;
               starty = 47;
               startroom = 32;
               break;
            case 33:
               bg = 21;
               door_left = 32;
               door_right = 34;
               createdamage(-10,125,180,100);
               obj.createentity(0,60,24);
               obj.createentity(16,60,24);
               obj.createentity(32,60,24);
               obj.createentity(48,60,24);
               obj.createentity(64,60,24);
               obj.createentity(20,80,23,0,0,10);
               obj.createentity(36,80,23,0,0,15);
               obj.createentity(52,80,23,0,0,20);
               obj.createentity(68,80,23,0,0,25);
               obj.createentity(84,80,23,0,0,30);
               obj.createentity(100,80,23,0,0,35);
               obj.createentity(116,80,23,0,0,45);
               obj.createentity(132,80,23,0,0,50);
               obj.createentity(148,80,23,0,0,55);
               break;
            case 34:
               bg = 21;
               door_left = 33;
               door_right = 35;
               createdamage(-10,125,180,100);
               obj.createentity(-12,80,23,0,0,45);
               obj.createentity(4,80,23,0,0,45);
               obj.createentity(20,80,23,0,0,35);
               obj.createentity(36,80,23,0,0,35);
               obj.createentity(52,80,23,0,0,25);
               obj.createentity(68,80,23,0,0,25);
               obj.createentity(84,80,23,0,0,15);
               obj.createentity(100,80,23,0,0,15);
               obj.createentity(116,79,24);
               obj.createentity(132,79,24);
               obj.createentity(148,79,24);
               break;
            case 35:
               bg = 25;
               door_left = 34;
               door_right = 36;
               createdamage(-10,125,180,100);
               createblock(0,80,16,4);
               obj.createentity(0,79,24);
               createblock(30,82,23,8);
               createblock(82,76,24,8);
               createblock(128,87,22,8);
               obj.createentity(56,95,22,0,0,80);
               obj.createentity(68,95,22,0,0,60);
               obj.createentity(56,95,22,0,0,20);
               obj.createentity(68,95,22,0,0,40);
               obj.createentity(112,105,22,0,0,80);
               obj.createentity(112,105,22,0,0,50);
               obj.createentity(112,105,22,0,0,20);
               startspecial = true;
               startx = 40;
               starty = 66;
               startroom = 35;
               break;
            case 36:
               music.changeamb(2);
               bg = 26;
               door_left = 35;
               door_right = 37;
               createdamage(-10,125,180,100);
               createblock(145,110,93,100);
               obj.createentity(10,85,24);
               obj.createentity(55,85,24);
               obj.createentity(100,85,24);
               break;
            case 37:
               music.changeamb(1);
               bg = 27;
               door_left = 36;
               door_right = 38;
               createblock(-10,110,200,100);
               startspecial = false;
               if(savepoint < 4)
               {
                  setsavepoint(4);
               }
               break;
            case 38:
               bg = 28;
               door_left = 37;
               door_right = 39;
               createblock(-100,110,400,100);
               createtrigger(20,-10,40,200,10);
               currenthp = 0;
               totalhp = 0;
               hpposition = 0;
               startspecial = true;
               startx = 20;
               starty = 94;
               startroom = 38;
               break;
            case 39:
               bg = 29;
               door_left = 38;
               door_right = 40;
               createblock(-100,110,400,100);
               obj.createentity(120,94,12,0,0,30);
               obj.createentity(165,60,2,0,0,33);
               startspecial = false;
               if(obj.flags[251] == 0)
               {
                  obj.changeflag(251,1);
                  music.play(0);
               }
               if(savepoint < 5)
               {
                  setsavepoint(5);
               }
               break;
            case 40:
               bg = 30;
               door_left = 39;
               door_right = 41;
               createblock(-100,110,400,100);
               obj.createentity(120,94,12,0,0,31);
               obj.createentity(80,94,12,0,0,32);
               obj.createentity(-40,94,12,0,0,34);
               break;
            case 41:
               bg = 31;
               door_left = 40;
               door_right = 42;
               createblock(-100,110,154,100);
               createblock(125,110,400,100);
               createdamage(-10,125,200,100);
               obj.createentity(64,95,23,0,0,45);
               obj.createentity(80,95,23,0,0,30);
               obj.createentity(96,95,23,0,0,15);
               obj.createentity(165,40,2,0,0,35);
               obj.createentity(195,10,2,0,0,36);
               obj.createentity(225,-20,2,0,0,37);
               obj.createentity(255,-50,2,0,0,38);
               obj.createentity(285,-80,2,0,0,39);
               obj.createentity(315,-110,2,0,0,40);
               obj.createentity(-50,40,2,0,0,41);
               obj.createentity(-80,10,2,0,0,42);
               obj.createentity(-110,-20,2,0,0,43);
               obj.createentity(-140,-50,2,0,0,44);
               obj.createentity(-170,-80,2,0,0,45);
               obj.createentity(-200,-110,2,0,0,46);
               break;
            case 42:
               bg = 32;
               door_left = 41;
               door_right = 43;
               createblock(-10,110,200,100);
               obj.createentity(130,78,17,0,0,47);
               startspecial = false;
               break;
            case 43:
               bg = 33;
               door_left = 42;
               door_down = 44;
               createblock(-10,110,55,100);
               startspecial = true;
               startx = 5;
               starty = 94;
               startroom = 43;
               break;
            case 44:
               bg = 34;
               door_right = 45;
               createblock(-10,-50,55,60);
               createblock(-10,-50,40,200);
               createblock(-10,90,200,200);
               obj.createentity(130,74,6,0,0,48);
               obj.createentity(50,74,12,0,0,49);
               break;
            case 45:
               bg = 37;
               door_left = 44;
               door_right = 46;
               createblock(136,40,200,200);
               createblock(-10,90,200,200);
               obj.createentity(80,80,23,0,0,50);
               obj.createentity(50,60,23,0,0,10);
               obj.createentity(20,40,23,0,0,30);
               obj.createentity(65,20,24);
               obj.createentity(49,20,24);
               obj.createentity(100,20,23,0,0,40);
               obj.flags[48] = 1;
               obj.flags[49] = 1;
               startspecial = true;
               startx = 5;
               starty = 74;
               startroom = 45;
               if(savepoint < 6)
               {
                  setsavepoint(6);
               }
               music.fadeout();
               break;
            case 46:
               bg = 35;
               door_left = 45;
               door_right = 47;
               createblock(-10,110,80,200);
               createblock(-10,120,200,200);
               createblock(-10,40,28,200);
               createblock(124,73,60,200);
               createblock(124,67,5,200);
               createladder(116,58,3,30);
               obj.createentity(25,95,23);
               obj.createentity(40,80,23);
               obj.createentity(55,65,23);
               obj.createentity(71,65,23);
               obj.createentity(90,88,17,0,0,50);
               obj.createentity(150,41,17,0,0,51);
               startspecial = false;
               break;
            case 47:
               bg = 36;
               door_left = 46;
               door_down = 48;
               createblock(-10,73,30,200);
               createblock(50,-10,7,200);
               startspecial = true;
               startx = 5;
               starty = 57;
               startroom = 47;
               currenthp = 0;
               totalhp = 0;
               if(savepoint < 7)
               {
                  setsavepoint(7);
               }
               break;
            case 48:
               music.changeamb(1);
               bg = 38;
               door_right = 49;
               createblock(-10,110,200,200);
               createblock(-10,-50,22,300);
               createblock(50,-50,7,65);
               createblock(157,-50,7,125);
               obj.createentity(90,30,27,0,0,52);
               currenthp = 5;
               totalhp = 5;
               hpposition = 120;
               obj.createentity(40,90,23,0,0,60);
               obj.createentity(20,70,23,0,0,0);
               break;
            case 49:
               music.changeamb(3);
               bg = 39;
               door_left = -1;
               door_right = 50;
               createblock(-10,-50,13,125);
               createblock(-10,110,200,200);
               startspecial = false;
               if(savepoint < 8)
               {
                  setsavepoint(8);
               }
               break;
            case 50:
               bg = 40;
               door_left = -1;
               door_right = 51;
               createblock(-10,110,200,200);
               break;
            case 51:
               bg = 41;
               door_left = -1;
               door_right = 52;
               createblock(-10,110,200,200);
               hasgun = true;
               eurydicemode = false;
               createtrigger(140,-10,200,200,14);
               break;
            case 52:
               bg = 42;
               door_left = 53;
               createblock(-10,110,200,200);
               createblock(105,-30,200,200);
               obj.createentity(115,85,28);
               hasgun = false;
               break;
            case 53:
               bg = 41;
               door_left = 54;
               door_right = -1;
               createblock(-10,110,200,200);
               hasgun = true;
               break;
            case 54:
               bg = 40;
               door_left = 55;
               door_right = -1;
               createblock(-10,110,200,200);
               break;
            case 55:
               music.changeamb(3);
               bg = 39;
               door_left = 56;
               door_right = -1;
               createblock(-10,-50,13,125);
               createblock(-10,110,200,200);
               break;
            case 56:
               music.changeamb(1);
               bg = 43;
               door_right = -1;
               door_up = 57;
               createblock(-10,110,200,200);
               createblock(-10,-50,22,300);
               createblock(50,-50,20,65);
               createblock(157,-50,7,125);
               createladder(99,-10,3,90);
               break;
            case 57:
               music.play(3);
               bg = 44;
               door_down = -1;
               door_up = 58;
               createblock(50,-50,20,265);
               createladder(99,-10,3,190);
               break;
            case 58:
               bg = 45;
               door_down = -1;
               door_up = 59;
               createblock(-10,120,80,265);
               createblock(-10,-10,30,265);
               createladder(43,-10,3,102);
               createladder(99,50,3,190);
               break;
            case 59:
               bg = 46;
               door_down = -1;
               door_left = 60;
               createblock(-10,110,42,10);
               createblock(-10,110,30,100);
               createladder(43,70,3,190);
               break;
            case 60:
               bg = 47;
               door_right = -1;
               door_left = 93;
               createblock(-10,110,200,100);
               break;
            case 61:
               bg = 47;
               door_right = -1;
               door_left = 87;
               createblock(-10,110,200,100);
               obj.createentity(20,108,22,0,0,60);
               obj.createentity(30,108,22,0,0,70);
               obj.createentity(40,108,22,0,0,80);
               obj.createentity(50,108,22,0,0,0);
               obj.createentity(60,108,22,0,0,10);
               obj.createentity(70,108,22,0,0,20);
               obj.createentity(80,108,22,0,0,30);
               obj.createentity(90,108,22,0,0,40);
               obj.createentity(100,108,22,0,0,50);
               obj.createentity(110,108,22,0,0,60);
               obj.createentity(120,108,22,0,0,70);
               obj.createentity(130,108,22,0,0,80);
               break;
            case 62:
               bg = 48;
               door_right = -1;
               door_left = 63;
               createblock(-10,110,200,100);
               createblock(30,80,13,100);
               createblock(118,17,11,24);
               createblock(30,95,98,100);
               createblock(30,0,100,26);
               obj.createentity(44,28,21,1);
               obj.createentity(105,29,21,2);
               obj.createentity(105,80,21,3);
               obj.createentity(44,80,21,4);
               break;
            case 63:
               bg = 47;
               door_right = -1;
               door_left = 88;
               createblock(-10,110,200,100);
               obj.createentity(10,100,20);
               obj.createentity(30,50,19);
               obj.createentity(80,50,19);
               obj.createentity(130,50,19);
               break;
            case 64:
               bg = 49;
               door_right = -1;
               door_up = 65;
               createblock(-10,110,200,265);
               createblock(-10,-10,32,265);
               createladder(43,-10,5,95);
               if(savepoint < 9)
               {
                  setsavepoint(9);
               }
               break;
            case 65:
               bg = 46;
               door_down = -1;
               door_left = 89;
               createblock(-10,110,42,10);
               createblock(-10,110,30,100);
               createladder(43,70,5,190);
               break;
            case 66:
               bg = 47;
               door_right = -1;
               door_left = 90;
               createblock(-10,110,200,100);
               obj.createentity(0,10,11);
               obj.createentity(10,10,11);
               obj.createentity(20,10,11);
               obj.createentity(30,10,11);
               obj.createentity(40,10,11);
               obj.createentity(50,10,11);
               obj.createentity(60,10,11);
               obj.createentity(70,10,11);
               obj.createentity(80,10,11);
               obj.createentity(90,10,11);
               obj.createentity(100,10,11);
               obj.createentity(110,10,11);
               obj.createentity(120,10,11);
               obj.createentity(130,10,11);
               obj.createentity(140,10,11);
               obj.createentity(150,10,11);
               obj.createentity(160,10,11);
               break;
            case 67:
               bg = 47;
               door_right = -1;
               door_left = 68;
               createblock(-10,110,200,100);
               obj.createentity(35,108,22,0,0,80);
               obj.createentity(45,108,22,0,0,0);
               obj.createentity(55,108,22,0,0,10);
               obj.createentity(65,108,22,0,0,20);
               obj.createentity(85,108,22,0,0,80);
               obj.createentity(95,108,22,0,0,0);
               obj.createentity(105,108,22,0,0,10);
               obj.createentity(115,108,22,0,0,20);
               obj.createentity(35,108,22,0,0,35);
               obj.createentity(45,108,22,0,0,45);
               obj.createentity(55,108,22,0,0,55);
               obj.createentity(65,108,22,0,0,65);
               obj.createentity(85,108,22,0,0,35);
               obj.createentity(95,108,22,0,0,45);
               obj.createentity(105,108,22,0,0,55);
               obj.createentity(115,108,22,0,0,65);
               break;
            case 68:
               bg = 50;
               door_right = -1;
               door_left = 69;
               createblock(-10,110,200,100);
               createblock(34,95,86,60);
               createblock(34,0,86,28);
               obj.createentity(40,30,19);
               obj.createentity(50,35,19);
               obj.createentity(60,40,19);
               obj.createentity(90,50,19);
               obj.createentity(100,55,19);
               obj.createentity(110,60,19);
               break;
            case 69:
               bg = 49;
               door_right = -1;
               door_up = 70;
               createblock(-10,110,200,265);
               createblock(-10,-10,32,265);
               createladder(43,-10,5,95);
               if(savepoint < 10)
               {
                  setsavepoint(10);
               }
               break;
            case 70:
               bg = 46;
               door_down = -1;
               door_left = 91;
               createblock(-10,110,42,10);
               createblock(-10,110,30,100);
               createladder(43,70,5,190);
               toggledeath = false;
               break;
            case 71:
               bg = 53;
               door_right = -1;
               door_left = 72;
               createblock(-10,110,200,100);
               createblock(19,-10,121,55);
               createblock(19,98,16,60);
               createblock(19,-10,16,60);
               createblock(125,-10,16,60);
               createblock(125,98,16,60);
               obj.createentity(35,101,21,4);
               obj.createentity(54,101,21,3);
               obj.createentity(73,101,21,3);
               obj.createentity(93,101,21,3);
               obj.createentity(116,101,21,3);
               obj.createentity(35,45,21,1);
               obj.createentity(54,45,21,1);
               obj.createentity(73,45,21,1);
               obj.createentity(93,45,21,1);
               obj.createentity(116,45,21,2);
               obj.createentity(19,50,23);
               obj.createentity(19,54,23);
               obj.createentity(19,58,23);
               obj.createentity(19,62,23);
               obj.createentity(19,66,23);
               obj.createentity(19,70,23);
               obj.createentity(19,74,23);
               obj.createentity(19,78,23);
               obj.createentity(19,82,23);
               obj.createentity(19,86,23);
               obj.createentity(19,90,23);
               obj.createentity(19,94,23);
               toggledeath = true;
               break;
            case 72:
               bg = 52;
               door_right = -1;
               door_left = 73;
               createblock(-10,110,200,100);
               createblock(112,40,20,100);
               createblock(13,9,24,68);
               createladder(135,23,6,60);
               createblock(-10,-10,200,25);
               obj.createentity(56,40,20);
               obj.createentity(66,55,20);
               obj.createentity(76,70,20);
               toggledeath = false;
               break;
            case 73:
               bg = 54;
               door_right = -1;
               door_left = 92;
               createblock(-10,-10,200,25);
               createblock(-10,110,200,100);
               createblock(15,40,5,100);
               createblock(15,40,30,5);
               createblock(15,63,10,5);
               createblock(40,40,5,10);
               createblock(40,80,5,100);
               createblock(140,0,5,90);
               createblock(115,85,30,5);
               createblock(135,63,10,5);
               createblock(115,0,5,50);
               createblock(115,80,5,10);
               obj.createentity(20,45,21);
               obj.createentity(131,76,21);
               createblock(80,35,10,5);
               createblock(100,45,10,5);
               createladder(105,55,5,28);
               createladder(80,45,5,28);
               createladder(55,25,5,38);
               break;
            case 74:
               bg = 51;
               door_right = -1;
               door_left = 75;
               createblock(-10,-10,200,25);
               createblock(144,110,80,100);
               createblock(-10,110,34,100);
               createdamage(-10,120,200,100);
               createladder(132,22,5,70);
               createladder(29,22,5,70);
               obj.createentity(64,85,23);
               obj.createentity(80,85,23);
               break;
            case 75:
               bg = 55;
               door_right = -1;
               door_left = 76;
               createblock(-10,110,200,100);
               if(savepoint < 11)
               {
                  setsavepoint(11);
               }
               break;
            case 76:
               bg = 56;
               door_right = -1;
               door_down = 77;
               createblock(120,110,200,100);
               createblock(80,122,200,100);
               createblock(0,0,40,200);
               break;
            case 77:
               bg = 10;
               door_right = -1;
               door_left = 78;
               createblock(-10,125,180,100);
               obj.createentity(10,14,11);
               obj.createentity(130,42,11);
               break;
            case 78:
               music.changeamb(1);
               music.steptype = 1;
               bg = 9;
               door_left = 79;
               door_right = -1;
               rain = false;
               createblock(-10,125,180,100);
               obj.createentity(50,18,11);
               obj.createentity(100,15,11);
               break;
            case 79:
               music.fadeout();
               music.changeamb(0);
               music.steptype = 0;
               bg = 4;
               door_right = -1;
               door_left = 80;
               rain = true;
               createblock(-10,125,180,100);
               createblock(72,-2,200,10);
               break;
            case 80:
               bg = 3;
               door_right = -1;
               door_left = 81;
               createdamage(-10,130,180,100);
               createblock(-10,125,60,100);
               createblock(130,125,40,100);
               createblock(73,119,12,4);
               createblock(102,112,10,4);
               break;
            case 81:
               bg = 5;
               door_right = -1;
               door_left = 82;
               createblock(-10,125,180,100);
               break;
            case 82:
               bg = 2;
               door_right = -1;
               door_left = 83;
               createblock(-10,125,180,100);
               break;
            case 83:
               bg = 57;
               door_up = 84;
               door_right = 1;
               createblock(0,0,28,128);
               createblock(0,-2,70,10);
               createblock(-10,125,180,100);
               createladder(72,-10,5,110);
               break;
            case 84:
               bg = 58;
               door_left = 85;
               door_down = -1;
               door_right = -1;
               createblock(-10,88,80,100);
               createladder(72,75,5,110);
               break;
            case 85:
               bg = 6;
               door_left = 86;
               door_right = -1;
               createtrigger(-10,-10,60,200,28);
               createblock(-10,110,180,100);
               createblock(90,88,90,90);
               break;
            case 86:
               bg = 8;
               door_right = -1;
               createblock(-10,110,180,100);
               obj.createentity(30,94,31);
               setsavepoint(0);
               break;
            case 87:
               bg = 47;
               door_right = -1;
               door_left = 62;
               createblock(-10,110,200,100);
               break;
            case 88:
               bg = 47;
               door_right = -1;
               door_left = 64;
               createblock(-10,110,200,100);
               break;
            case 89:
               bg = 47;
               door_right = -1;
               door_left = 66;
               createblock(-10,110,200,100);
               break;
            case 90:
               bg = 47;
               door_right = -1;
               door_left = 67;
               createblock(-10,110,200,100);
               break;
            case 91:
               bg = 47;
               door_right = -1;
               door_left = 71;
               createblock(-10,110,200,100);
               break;
            case 92:
               bg = 47;
               door_right = -1;
               door_left = 74;
               createblock(-10,110,200,100);
               break;
            case 93:
               bg = 60;
               door_right = -1;
               door_left = 61;
               createblock(-10,110,200,100);
               createblock(10,-10,10,100);
               createblock(40,30,70,10);
               createblock(40,30,40,30);
               createblock(140,-10,10,100);
               createblock(110,80,30,10);
               createblock(100,90,50,4);
               createblock(10,-10,140,15);
               createladder(125,10,3,50);
               obj.createentity(40,60,19);
               obj.createentity(57,60,19);
               obj.createentity(75,60,19);
         }
      }
      
      public function updaterain(obj:entityclass) : void
      {
         --raindelay;
         if(raindelay <= 0)
         {
            raindelay = 0;
         }
         if(rain && raindelay <= 0)
         {
            raindelay = 2;
            obj.createentity(Math.random() * 200,-5 - Math.random() * 5,4,-3,8);
         }
      }
      
      public function incenemycount() : void
      {
         if(currentroom != 48)
         {
            ++enemycount;
         }
      }
   }
}

