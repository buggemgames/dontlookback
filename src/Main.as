package
{
   import bigroom.input.KeyPoll;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import flash.ui.Keyboard;
   
   public class Main extends Sprite
   {
      public var pi:uint;
      
      public var game:gameclass;
      
      private var im_opt_offline1:Class = Main_im_opt_offline1;
      
      public var dwgfx:dwgraphicsclass = new dwgraphicsclass();
      
      public var pj:uint;
      
      private var ef_0:Class = Main_ef_0;
      
      private var ef_1:Class = Main_ef_1;
      
      private var ef_2:Class = Main_ef_2;
      
      private var ef_3:Class = Main_ef_3;
      
      private var ef_4:Class = Main_ef_4;
      
      private var amb_3:Class = Main_amb_3;
      
      private var ef_6:Class = Main_ef_6;
      
      private var ef_7:Class = Main_ef_7;
      
      private var ef_8:Class = Main_ef_8;
      
      private var ef_9:Class = Main_ef_9;
      
      private var ef_5:Class = Main_ef_5;
      
      public var music:musicclass = new musicclass();
      
      private var im_opt_newgame1:Class = Main_im_opt_newgame1;
      
      private var im_opt_newgame2:Class = Main_im_opt_newgame2;
      
      public var clickedlogo:Boolean;
      
      private var im_title1:Class = Main_im_title1;
      
      private var im_title2:Class = Main_im_title2;
      
      public var key:KeyPoll;
      
      public var pixel2:uint;
      
      private var ef_10:Class = Main_ef_10;
      
      private var ef_11:Class = Main_ef_11;
      
      private var ef_12:Class = Main_ef_12;
      
      private var im_website:Class = Main_im_website;
      
      private var ef_14:Class = Main_ef_14;
      
      private var ef_16:Class = Main_ef_16;
      
      private var ef_17:Class = Main_ef_17;
      
      private var ef_18:Class = Main_ef_18;
      
      public var pixel:uint;
      
      private var ef_13:Class = Main_ef_13;
      
      private var ef_15:Class = Main_ef_15;
      
      private var ef_19:Class = Main_ef_19;
      
      public const GAMEMODE:int = 0;
      
      private var music_1:Class = Main_music_1;
      
      private var music_2:Class = Main_music_2;
      
      private var music_3:Class = Main_music_3;
      
      private var im_background_0:Class = Main_im_background_0;
      
      private var im_background_1:Class = Main_im_background_1;
      
      private var im_background_2:Class = Main_im_background_2;
      
      private var im_background_3:Class = Main_im_background_3;
      
      public var slogo:MovieClip;
      
      private var im_background_5:Class = Main_im_background_5;
      
      private var im_background_6:Class = Main_im_background_6;
      
      private var im_background_7:Class = Main_im_background_7;
      
      private var im_background_8:Class = Main_im_background_8;
      
      private var im_background_9:Class = Main_im_background_9;
      
      private var im_background_4:Class = Main_im_background_4;
      
      private var music_4:Class = Main_music_4;
      
      private var im_opt_restore2:Class = Main_im_opt_restore2;
      
      private var ef_22:Class = Main_ef_22;
      
      private var im_opt_restore1:Class = Main_im_opt_restore1;
      
      private var im_tiles:Class = Main_im_tiles;
      
      private var im_sponsorwebsite:Class = Main_im_sponsorwebsite;
      
      private var ef_21:Class = Main_ef_21;
      
      private var im_bfontmask:Class = Main_im_bfontmask;
      
      private var im_creditline1:Class = Main_im_creditline1;
      
      private var im_creditline2:Class = Main_im_creditline2;
      
      private var im_presszorup:Class = Main_im_presszorup;
      
      private var ef_20:Class = Main_ef_20;
      
      private var im_bfont:Class = Main_im_bfont;
      
      private var im_opt_visitsite2:Class = Main_im_opt_visitsite2;
      
      private var footsteps_1:Class = Main_footsteps_1;
      
      private var im_opt_visitsite1:Class = Main_im_opt_visitsite1;
      
      private var im_pressxorspace:Class = Main_im_pressxorspace;
      
      private var im_background_10:Class = Main_im_background_10;
      
      private var im_background_11:Class = Main_im_background_11;
      
      public var obj:entityclass = new entityclass();
      
      private var im_background_13:Class = Main_im_background_13;
      
      private var im_background_14:Class = Main_im_background_14;
      
      private var im_background_15:Class = Main_im_background_15;
      
      private var im_background_16:Class = Main_im_background_16;
      
      private var im_background_17:Class = Main_im_background_17;
      
      private var im_background_18:Class = Main_im_background_18;
      
      private var im_background_19:Class = Main_im_background_19;
      
      private var footsteps_2:Class = Main_footsteps_2;
      
      private var im_sponsorwebsite2:Class = Main_im_sponsorwebsite2;
      
      private var im_background_12:Class = Main_im_background_12;
      
      private var footsteps_3:Class = Main_footsteps_3;
      
      private var im_background_20:Class = Main_im_background_20;
      
      private var im_pressarrowkeys:Class = Main_im_pressarrowkeys;
      
      private var im_background_22:Class = Main_im_background_22;
      
      private var im_background_23:Class = Main_im_background_23;
      
      private var im_background_25:Class = Main_im_background_25;
      
      private var im_background_26:Class = Main_im_background_26;
      
      private var im_background_27:Class = Main_im_background_27;
      
      private var im_background_21:Class = Main_im_background_21;
      
      private var im_background_29:Class = Main_im_background_29;
      
      private var im_background_24:Class = Main_im_background_24;
      
      private var im_background_28:Class = Main_im_background_28;
      
      private var im_opt_fullscreen1:Class = Main_im_opt_fullscreen1;
      
      private var im_opt_fullscreen2:Class = Main_im_opt_fullscreen2;
      
      private var im_background_30:Class = Main_im_background_30;
      
      private var im_background_32:Class = Main_im_background_32;
      
      private var im_background_34:Class = Main_im_background_34;
      
      private var im_background_36:Class = Main_im_background_36;
      
      private var im_background_38:Class = Main_im_background_38;
      
      private var im_background_33:Class = Main_im_background_33;
      
      private var im_background_35:Class = Main_im_background_35;
      
      public var help:helpclass = new helpclass();
      
      private var im_background_37:Class = Main_im_background_37;
      
      private var im_background_31:Class = Main_im_background_31;
      
      private var im_background_40:Class = Main_im_background_40;
      
      private var im_background_41:Class = Main_im_background_41;
      
      private var im_background_43:Class = Main_im_background_43;
      
      private var im_background_45:Class = Main_im_background_45;
      
      private var im_background_46:Class = Main_im_background_46;
      
      private var im_background_47:Class = Main_im_background_47;
      
      private var im_background_48:Class = Main_im_background_48;
      
      private var im_background_49:Class = Main_im_background_49;
      
      private var im_background_44:Class = Main_im_background_44;
      
      private var im_background_39:Class = Main_im_background_39;
      
      private var im_background_42:Class = Main_im_background_42;
      
      private var im_background_50:Class = Main_im_background_50;
      
      private var im_background_51:Class = Main_im_background_51;
      
      private var im_background_52:Class = Main_im_background_52;
      
      private var im_background_53:Class = Main_im_background_53;
      
      private var im_background_54:Class = Main_im_background_54;
      
      private var im_background_55:Class = Main_im_background_55;
      
      private var im_background_56:Class = Main_im_background_56;
      
      private var im_background_58:Class = Main_im_background_58;
      
      private var im_background_59:Class = Main_im_background_59;
      
      private var im_background_57:Class = Main_im_background_57;
      
      private var im_background_60:Class = Main_im_background_60;
      
      private var im_sponscreditline1:Class = Main_im_sponscreditline1;
      
      private var im_sponscreditline2:Class = Main_im_sponscreditline2;
      
      public var logoposition:Matrix;
      
      public var gamestate:int;
      
      private var amb_1:Class = Main_amb_1;
      
      private var amb_2:Class = Main_amb_2;
      
      private var amb_4:Class = Main_amb_4;
      
      private var im_opt_offline2:Class = Main_im_opt_offline2;
      
      public function Main()
      {
         super();
         if(stage)
         {
            init();
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,gameinit);
         }
      }
      
      private function gameinit(e:Event = null) : void
      {
         var tempbmp:Bitmap = null;
         var rc_menu:ContextMenu = null;
         var credit:ContextMenuItem = null;
         removeEventListener(Event.ADDED_TO_STAGE,gameinit);
         if(sitelock())
         {
            rc_menu = new ContextMenu();
            credit = new ContextMenuItem("Visit distractionware.com");
            credit.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,visit_distractionware);
            rc_menu.hideBuiltInItems();
            rc_menu.customItems.push(credit);
            this.contextMenu = rc_menu;
            gamestate = GAMEMODE;
            obj.init();
            help.init();
            key = new KeyPoll(stage);
            SoundMixer.soundTransform = new SoundTransform(1);
            music.currentamb = -1;
            music.currentsong = -1;
            music.musicfade = 0;
            music.step1playing = false;
            music.step2playing = false;
            music.stepchanlen = 0;
            music.initefchannels();
            music.currentefchan = 0;
            music.musicchan.push(new music_1());
            music.musicchan.push(new music_2());
            music.musicchan.push(new music_3());
            music.musicchan.push(new music_4());
            music.ambchan.push(new amb_1());
            music.ambchan.push(new amb_2());
            music.ambchan.push(new amb_3());
            music.ambchan.push(new amb_4());
            music.stepchan.push(new footsteps_1());
            music.stepchan.push(new footsteps_2());
            music.stepchan.push(new footsteps_3());
            music.efchan.push(new ef_0());
            music.efchan.push(new ef_1());
            music.efchan.push(new ef_2());
            music.efchan.push(new ef_3());
            music.efchan.push(new ef_4());
            music.efchan.push(new ef_5());
            music.efchan.push(new ef_6());
            music.efchan.push(new ef_7());
            music.efchan.push(new ef_8());
            music.efchan.push(new ef_9());
            music.efchan.push(new ef_10());
            music.efchan.push(new ef_11());
            music.efchan.push(new ef_12());
            music.efchan.push(new ef_13());
            music.efchan.push(new ef_14());
            music.efchan.push(new ef_15());
            music.efchan.push(new ef_16());
            music.efchan.push(new ef_17());
            music.efchan.push(new ef_18());
            music.efchan.push(new ef_19());
            music.efchan.push(new ef_20());
            music.efchan.push(new ef_21());
            music.efchan.push(new ef_22());
            game = new gameclass(obj,help,music);
            game.standaloneversion = true;
            dwgfx.init();
            tempbmp = new im_tiles();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.maketilearray();
            tempbmp = new im_bfont();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.makebfont();
            tempbmp = new im_bfontmask();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.makebfontmask();
            tempbmp = new im_pressxorspace();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_pressarrowkeys();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_presszorup();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_title1();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_title2();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_creditline1();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_creditline2();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_opt_newgame1();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_opt_newgame2();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_opt_offline1();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_opt_offline2();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_opt_visitsite1();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_opt_visitsite2();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_opt_fullscreen1();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_opt_fullscreen2();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_website();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_opt_restore1();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_opt_restore2();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_sponsorwebsite();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_sponscreditline1();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_sponscreditline2();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_sponsorwebsite2();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = new im_background_0();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_1();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_2();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_3();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_4();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_5();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_6();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_7();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_8();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_9();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_10();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_11();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_12();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_13();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_14();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_15();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_16();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_17();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_18();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_19();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_20();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_21();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_22();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_23();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_24();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_25();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_26();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_27();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_28();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_29();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_30();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_31();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_32();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_33();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_34();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_35();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_36();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_37();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_38();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_39();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_40();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_41();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_42();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_43();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_44();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_45();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_46();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_47();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_48();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_49();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_50();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_51();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_52();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_53();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_54();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_55();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_56();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_57();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_58();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_59();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = new im_background_60();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            dwgfx.buffer = new BitmapData(160,144,false,0);
            addChild(dwgfx);
            music.changeamb(0);
            music.steptype = 0;
            addEventListener(Event.ENTER_FRAME,mainloop);
         }
         else
         {
            dwgfx.init();
            addChild(dwgfx);
            tempbmp = new im_bfont();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.makebfont();
            tempbmp = new im_bfontmask();
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.makebfontmask();
            dwgfx.buffer = new BitmapData(160,144,false,0);
            addEventListener(Event.ENTER_FRAME,lockedloop);
         }
      }
      
      public function gamerender(key:KeyPoll, dwgfx:dwgraphicsclass, game:gameclass, obj:entityclass, help:helpclass) : void
      {
         var i:int = 0;
         dwgfx.backbuffer.lock();
         dwgfx.drawbackground(game.bg);
         if(game.showblocks)
         {
            for(i = 0; i < game.nblocks; i++)
            {
               if(game.blocks[i].type == 0)
               {
                  dwgfx.backbuffer.fillRect(game.blocks[i].rect,11184810);
               }
               else if(game.blocks[i].type == 1)
               {
                  dwgfx.backbuffer.fillRect(game.blocks[i].rect,170);
               }
               else if(game.blocks[i].type == 2)
               {
                  dwgfx.backbuffer.fillRect(game.blocks[i].rect,43520);
               }
               else if(game.blocks[i].type == 3)
               {
                  dwgfx.backbuffer.fillRect(game.blocks[i].rect,16711680);
               }
            }
         }
         dwgfx.drawentities(obj,help);
         if(game.totalhp > 0)
         {
            dwgfx.drawbossmeter(game);
         }
         if(obj.restartroom && obj.restartmode > -1)
         {
            dwgfx.backbuffer.fillRect(new Rectangle(0,0,160,8 * obj.restartcounter),1114884);
            dwgfx.backbuffer.fillRect(new Rectangle(0,144 - 8 * obj.restartcounter,160,180),1114884);
            dwgfx.backbuffer.fillRect(new Rectangle(0,0,9 * obj.restartcounter,144),1114884);
            dwgfx.backbuffer.fillRect(new Rectangle(160 - 9 * obj.restartcounter,0,190,144),1114884);
         }
         if(game.showimage > 0)
         {
            --game.showimage;
            if(game.showimage > 130)
            {
               dwgfx.drawimage(game.currentimage,0,140 - game.showimage,true);
            }
            else if(game.showimage < 20)
            {
               dwgfx.drawimage(game.currentimage,0,game.showimage - 10,true);
            }
            else
            {
               dwgfx.drawimage(game.currentimage,0,10,true);
            }
         }
         if(game.showcreditline > 1)
         {
            if(game.kongversion)
            {
               dwgfx.drawimage(20,0,8,true);
            }
            else
            {
               dwgfx.drawimage(6,0,16,true);
            }
         }
         else if(game.showcreditline == 1)
         {
            if(game.kongversion)
            {
               dwgfx.drawimage(19,0,8,true);
            }
            else
            {
               dwgfx.drawimage(5,0,16,true);
            }
         }
         if(game.showtitle > 1)
         {
            dwgfx.drawimage(4,0,8,true);
         }
         else if(game.showtitle == 1)
         {
            dwgfx.drawimage(3,0,8,true);
         }
         if(game.showmenu > 0)
         {
            if(game.standaloneversion)
            {
               if(game.savepoint > 0)
               {
                  if(game.newgamehighlighted)
                  {
                     dwgfx.drawimage(7,0,32,true);
                  }
                  else
                  {
                     dwgfx.drawimage(8,0,32,true);
                  }
                  if(game.restorehighlighted)
                  {
                     dwgfx.drawimage(16,0,42,true);
                  }
                  else
                  {
                     dwgfx.drawimage(17,0,42,true);
                  }
                  if(game.visithighlighted)
                  {
                     dwgfx.drawimage(11,0,52,true);
                  }
                  else
                  {
                     dwgfx.drawimage(12,0,52,true);
                  }
               }
               else
               {
                  if(game.newgamehighlighted)
                  {
                     dwgfx.drawimage(7,0,37,true);
                  }
                  else
                  {
                     dwgfx.drawimage(8,0,37,true);
                  }
                  if(game.visithighlighted)
                  {
                     dwgfx.drawimage(11,0,47,true);
                  }
                  else
                  {
                     dwgfx.drawimage(12,0,47,true);
                  }
               }
               dwgfx.drawimage(13,0,128,true);
               dwgfx.drawimage(15,0,136,true);
            }
            else
            {
               if(game.savepoint > 0)
               {
                  if(game.newgamehighlighted)
                  {
                     dwgfx.drawimage(7,0,28,true);
                  }
                  else
                  {
                     dwgfx.drawimage(8,0,28,true);
                  }
                  if(game.restorehighlighted)
                  {
                     dwgfx.drawimage(16,0,37,true);
                  }
                  else
                  {
                     dwgfx.drawimage(17,0,37,true);
                  }
                  if(game.offlinehighlighted)
                  {
                     dwgfx.drawimage(9,0,46,true);
                  }
                  else
                  {
                     dwgfx.drawimage(10,0,46,true);
                  }
                  if(game.visithighlighted)
                  {
                     dwgfx.drawimage(11,0,55,true);
                  }
                  else
                  {
                     dwgfx.drawimage(12,0,55,true);
                  }
               }
               else
               {
                  if(game.newgamehighlighted)
                  {
                     dwgfx.drawimage(7,0,32,true);
                  }
                  else
                  {
                     dwgfx.drawimage(8,0,32,true);
                  }
                  if(game.offlinehighlighted)
                  {
                     dwgfx.drawimage(9,0,42,true);
                  }
                  else
                  {
                     dwgfx.drawimage(10,0,42,true);
                  }
                  if(game.visithighlighted)
                  {
                     dwgfx.drawimage(11,0,52,true);
                  }
                  else
                  {
                     dwgfx.drawimage(12,0,52,true);
                  }
               }
               if(game.kongversion)
               {
                  if(game.my > 134)
                  {
                     dwgfx.drawimage(21,0,135,true);
                  }
                  else
                  {
                     dwgfx.drawimage(18,0,135,true);
                  }
               }
               else
               {
                  dwgfx.drawimage(15,0,136,true);
               }
            }
         }
         if(game.standaloneversion)
         {
            if(game.savepoint > 0)
            {
               if(game.newgamehighlighted)
               {
                  dwgfx.drawimage(7,0,32,true);
               }
               if(game.restorehighlighted)
               {
                  dwgfx.drawimage(16,0,42,true);
               }
               if(game.visithighlighted)
               {
                  dwgfx.drawimage(11,0,52,true);
               }
            }
            else
            {
               if(game.newgamehighlighted)
               {
                  dwgfx.drawimage(7,0,37,true);
               }
               if(game.visithighlighted)
               {
                  dwgfx.drawimage(11,0,47,true);
               }
            }
         }
         else if(game.savepoint > 0)
         {
            if(game.newgamehighlighted)
            {
               dwgfx.drawimage(7,0,28,true);
            }
            if(game.restorehighlighted)
            {
               dwgfx.drawimage(16,0,37,true);
            }
            if(game.offlinehighlighted)
            {
               dwgfx.drawimage(9,0,46,true);
            }
            if(game.visithighlighted)
            {
               dwgfx.drawimage(11,0,55,true);
            }
         }
         else
         {
            if(game.newgamehighlighted)
            {
               dwgfx.drawimage(7,0,32,true);
            }
            if(game.offlinehighlighted)
            {
               dwgfx.drawimage(9,0,42,true);
            }
            if(game.visithighlighted)
            {
               dwgfx.drawimage(11,0,52,true);
            }
         }
         if(game.test)
         {
            dwgfx.print(2,2,game.teststring,255,255,255);
         }
         if(game.debugmode)
         {
            dwgfx.backbuffer.fillRect(new Rectangle(game.lastx,game.lasty,int(mouseX / 4) - game.lastx,int(mouseY / 4) - game.lasty),10066329);
            dwgfx.print(2,134,String(game.lastx) + "," + String(game.lasty) + ": " + String(int(mouseX / 4) - game.lastx) + "," + String(int(mouseY / 4) - game.lasty),255,255,255);
         }
         if(game.flashlight > 0)
         {
            --game.flashlight;
            dwgfx.flashlight();
         }
         if(game.screenshake > 0)
         {
            --game.screenshake;
            dwgfx.screenshake();
            dwgfx.backbuffer.unlock();
         }
         else
         {
            dwgfx.render();
            dwgfx.backbuffer.unlock();
         }
      }
      
      public function gamelogic(key:KeyPoll, dwgfx:dwgraphicsclass, game:gameclass, obj:entityclass, help:helpclass, music:musicclass) : void
      {
         var zi:int = 0;
         var i:int = 0;
         var j:int = 0;
         var qwei:int = 0;
         music.processmusic();
         music.processamb();
         music.processstep();
         help.updateglow();
         if(obj.checkdamage(game) && !obj.restartroom)
         {
            obj.restartroom = true;
            obj.restartmode = 0;
            obj.restartcounter = 0;
         }
         if(obj.restartroom)
         {
            if(obj.restartmode == -1)
            {
               for(zi = 0; zi < obj.nentity; zi++)
               {
                  if(obj.entities[zi].type == 28 || obj.entities[zi].type == 30)
                  {
                     obj.updateentities(zi,help,game,music);
                     obj.entities[zi].newxp = obj.entities[zi].xp + obj.entities[zi].vx;
                     obj.entities[zi].newyp = obj.entities[zi].yp + obj.entities[zi].vy;
                     obj.entities[zi].xp = obj.entities[zi].newxp;
                     obj.entities[zi].yp = obj.entities[zi].newyp;
                  }
               }
               ++obj.restartcounter;
               if(obj.restartcounter == 30)
               {
                  obj.restartcounter = 0;
                  obj.restartmode = 0;
               }
            }
            else if(obj.restartmode == 0)
            {
               game.screenshake = 0;
               if(obj.restartcounter == 0)
               {
                  if(obj.norestartsound == false)
                  {
                     music.playef(6,200);
                  }
                  obj.norestartsound = false;
               }
               ++obj.restartcounter;
               if(obj.restartcounter == 10)
               {
                  obj.restartmode = 1;
               }
            }
            else if(obj.restartmode == 1)
            {
               ++obj.restartcounter;
               if(obj.restartcounter == 12)
               {
                  obj.restartmode = 2;
                  obj.restartcounter = 10;
                  if(game.startspecial)
                  {
                     help.globaltemp = obj.getplayer();
                     help.globaltemp2 = obj.entities[help.globaltemp].dir;
                     game.gotoroom(game.startroom,obj,help,music);
                     obj.createentity(game.startx,game.starty,0);
                     if(game.eurydicemode)
                     {
                        obj.createentity(game.entx + 18,game.enty,28);
                     }
                     help.globaltemp = obj.getplayer();
                     obj.entities[help.globaltemp].dir = help.globaltemp2;
                  }
                  else
                  {
                     game.gotoroom(game.currentroom,obj,help,music);
                     obj.createentity(game.entx,game.enty,0);
                     if(game.eurydicemode)
                     {
                        obj.createentity(game.entx + 18,game.enty,28);
                     }
                     help.globaltemp = obj.getplayer();
                     obj.entities[help.globaltemp].vx = game.entvx;
                     obj.entities[help.globaltemp].vy = game.entvy;
                     obj.entities[help.globaltemp].dir = game.entdir;
                  }
               }
            }
            else if(obj.restartmode == 2)
            {
               --obj.restartcounter;
               if(obj.restartcounter == 0)
               {
                  obj.restartmode = 0;
                  obj.restartroom = false;
                  game.shotdelay = 10;
               }
            }
         }
         else
         {
            game.updaterain(obj);
            game.updatestate(obj,help,music);
            obj.onladder = false;
            if(obj.checkladder(game))
            {
               obj.onladder = true;
            }
            for(i = 0; i < obj.nentity; i++)
            {
               obj.entities[i].vx += obj.entities[i].ax;
               obj.entities[i].vy += obj.entities[i].ay;
               obj.entities[i].ax = 0;
               if(obj.entities[i].jumping)
               {
                  if(obj.entities[i].ay < 0)
                  {
                     ++obj.entities[i].ay;
                  }
                  if(obj.entities[i].ay > -1)
                  {
                     obj.entities[i].ay = 0;
                  }
                  --obj.entities[i].jumpframe;
                  if(obj.entities[i].jumpframe <= 0)
                  {
                     obj.entities[i].jumping = false;
                  }
               }
               else if(obj.onladder)
               {
                  if(obj.entities[i].type == 0)
                  {
                     obj.entities[i].vy /= 2;
                     obj.entities[i].bigfallcounter = 0;
                     obj.entities[i].onground = true;
                     obj.entities[i].ay = 0;
                     obj.entities[i].jumpframe = 0;
                     obj.entities[i].jumping = false;
                  }
                  else if(obj.entities[i].gravity)
                  {
                     obj.entities[i].ay = 1;
                  }
               }
               else if(obj.entities[i].gravity)
               {
                  obj.entities[i].ay = 1;
               }
               if(obj.entities[i].gravity)
               {
                  obj.applyfriction(i,0.15,0.5);
               }
               obj.entities[i].newxp = obj.entities[i].xp + obj.entities[i].vx;
               obj.entities[i].newyp = obj.entities[i].yp + obj.entities[i].vy;
               if(obj.entities[i].type == 0 && game.currentroom == 0)
               {
                  if(obj.entities[i].newxp < 30)
                  {
                     obj.entities[i].newxp = 30;
                     obj.entities[i].vx = 0;
                  }
               }
               if(obj.entities[i].type != 28)
               {
                  if(obj.testwallsx(game,i,obj.entities[i].newxp,obj.entities[i].yp))
                  {
                     obj.entities[i].xp = obj.entities[i].newxp;
                  }
                  else
                  {
                     if(obj.entities[i].onwall > 0)
                     {
                        obj.entities[i].state = obj.entities[i].onwall;
                     }
                     if(obj.entities[i].onxwall > 0)
                     {
                        obj.entities[i].state = obj.entities[i].onxwall;
                     }
                  }
                  if(obj.testwallsy(game,i,obj.entities[i].xp,obj.entities[i].newyp))
                  {
                     obj.entities[i].yp = obj.entities[i].newyp;
                  }
                  else
                  {
                     if(obj.entities[i].onwall > 0)
                     {
                        obj.entities[i].state = obj.entities[i].onwall;
                     }
                     if(obj.entities[i].onywall > 0)
                     {
                        obj.entities[i].state = obj.entities[i].onywall;
                     }
                     obj.entities[i].jumpframe = 0;
                  }
                  if(!obj.testwallsx(game,i,obj.entities[i].xp,obj.entities[i].yp))
                  {
                     if(obj.entities[i].type != 1 && obj.entities[i].type != 23 && obj.entities[i].type != 24 && obj.entities[i].type != 25 && obj.entities[i].type != 2 && obj.entities[i].type != 16 && obj.entities[i].type != 15 && obj.entities[i].type != 22 && obj.entities[i].type != 17 && obj.entities[i].type != 14 && obj.entities[i].type != 14)
                     {
                        if(game.toggledeath)
                        {
                           obj.restartroom = true;
                           obj.restartmode = 0;
                           obj.restartcounter = 0;
                        }
                        else
                        {
                           obj.entities[i].yp -= 3;
                        }
                     }
                  }
                  obj.animateentities(i,help,game);
                  for(j = i + 1; j < obj.nentity; j++)
                  {
                     if(i != j)
                     {
                        if(obj.entities[i].onentity)
                        {
                           if(obj.entitycollide(i,j))
                           {
                              if(obj.entities[i].type == 1 && obj.entities[i].state == 0)
                              {
                                 if(obj.entities[j].onbullet > 0)
                                 {
                                    if(obj.entities[j].type == 27)
                                    {
                                       if(obj.entities[i].yp < 52)
                                       {
                                          obj.entities[j].state = obj.entities[j].onbullet;
                                       }
                                       else
                                       {
                                          music.playef(22);
                                       }
                                       obj.entities[j].bulletvel = obj.entities[i].vx;
                                       obj.entities[i].state = 1;
                                    }
                                    else
                                    {
                                       obj.entities[j].state = obj.entities[j].onbullet;
                                       obj.entities[j].bulletvel = obj.entities[i].vx;
                                       obj.entities[i].state = 1;
                                    }
                                 }
                                 else
                                 {
                                    obj.entities[i].state = 1;
                                 }
                              }
                              if(obj.entities[j].type == 1 && obj.entities[j].state == 0)
                              {
                                 if(obj.entities[i].onbullet > 0)
                                 {
                                    if(obj.entities[i].type == 27)
                                    {
                                       if(obj.entities[j].yp < 52)
                                       {
                                          obj.entities[i].state = obj.entities[i].onbullet;
                                       }
                                       obj.entities[i].bulletvel = obj.entities[j].vx;
                                       obj.entities[j].state = 1;
                                    }
                                    else
                                    {
                                       obj.entities[i].state = obj.entities[i].onbullet;
                                       obj.entities[i].bulletvel = obj.entities[j].vx;
                                       obj.entities[j].state = 1;
                                    }
                                 }
                                 else
                                 {
                                    obj.entities[j].state = 1;
                                 }
                              }
                           }
                        }
                        if(obj.entities[i].type == 0 || obj.entities[j].type == 0)
                        {
                           if(Boolean(obj.entities[j].harmful) || Boolean(obj.entities[i].harmful))
                           {
                              if(obj.entitycollide(i,j))
                              {
                                 if(obj.entities[i].size == 0 && obj.entities[j].size == 0)
                                 {
                                    if(dwgfx.tiles[obj.entities[i].drawframe].hitTest(new Point(obj.entities[i].xp,obj.entities[i].yp),1,dwgfx.tiles[obj.entities[j].drawframe],new Point(obj.entities[j].xp,obj.entities[j].yp),1) == true)
                                    {
                                       obj.restartroom = true;
                                       obj.restartmode = 0;
                                       obj.restartcounter = 0;
                                    }
                                 }
                                 else
                                 {
                                    obj.restartroom = true;
                                    obj.restartmode = 0;
                                    obj.restartcounter = 0;
                                 }
                              }
                           }
                           if(obj.entities[j].onplayer > 0 || obj.entities[i].onplayer > 0)
                           {
                              if(obj.entitycollide(i,j))
                              {
                                 if(obj.entities[i].onplayer > 0)
                                 {
                                    obj.entities[i].state = obj.entities[i].onplayer;
                                 }
                                 if(obj.entities[j].onplayer > 0)
                                 {
                                    obj.entities[j].state = obj.entities[j].onplayer;
                                 }
                              }
                           }
                        }
                     }
                  }
               }
               else
               {
                  obj.entities[i].xp = obj.entities[i].newxp;
                  obj.entities[i].yp = obj.entities[i].newyp;
               }
               if(obj.entitycollidefloor(game,i))
               {
                  obj.entities[i].bigfallcounter = 0;
                  obj.entities[i].onground = true;
                  if(obj.entities[i].bigfallframe == -1)
                  {
                     obj.entities[i].bigfallframe = 3;
                     if(obj.entities[i].type == 0)
                     {
                        music.playef(music.steptype);
                     }
                  }
                  if(game.ongroundlasttime && obj.entities[i].type == 0)
                  {
                     game.ongroundlasttime = false;
                     music.playef(music.steptype);
                  }
               }
               else if(!obj.onladder)
               {
                  if(obj.entities[i].type == 0)
                  {
                     game.ongroundlasttime = true;
                  }
                  obj.entities[i].onground = false;
                  ++obj.entities[i].bigfallcounter;
                  if(obj.entities[i].bigfallcounter > 25)
                  {
                     obj.entities[i].bigfallframe = -1;
                  }
               }
            }
            obj.activetrigger = -1;
            if(obj.checktrigger(game))
            {
               game.state = obj.activetrigger;
            }
            if(!obj.restartroom)
            {
               for(qwei = 0; qwei < obj.nentity; qwei++)
               {
                  if(!obj.updateentities(qwei,help,game,music))
                  {
                     qwei--;
                  }
               }
               help.globaltemp = obj.getplayer();
               if(obj.entities[help.globaltemp].xp < -7 && game.door_left >= -1)
               {
                  if(game.door_left == -1)
                  {
                     if(!obj.restartroom)
                     {
                        obj.restartroom = true;
                        obj.restartmode = 0;
                        obj.restartcounter = 0;
                     }
                  }
                  else
                  {
                     game.enty = obj.entities[help.globaltemp].yp;
                     game.entdir = obj.entities[help.globaltemp].dir;
                     game.entvx = obj.entities[help.globaltemp].vx;
                     game.entvy = obj.entities[help.globaltemp].vy;
                     help.globaltemp2 = obj.entities[help.globaltemp].bigfallcounter;
                     game.gotoroom(game.door_left,obj,help,music);
                     game.entx = 152;
                     obj.createentity(game.entx,game.enty,0);
                     if(game.eurydicemode)
                     {
                        obj.createentity(game.entx + 18,game.enty,28);
                     }
                     help.globaltemp = obj.getplayer();
                     obj.entities[help.globaltemp].dir = game.entdir;
                     obj.entities[help.globaltemp].bigfallcounter = help.globaltemp2;
                     obj.restartroom = false;
                  }
               }
               else if(obj.entities[help.globaltemp].xp > 153 && game.door_right >= -1)
               {
                  if(game.door_right == -1)
                  {
                     if(!obj.restartroom)
                     {
                        obj.restartroom = true;
                        obj.restartmode = 0;
                        obj.restartcounter = 0;
                     }
                  }
                  else
                  {
                     game.enty = obj.entities[help.globaltemp].yp;
                     game.entdir = obj.entities[help.globaltemp].dir;
                     game.entvx = obj.entities[help.globaltemp].vx;
                     game.entvy = obj.entities[help.globaltemp].vy;
                     help.globaltemp2 = obj.entities[help.globaltemp].bigfallcounter;
                     game.gotoroom(game.door_right,obj,help,music);
                     game.entx = -6;
                     obj.createentity(game.entx,game.enty,0);
                     if(game.eurydicemode)
                     {
                        obj.createentity(game.entx + 18,game.enty,28);
                     }
                     help.globaltemp = obj.getplayer();
                     obj.entities[help.globaltemp].dir = game.entdir;
                     obj.entities[help.globaltemp].bigfallcounter = help.globaltemp2;
                     obj.restartroom = false;
                  }
               }
               else if(obj.entities[help.globaltemp].yp < -4 && game.door_up >= -1)
               {
                  if(game.door_up == -1)
                  {
                     if(!obj.restartroom)
                     {
                        obj.restartroom = true;
                        obj.restartmode = 0;
                        obj.restartcounter = 0;
                     }
                  }
                  else
                  {
                     game.entx = obj.entities[help.globaltemp].xp;
                     game.entdir = obj.entities[help.globaltemp].dir;
                     game.entvx = obj.entities[help.globaltemp].vx;
                     game.entvy = obj.entities[help.globaltemp].vy;
                     help.globaltemp2 = obj.entities[help.globaltemp].bigfallcounter;
                     game.gotoroom(game.door_up,obj,help,music);
                     game.enty = 137;
                     obj.createentity(game.entx,game.enty,0);
                     if(game.eurydicemode)
                     {
                        obj.createentity(game.entx + 18,game.enty,28);
                     }
                     help.globaltemp = obj.getplayer();
                     obj.entities[help.globaltemp].vy = game.entvy;
                     obj.entities[help.globaltemp].dir = game.entdir;
                     obj.entities[help.globaltemp].bigfallcounter = help.globaltemp2;
                     obj.restartroom = false;
                  }
               }
               else if(obj.entities[help.globaltemp].yp > 138 && game.door_down >= -1)
               {
                  if(game.door_down == -1)
                  {
                     if(!obj.restartroom)
                     {
                        obj.restartroom = true;
                        obj.restartmode = 0;
                        obj.restartcounter = 0;
                     }
                  }
                  else
                  {
                     game.entx = obj.entities[help.globaltemp].xp;
                     game.entdir = obj.entities[help.globaltemp].dir;
                     game.entvx = obj.entities[help.globaltemp].vx;
                     game.entvy = obj.entities[help.globaltemp].vy;
                     help.globaltemp2 = obj.entities[help.globaltemp].bigfallcounter;
                     game.gotoroom(game.door_down,obj,help,music);
                     game.enty = -3;
                     obj.createentity(game.entx,game.enty,0);
                     if(game.eurydicemode)
                     {
                        obj.createentity(game.entx + 18,game.enty,28);
                     }
                     help.globaltemp = obj.getplayer();
                     obj.entities[help.globaltemp].vy = game.entvy;
                     obj.entities[help.globaltemp].dir = game.entdir;
                     obj.entities[help.globaltemp].bigfallcounter = help.globaltemp2;
                     obj.restartroom = false;
                  }
               }
            }
         }
      }
      
      public function lockedloop(e:Event) : void
      {
         dwgfx.backbuffer.lock();
         dwgfx.bprint(5,57,"Sorry! This version of",255,177,181,true);
         dwgfx.bprint(5,67,"the game cannot be",255,177,181,true);
         dwgfx.bprint(5,77,"played online!",255,177,181,true);
         dwgfx.render();
         dwgfx.backbuffer.unlock();
         help.updateglow();
      }
      
      public function sitelock() : Boolean
      {
         var currUrl:String = stage.loaderInfo.url.toLowerCase();
         if(currUrl.indexOf("ile:///") <= 0 || currUrl.indexOf("http") == 0)
         {
            return false;
         }
         return true;
      }
      
      public function gameinput(key:KeyPoll, dwgfx:dwgraphicsclass, game:gameclass, obj:entityclass, help:helpclass, music:musicclass) : void
      {
         var vci:Number = NaN;
         var distractionware_link:URLRequest = null;
         var offline_link:URLRequest = null;
         var site_link:URLRequest = null;
         var mysite_link:URLRequest = null;
         var t:int = 0;
         game.mx = mouseX / 4;
         game.my = mouseY / 4;
         if(game.showmenu > 0)
         {
            game.newgamehighlighted = false;
            game.offlinehighlighted = false;
            game.visithighlighted = false;
            game.restorehighlighted = false;
            if(game.standaloneversion)
            {
               if(game.savepoint > 0)
               {
                  if(game.my >= 31 && game.my <= 37)
                  {
                     game.newgamehighlighted = true;
                  }
                  if(game.my >= 41 && game.my <= 47)
                  {
                     game.restorehighlighted = true;
                  }
                  if(game.my >= 51 && game.my <= 57)
                  {
                     game.visithighlighted = true;
                  }
               }
               else
               {
                  if(game.my >= 36 && game.my <= 42)
                  {
                     game.newgamehighlighted = true;
                  }
                  if(game.my >= 46 && game.my <= 52)
                  {
                     game.visithighlighted = true;
                  }
               }
            }
            else if(game.savepoint > 0)
            {
               if(game.my >= 27 && game.my <= 33)
               {
                  game.newgamehighlighted = true;
               }
               if(game.my >= 37 && game.my <= 42)
               {
                  game.restorehighlighted = true;
               }
               if(game.my >= 45 && game.my <= 51)
               {
                  game.offlinehighlighted = true;
               }
               if(game.my >= 54 && game.my <= 60)
               {
                  game.visithighlighted = true;
               }
            }
            else
            {
               if(game.my >= 31 && game.my <= 37)
               {
                  game.newgamehighlighted = true;
               }
               if(game.my >= 41 && game.my <= 47)
               {
                  game.offlinehighlighted = true;
               }
               if(game.my >= 51 && game.my <= 57)
               {
                  game.visithighlighted = true;
               }
            }
            if(key.click)
            {
               if(game.newgamehighlighted)
               {
                  for(vci = 0; vci < 300; obj.flags[vci] = 0,vci++)
                  {
                  }
                  game.toggledeath = false;
                  game.flashlight = 0;
                  game.screenshake = 0;
                  game.eurydicemode = false;
                  game.rain = true;
                  game.hasgun = false;
                  game.createtrigger(130,0,10,150,8);
                  game.offlinehighlighted = false;
                  game.visithighlighted = false;
                  game.restorehighlighted = false;
                  game.state = 24;
                  game.showmenu = 0;
               }
               if(game.restorehighlighted)
               {
                  game.offlinehighlighted = false;
                  game.visithighlighted = false;
                  game.newgamehighlighted = false;
                  game.state = 33;
                  game.showmenu = 0;
               }
               if(game.visithighlighted)
               {
                  distractionware_link = new URLRequest("http://www.distractionware.com");
                  navigateToURL(distractionware_link,"_blank");
               }
               if(game.offlinehighlighted)
               {
                  offline_link = new URLRequest("http://www.distractionware.com/games/flash/dontlookback/offline/");
                  navigateToURL(offline_link,"_blank");
               }
               if(game.showmenu > 0)
               {
                  if(game.my >= 134 && game.my <= 142)
                  {
                     if(game.kongversion)
                     {
                        site_link = new URLRequest("http://www.kongregate.com/?gamereferral=dontlookback");
                        navigateToURL(site_link,"_blank");
                     }
                     else
                     {
                        mysite_link = new URLRequest("http://www.distractionware.com");
                        navigateToURL(mysite_link,"_blank");
                     }
                  }
               }
            }
         }
         for(var i:int = 0; i < obj.nentity; i++)
         {
            if(obj.entities[i].type == 0)
            {
               if(obj.entities[i].bigfallframe <= 0)
               {
                  if(game.hascontrol)
                  {
                     if(key.isDown(Keyboard.LEFT) || key.isDown(65))
                     {
                        music.playstep(music.steptype);
                        obj.entities[i].vx = -2;
                        obj.entities[i].dir = 0;
                     }
                     else if(key.isDown(Keyboard.RIGHT) || key.isDown(68))
                     {
                        if(game.eurydicemode && !obj.restartroom)
                        {
                           if(obj.entities[i].onground)
                           {
                              music.playstep(music.steptype);
                           }
                           obj.restartroom = true;
                           obj.restartmode = -1;
                           obj.restartcounter = 0;
                           obj.entities[i].dir = 1;
                           obj.entities[obj.geteurydice()].state = 1;
                           obj.animateentities(i,help,game);
                        }
                        else
                        {
                           if(obj.entities[i].onground)
                           {
                              music.playstep(music.steptype);
                           }
                           obj.entities[i].vx = 2;
                           obj.entities[i].dir = 1;
                        }
                     }
                     else
                     {
                        obj.entities[i].vx = 0;
                        music.stopstep();
                     }
                     if(!obj.entities[i].onground)
                     {
                        music.stopstep();
                     }
                     if(obj.restartroom)
                     {
                        music.stopstep();
                     }
                     if(obj.onladder)
                     {
                        game.jumpheld = false;
                        if(key.isDown(Keyboard.UP) || key.isDown(90) || key.isDown(87))
                        {
                           if(Boolean(obj.entities[i].onground) && !obj.entities[i].jumping)
                           {
                              obj.entities[i].ay = -2;
                              obj.entities[i].jumping = true;
                              obj.entities[i].jumpframe = 2;
                           }
                        }
                        else if(key.isDown(Keyboard.DOWN) || key.isDown(83))
                        {
                           obj.entities[i].vy = 4;
                        }
                     }
                     else
                     {
                        if(key.isUp(Keyboard.UP) && key.isUp(90) && key.isUp(87))
                        {
                           game.jumpheld = false;
                        }
                        if((key.isDown(Keyboard.UP) || key.isDown(90) || key.isDown(87)) && !game.jumpheld)
                        {
                           game.jumpheld = true;
                           if(Boolean(obj.entities[i].onground) && !obj.entities[i].jumping)
                           {
                              obj.entities[i].ay = -5;
                              obj.entities[i].jumping = true;
                              obj.entities[i].jumpframe = 10;
                           }
                        }
                     }
                     if(key.isDown(Keyboard.SPACE) || key.isDown(88))
                     {
                        game.isshooting = true;
                     }
                     else
                     {
                        game.isshooting = false;
                     }
                     if(game.hasgun && !obj.restartroom)
                     {
                        --game.shotdelay;
                        if(game.shotdelay <= 0)
                        {
                           game.shotdelay = 0;
                        }
                        if((key.isDown(Keyboard.SPACE) || key.isDown(88)) && game.shotdelay <= 0)
                        {
                           music.playef(4);
                           game.shotdelay = 12;
                           t = obj.getplayer();
                           if(t > -1)
                           {
                              if(obj.entities[t].dir == 0)
                              {
                                 obj.createentity(obj.entities[t].xp + 6,obj.entities[t].yp + 6,1,-7 + obj.entities[t].vx,0);
                              }
                              if(obj.entities[t].dir == 1)
                              {
                                 obj.createentity(obj.entities[t].xp + 4,obj.entities[t].yp + 6,1,7 + obj.entities[t].vx,0);
                              }
                           }
                        }
                     }
                  }
                  else
                  {
                     obj.entities[i].vx = 0;
                  }
               }
               else
               {
                  obj.entities[i].vx /= 2;
               }
            }
         }
      }
      
      public function visit_distractionware(e:Event) : void
      {
         var distractionware_link:URLRequest = new URLRequest("http://www.distractionware.com");
         navigateToURL(distractionware_link,"_blank");
      }
      
      public function getsite() : String
      {
         return stage.loaderInfo.url.toLowerCase();
      }
      
      public function mainloop(e:Event) : void
      {
         if(game.paused || !game.infocus)
         {
            if(game.globalsound > 0)
            {
               game.globalsound = 0;
               SoundMixer.soundTransform = new SoundTransform(0);
            }
            dwgfx.backbuffer.lock();
            dwgfx.backbuffer.fillRect(new Rectangle(0,0,160,144),1114884);
            dwgfx.bprint(5,60,"[Game paused]",253,196,195,true);
            dwgfx.bprint(5,70,"Click to resume",253,196,195,true);
            dwgfx.bprint(5,134,"[Press M to Mute in game]",253,196,195,true);
            dwgfx.render();
            dwgfx.backbuffer.unlock();
            music.processmusic();
            music.processamb();
            music.processstep();
         }
         else
         {
            gamerender(key,dwgfx,game,obj,help);
            gameinput(key,dwgfx,game,obj,help,music);
            gamelogic(key,dwgfx,game,obj,help,music);
            if(key.isDown(77) && game.mutebutton <= 0)
            {
               game.mutebutton = 8;
               if(game.muted)
               {
                  game.muted = false;
               }
               else
               {
                  game.muted = true;
               }
            }
            if(game.mutebutton > 0)
            {
               --game.mutebutton;
            }
            if(game.muted)
            {
               if(game.globalsound == 1)
               {
                  game.globalsound = 0;
                  SoundMixer.soundTransform = new SoundTransform(0);
               }
            }
            if(!game.muted && game.globalsound == 0)
            {
               game.globalsound = 1;
               SoundMixer.soundTransform = new SoundTransform(1);
            }
         }
         if(key.hasclicked)
         {
            key.click = false;
         }
      }
   }
}

