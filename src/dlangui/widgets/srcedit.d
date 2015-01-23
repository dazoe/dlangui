// Written in the D programming language.

/**
This module contains implementation of source code editor widget.

SourceEdit - base class for source code editors, with line numbering, syntax highlight, etc.

Synopsis:

----
import dlangui.widgets.srcedit;

----

Copyright: Vadim Lopatin, 2014
License:   Boost License 1.0
Authors:   Vadim Lopatin, coolreader.org@gmail.com
*/
module dlangui.widgets.srcedit;

import dlangui.graphics.fonts;
import dlangui.widgets.editors;
import dlangui.widgets.styles;

class SourceEdit : EditBox {
	this(string ID) {
		super(ID);
		fontFace = "Consolas,Lucida Console,Courier New";
		fontFamily = FontFamily.MonoSpace;
		fontSize = 17;
		layoutWidth(FILL_PARENT).layoutHeight(FILL_PARENT);
        minFontSize(10).maxFontSize(75); // allow font zoom with Ctrl + MouseWheel
        _showLineNumbers = true;
	}
	this() {
		this("SRCEDIT");
	}
    protected string _filename;
    @property string filename() {
        return _filename;
    }
    /// load from file
    bool load(string fn) {
        if (content.load(fn)) {
            _filename = fn;
            requestLayout();
            return true;
        }
        // failed
        _filename = null;
        return false;
    }
}
