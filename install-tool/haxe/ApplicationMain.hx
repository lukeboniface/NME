class ApplicationMain
{
   public static function main()
   {
      nme.Lib.create(
           function(){ ::APP_MAIN::.main(); },
           ::WIN_WIDTH::, ::WIN_HEIGHT::,
           ::WIN_FPS::,
           ::WIN_BACKGROUND::,
             ( ::WIN_HARDWARE::   ? nme.Lib.HARDWARE  : 0) |
             ( ::WIN_RESIZEABLE:: ? nme.Lib.RESIZABLE : 0),
          "::APP_TITLE::",
          "::APP_ICON::"
          );
   }

   public static function getAsset(inName:String):Dynamic
   {
      ::foreach assets::
      if (inName=="::id::")
      {
         ::if (type=="image")::
            return nme.display.BitmapData.load(inName);
         ::elseif (type=="sound")::
            return new nme.media.Sound(new nme.net.URLRequest(inName),null,false);
         ::elseif (type=="music")::
            return new nme.media.Sound(new nme.net.URLRequest(inName),null,true);
         ::else::
            return new nme.utils.ByteArray.load(inName);
         ::end::
      }
      ::end::
      return null;
   }
}

