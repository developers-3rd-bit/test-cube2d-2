package
{
   import com.halcyon.layout.common.HalcyonHGroup;
   import com.halcyon.layout.common.HalcyonVGroup;
   import com.halcyon.layout.common.LayoutEvent;
   import com.soma.ui.layouts.VBoxUI;
   
   import common.TweenedButton;
   import common.UserPanel;
   
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class View extends Sprite
   {
      public static const WEBCAM_BTN_CLICK:String = "webcamBtnClick";
      public static const CALL_BTN_CLICK:String = "callBtnClick";
      public static const INFO_BTN_CLICK:String = "infoBtnClick";
      public static const HELP_BTN_CLICK:String = "helpBtnClick";
      public static const AWAY_BTN_CLICK:String = "awayBtnClick";
      public static const CUBE_CLICK:String = "cubeClick";
      
      private var _vGroup:HalcyonVGroup;
      private var _userPanel:UserPanel;
      private var _buttonsHGroup:HalcyonHGroup;
      private var _webcamBtn:TweenedButton;
      private var _callBtn:TweenedButton;
      private var _infoBtn:TweenedButton;
      private var _helpBtn:TweenedButton;
      private var _awayBtn:TweenedButton;
      private var _preferredWidth:Number = 24;
      private var _preferredHieght:Number = 24;
      
      private var _inSpotLight:Boolean = false;
      
      public function View(width:Number, height:Number)
      {
         super();
         
         _vGroup = new HalcyonVGroup(this, width, height);
         _vGroup.verticalGap = 5;
         _vGroup.childrenAlign = VBoxUI.ALIGN_TOP_CENTER;
         
         _userPanel = new UserPanel();
         _userPanel.addEventListener(MouseEvent.CLICK, onCubeClick, false, 0, true);
         _vGroup.addChild(_userPanel);
         
         _buttonsHGroup = new HalcyonHGroup(_vGroup, width, 24);
         _buttonsHGroup.paddingLeft = 19;
         _buttonsHGroup.horizontalgap = 15;
         
         _webcamBtn = new TweenedButton(McWebcam, _preferredWidth, _preferredHieght);
         _webcamBtn.addEventListener(MouseEvent.CLICK, onWebcamBtnClick, false, 0, true);
         _buttonsHGroup.addChild(_webcamBtn);
         
         _callBtn = new TweenedButton(McCall, _preferredWidth, _preferredHieght);
         _callBtn.addEventListener(MouseEvent.CLICK, onCallBtnClick, false, 0, true);
         _buttonsHGroup.addChild(_callBtn);
         
         _infoBtn = new TweenedButton(McInfo, _preferredWidth, _preferredHieght);
         _infoBtn.addEventListener(MouseEvent.CLICK, onInfoBtnClick, false, 0, true);
         _buttonsHGroup.addChild(_infoBtn);
         
         _helpBtn = new TweenedButton(McHelp, _preferredWidth, _preferredHieght);
         _helpBtn.addEventListener(MouseEvent.CLICK, onHelpBtnClick, false, 0, true);
         _buttonsHGroup.addChild(_helpBtn);
         
         _awayBtn = new TweenedButton(McAway, _preferredWidth, _preferredHieght);
         _awayBtn.addEventListener(MouseEvent.CLICK, onAwayBtnClick, false, 0, true);
         _buttonsHGroup.addChild(_awayBtn);
         
         _userPanel.height = height - _buttonsHGroup.height - 5;
         _userPanel.width = width - 20;
         
         _vGroup.addChild(_buttonsHGroup);
         this.addChild(_vGroup);
      }
      
      override public function get height():Number
      {
         return _vGroup.height;
      }
      
      public function get inSpotLight():Boolean
      {
         return _inSpotLight;
      }
      
      private function onCubeClick(event:Event):void
      {
         var layoutEvent:LayoutEvent = new LayoutEvent(CUBE_CLICK);
         layoutEvent.extra = this;
         dispatchEvent(layoutEvent);
      }
      
      public function scale():void
      {
         this.scaleX = 1.5;
         this.scaleY = 1.5;
         _inSpotLight = true;
      }
      
      public function unScale():void
      {
         this.scaleX = 1;
         this.scaleY = 1;
         _inSpotLight = false;
      }
      
      public function set userName(value:String):void
      {
         _userPanel.userName = value;
      }
      
      public function set userImage(value:DisplayObject):void
      {
         _userPanel.userImage = value;
      }
      
      private function onWebcamBtnClick(event:Event):void
      {
         dispatchEvent(new Event(WEBCAM_BTN_CLICK));
      }
      
      private function onCallBtnClick(event:Event):void 
      {
         dispatchEvent(new Event(CALL_BTN_CLICK));
      }
      
      private function onInfoBtnClick(event:Event):void 
      {
         dispatchEvent(new Event(INFO_BTN_CLICK));
      }
      
      private function onHelpBtnClick(event:Event):void
      {
         dispatchEvent(new Event(HELP_BTN_CLICK));
      }
      
      private function onAwayBtnClick(event:Event):void 
      {
         dispatchEvent(new Event(AWAY_BTN_CLICK));
      }
   }
}