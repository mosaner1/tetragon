/* * hexagonlib - Multi-Purpose ActionScript 3 Library. *       __    __ *    __/  \__/  \__    __ *   /  \__/HEXAGON \__/  \ *   \__/  \__/  LIBRARY _/ *            \__/  \__/ * * Licensed under the MIT License *  * Copyright (c) 2007-2008 Sascha Balkau / Hexagon Star Softworks *  * Permission is hereby granted, free of charge, to any person obtaining a copy of * this software and associated documentation files (the "Software"), to deal in * the Software without restriction, including without limitation the rights to * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of * the Software, and to permit persons to whom the Software is furnished to do so, * subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in all * copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. */package tetragon.view.ui.containers{	import tetragon.view.ui.core.InvalidationType;	import tetragon.view.ui.core.UIComponent;	import flash.display.DisplayObject;	[Style(name="normalSkin", type="Class")]			/**	 * Pane Class	 */	public class Pane extends UIComponent	{		////////////////////////////////////////////////////////////////////////////////////////		// Properties                                                                         //		////////////////////////////////////////////////////////////////////////////////////////				protected var _bg:DisplayObject;		protected var _transparency:Number = 1.0;				private static var _defaultStyles:Object =		{			normalSkin:			"PaneNormal"		};						////////////////////////////////////////////////////////////////////////////////////////		// Public Methods                                                                     //		////////////////////////////////////////////////////////////////////////////////////////				/**		 * Creates a new Pane instance.		 */		public function Pane(x:Number = 0, y:Number = 0, width:Number = 0, height:Number = 0)		{			super();						if (x != 0 || y != 0) move(x, y);			if (width > 0) _width = width;			if (height > 0) _height = height;		}						////////////////////////////////////////////////////////////////////////////////////////		// Getters & Setters                                                                  //		////////////////////////////////////////////////////////////////////////////////////////				/**		 * @copy com.hexagonstar.ui.core.UIComponent#getStyleDefinition()		 *		 * @see com.hexagonstar.ui.core.UIComponent#getStyle() UIComponent#getStyle()		 * @see com.hexagonstar.ui.core.UIComponent#setStyle() UIComponent#setStyle()		 * @see com.hexagonstar.ui.managers.StyleManager StyleManager		 */		public static function get styleDefinition():Object		{			return _defaultStyles;		}						/**		 * Gets/sets the alpha transparency of the pane's background.		 */		public function get transparency():Number		{			return _transparency;		}				public function set transparency(v:Number):void		{			if (v == _transparency) return;			if (v > 1) v = 1;			else if (v < 0) v = 0;						_transparency = v;			invalidate(InvalidationType.SIZE);		}				////////////////////////////////////////////////////////////////////////////////////////		// Event Handlers                                                                     //		////////////////////////////////////////////////////////////////////////////////////////						////////////////////////////////////////////////////////////////////////////////////////		// Private Methods                                                                    //		////////////////////////////////////////////////////////////////////////////////////////				/**		 * @private		 */		override protected function configUI():void		{			super.configUI();		}						/**		 * @private		 */		override protected function draw():void		{			if (InvalidationType.STATE)			{				drawBackground();				invalidate(InvalidationType.SIZE, false);			}						if (isInvalid(InvalidationType.SIZE)) drawLayout();			super.draw();		}						/**		 * @private		 */		protected function drawBackground():void		{			var bg:DisplayObject = _bg;			_bg = getDisplayObjectInstance(getStyleValue("normalSkin"));						if (_bg) addChildAt(_bg, 0);			if (bg && bg != _bg && contains(bg)) removeChild(bg);		}						/**		 * @private		 */		protected function drawLayout():void		{			if (_bg)			{				_bg.width = width;				_bg.height = height;				_bg.alpha = _transparency;			}		}	}}