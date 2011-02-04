package com.brisk.view.mediators
{
	import flash.utils.Dictionary;
	
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.Mediator;
	
	public class SignalMediator extends Mediator
	{
		//----------------------------------------------------------------
		// CLASS MEMBERS
		private var _signals					:Dictionary;
		
		//----------------------------------------------------------------
				
		public function SignalMediator()
		{
			super();
			
			_signals = new Dictionary;
		}
		
		public function addSignal(signal:ISignal, listener:Function):void
		{
			signal.add(listener);
			_signals[signal] = listener;
		}
		
		override public function onRemove():void
		{
			this.destroy();
			super.onRemove();
		}
		
		public function destroy():void
		{
			for (var s:Object in _signals)
			{
				var signal:ISignal = ISignal(s);
				signal.remove(_signals[signal]);
				delete _signals[signal];
			}
			_signals = null;
		}
	}
}