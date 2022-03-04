require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./editable"

module Gtk
  # The `GtkText` widget is a single-line text entry widget.
  #
  # `GtkText` is the common implementation of single-line text editing
  # that is shared between `GtkEntry`, `GtkPasswordEntry`, `GtkSpinButton`
  # and other widgets. In all of these, `GtkText` is used as the delegate
  # for the [iface@Gtk.Editable] implementation.
  #
  # A fairly large set of key bindings are supported by default. If the
  # entered text is longer than the allocation of the widget, the widget
  # will scroll so that the cursor position is visible.
  #
  # When using an entry for passwords and other sensitive information,
  # it can be put into “password mode” using [method@Gtk.Text.set_visibility].
  # In this mode, entered text is displayed using a “invisible” character.
  # By default, GTK picks the best invisible character that is available
  # in the current font, but it can be changed with
  # [method@Gtk.Text.set_invisible_char].
  #
  # If you are looking to add icons or progress display in an entry, look
  # at `GtkEntry`. There other alternatives for more specialized use cases,
  # such as `GtkSearchEntry`.
  #
  # If you need multi-line editable text, look at `GtkTextView`.
  #
  # # CSS nodes
  #
  # ```
  # text[.read-only]
  # ├── placeholder
  # ├── undershoot.left
  # ├── undershoot.right
  # ├── [selection]
  # ├── [block-cursor]
  # ╰── [window.popup]
  # ```
  #
  # `GtkText` has a main node with the name text. Depending on the properties
  # of the widget, the .read-only style class may appear.
  #
  # When the entry has a selection, it adds a subnode with the name selection.
  #
  # When the entry is in overwrite mode, it adds a subnode with the name
  # block-cursor that determines how the block cursor is drawn.
  #
  # The CSS node for a context menu is added as a subnode below text as well.
  #
  # The undershoot nodes are used to draw the underflow indication when content
  # is scrolled out of view. These nodes get the .left and .right style classes
  # added depending on where the indication is drawn.
  #
  # When touch is used and touch selection handles are shown, they are using
  # CSS nodes with name cursor-handle. They get the .top or .bottom style class
  # depending on where they are shown in relation to the selection. If there is
  # just a single handle for the text cursor, it gets the style class
  # .insertion-cursor.
  #
  # # Accessibility
  #
  # `GtkText` uses the %GTK_ACCESSIBLE_ROLE_NONE role, which causes it to be
  # skipped for accessibility. This is because `GtkText` is expected to be used
  # as a delegate for a `GtkEditable` implementation that will be represented
  # to accessibility.
  class Text < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Editable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, activates_default : Bool? = nil, attributes : Pango::AttrList? = nil, buffer : Gtk::EntryBuffer? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, cursor_position : Int32? = nil, editable : Bool? = nil, enable_emoji_completion : Bool? = nil, enable_undo : Bool? = nil, extra_menu : Gio::MenuModel? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, im_module : ::String? = nil, input_hints : Gtk::InputHints? = nil, input_purpose : Gtk::InputPurpose? = nil, invisible_char : UInt32? = nil, invisible_char_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, max_length : Int32? = nil, max_width_chars : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, overwrite_mode : Bool? = nil, parent : Gtk::Widget? = nil, placeholder_text : ::String? = nil, propagate_text_width : Bool? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, scroll_offset : Int32? = nil, selection_bound : Int32? = nil, sensitive : Bool? = nil, tabs : Pango::TabArray? = nil, text : ::String? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, truncate_multiline : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visibility : Bool? = nil, visible : Bool? = nil, width_chars : Int32? = nil, width_request : Int32? = nil, xalign : Float32? = nil)
      _names = uninitialized Pointer(LibC::Char)[61]
      _values = StaticArray(LibGObject::Value, 61).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if activates_default
        (_names.to_unsafe + _n).value = "activates-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, activates_default)
        _n += 1
      end
      if attributes
        (_names.to_unsafe + _n).value = "attributes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, attributes)
        _n += 1
      end
      if buffer
        (_names.to_unsafe + _n).value = "buffer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, buffer)
        _n += 1
      end
      if can_focus
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if can_target
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if css_classes
        (_names.to_unsafe + _n).value = "css-classes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_classes)
        _n += 1
      end
      if css_name
        (_names.to_unsafe + _n).value = "css-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_name)
        _n += 1
      end
      if cursor
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if cursor_position
        (_names.to_unsafe + _n).value = "cursor-position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor_position)
        _n += 1
      end
      if editable
        (_names.to_unsafe + _n).value = "editable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editable)
        _n += 1
      end
      if enable_emoji_completion
        (_names.to_unsafe + _n).value = "enable-emoji-completion".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_emoji_completion)
        _n += 1
      end
      if enable_undo
        (_names.to_unsafe + _n).value = "enable-undo".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_undo)
        _n += 1
      end
      if extra_menu
        (_names.to_unsafe + _n).value = "extra-menu".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, extra_menu)
        _n += 1
      end
      if focus_on_click
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if focusable
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if halign
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if has_default
        (_names.to_unsafe + _n).value = "has-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_default)
        _n += 1
      end
      if has_focus
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if has_tooltip
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if height_request
        (_names.to_unsafe + _n).value = "height-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_request)
        _n += 1
      end
      if hexpand
        (_names.to_unsafe + _n).value = "hexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand)
        _n += 1
      end
      if hexpand_set
        (_names.to_unsafe + _n).value = "hexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand_set)
        _n += 1
      end
      if im_module
        (_names.to_unsafe + _n).value = "im-module".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, im_module)
        _n += 1
      end
      if input_hints
        (_names.to_unsafe + _n).value = "input-hints".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_hints)
        _n += 1
      end
      if input_purpose
        (_names.to_unsafe + _n).value = "input-purpose".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_purpose)
        _n += 1
      end
      if invisible_char
        (_names.to_unsafe + _n).value = "invisible-char".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, invisible_char)
        _n += 1
      end
      if invisible_char_set
        (_names.to_unsafe + _n).value = "invisible-char-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, invisible_char_set)
        _n += 1
      end
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if margin_bottom
        (_names.to_unsafe + _n).value = "margin-bottom".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_bottom)
        _n += 1
      end
      if margin_end
        (_names.to_unsafe + _n).value = "margin-end".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_end)
        _n += 1
      end
      if margin_start
        (_names.to_unsafe + _n).value = "margin-start".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_start)
        _n += 1
      end
      if margin_top
        (_names.to_unsafe + _n).value = "margin-top".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_top)
        _n += 1
      end
      if max_length
        (_names.to_unsafe + _n).value = "max-length".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_length)
        _n += 1
      end
      if max_width_chars
        (_names.to_unsafe + _n).value = "max-width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_width_chars)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if opacity
        (_names.to_unsafe + _n).value = "opacity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, opacity)
        _n += 1
      end
      if overflow
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if overwrite_mode
        (_names.to_unsafe + _n).value = "overwrite-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overwrite_mode)
        _n += 1
      end
      if parent
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if placeholder_text
        (_names.to_unsafe + _n).value = "placeholder-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, placeholder_text)
        _n += 1
      end
      if propagate_text_width
        (_names.to_unsafe + _n).value = "propagate-text-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagate_text_width)
        _n += 1
      end
      if receives_default
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if root
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if scale_factor
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if scroll_offset
        (_names.to_unsafe + _n).value = "scroll-offset".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scroll_offset)
        _n += 1
      end
      if selection_bound
        (_names.to_unsafe + _n).value = "selection-bound".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selection_bound)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if tabs
        (_names.to_unsafe + _n).value = "tabs".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tabs)
        _n += 1
      end
      if text
        (_names.to_unsafe + _n).value = "text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text)
        _n += 1
      end
      if tooltip_markup
        (_names.to_unsafe + _n).value = "tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_markup)
        _n += 1
      end
      if tooltip_text
        (_names.to_unsafe + _n).value = "tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_text)
        _n += 1
      end
      if truncate_multiline
        (_names.to_unsafe + _n).value = "truncate-multiline".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, truncate_multiline)
        _n += 1
      end
      if valign
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if vexpand
        (_names.to_unsafe + _n).value = "vexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand)
        _n += 1
      end
      if vexpand_set
        (_names.to_unsafe + _n).value = "vexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand_set)
        _n += 1
      end
      if visibility
        (_names.to_unsafe + _n).value = "visibility".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visibility)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if width_chars
        (_names.to_unsafe + _n).value = "width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_chars)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end
      if xalign
        (_names.to_unsafe + _n).value = "xalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xalign)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Text.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_text_get_type
    end

    def activates_default=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "activates-default", unsafe_value, Pointer(Void).null)
      value
    end

    def activates_default? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "activates-default", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def attributes=(value : Pango::AttrList?) : Pango::AttrList?
      unsafe_value = value

      LibGObject.g_object_set(self, "attributes", unsafe_value, Pointer(Void).null)
      value
    end

    def attributes : Pango::AttrList?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "attributes", pointerof(value), Pointer(Void).null)
      Pango::AttrList.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def buffer=(value : Gtk::EntryBuffer?) : Gtk::EntryBuffer?
      unsafe_value = value

      LibGObject.g_object_set(self, "buffer", unsafe_value, Pointer(Void).null)
      value
    end

    def buffer : Gtk::EntryBuffer?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "buffer", pointerof(value), Pointer(Void).null)
      Gtk::EntryBuffer.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def enable_emoji_completion=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "enable-emoji-completion", unsafe_value, Pointer(Void).null)
      value
    end

    def enable_emoji_completion? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enable-emoji-completion", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def extra_menu=(value : Gio::MenuModel?) : Gio::MenuModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "extra-menu", unsafe_value, Pointer(Void).null)
      value
    end

    def extra_menu : Gio::MenuModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "extra-menu", pointerof(value), Pointer(Void).null)
      Gio::MenuModel.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def im_module=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "im-module", unsafe_value, Pointer(Void).null)
      value
    end

    def im_module : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "im-module", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def input_hints=(value : Gtk::InputHints) : Gtk::InputHints
      unsafe_value = value

      LibGObject.g_object_set(self, "input-hints", unsafe_value, Pointer(Void).null)
      value
    end

    def input_hints : Gtk::InputHints
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "input-hints", pointerof(value), Pointer(Void).null)
      Gtk::InputHints.from_value(value)
    end

    def input_purpose=(value : Gtk::InputPurpose) : Gtk::InputPurpose
      unsafe_value = value

      LibGObject.g_object_set(self, "input-purpose", unsafe_value, Pointer(Void).null)
      value
    end

    def input_purpose : Gtk::InputPurpose
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "input-purpose", pointerof(value), Pointer(Void).null)
      Gtk::InputPurpose.from_value(value)
    end

    def invisible_char=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "invisible-char", unsafe_value, Pointer(Void).null)
      value
    end

    def invisible_char : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "invisible-char", pointerof(value), Pointer(Void).null)
      value
    end

    def invisible_char_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "invisible-char-set", unsafe_value, Pointer(Void).null)
      value
    end

    def invisible_char_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "invisible-char-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def max_length=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "max-length", unsafe_value, Pointer(Void).null)
      value
    end

    def max_length : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "max-length", pointerof(value), Pointer(Void).null)
      value
    end

    def overwrite_mode=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "overwrite-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def overwrite_mode? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "overwrite-mode", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def placeholder_text=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "placeholder-text", unsafe_value, Pointer(Void).null)
      value
    end

    def placeholder_text : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "placeholder-text", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def propagate_text_width=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "propagate-text-width", unsafe_value, Pointer(Void).null)
      value
    end

    def propagate_text_width? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "propagate-text-width", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def scroll_offset : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "scroll-offset", pointerof(value), Pointer(Void).null)
      value
    end

    def tabs=(value : Pango::TabArray?) : Pango::TabArray?
      unsafe_value = value

      LibGObject.g_object_set(self, "tabs", unsafe_value, Pointer(Void).null)
      value
    end

    def tabs : Pango::TabArray?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "tabs", pointerof(value), Pointer(Void).null)
      Pango::TabArray.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def truncate_multiline=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "truncate-multiline", unsafe_value, Pointer(Void).null)
      value
    end

    def truncate_multiline? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "truncate-multiline", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def visibility=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "visibility", unsafe_value, Pointer(Void).null)
      value
    end

    def visibility? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "visibility", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def initialize
      # gtk_text_new: (Constructor)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_new

      # Return value handling
      @pointer = _retval
      LibGObject.g_object_ref(_retval)
    end

    def self.new_with_buffer(buffer : Gtk::EntryBuffer) : self
      # gtk_text_new_with_buffer: (Constructor)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_new_with_buffer(buffer)

      # Return value handling
      Gtk::Text.new(_retval, GICrystal::Transfer::Full)
    end

    def compute_cursor_extents(position : UInt64) : Graphene::Rect
      # gtk_text_compute_cursor_extents: (Method)
      # @strong: (out) (caller-allocates) (optional)
      # @weak: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Handle parameters
      strong = Pointer(Void).null
      weak = Pointer(Void).null
      strong = Graphene::Rect.new

      # C call
      LibGtk.gtk_text_compute_cursor_extents(self, position, strong, weak)

      # Return value handling
      strong
    end

    def activates_default : Bool
      # gtk_text_get_activates_default: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_activates_default(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def attributes : Pango::AttrList?
      # gtk_text_get_attributes: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_attributes(self)

      # Return value handling
      Pango::AttrList.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def buffer : Gtk::EntryBuffer
      # gtk_text_get_buffer: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_buffer(self)

      # Return value handling
      Gtk::EntryBuffer.new(_retval, GICrystal::Transfer::None)
    end

    def enable_emoji_completion : Bool
      # gtk_text_get_enable_emoji_completion: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_enable_emoji_completion(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def extra_menu : Gio::MenuModel?
      # gtk_text_get_extra_menu: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_extra_menu(self)

      # Return value handling
      Gio::MenuModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def input_hints : Gtk::InputHints
      # gtk_text_get_input_hints: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_input_hints(self)

      # Return value handling
      Gtk::InputHints.from_value(_retval)
    end

    def input_purpose : Gtk::InputPurpose
      # gtk_text_get_input_purpose: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_input_purpose(self)

      # Return value handling
      Gtk::InputPurpose.from_value(_retval)
    end

    def invisible_char : UInt32
      # gtk_text_get_invisible_char: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_invisible_char(self)

      # Return value handling
      _retval
    end

    def max_length : Int32
      # gtk_text_get_max_length: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_max_length(self)

      # Return value handling
      _retval
    end

    def overwrite_mode : Bool
      # gtk_text_get_overwrite_mode: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_overwrite_mode(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def placeholder_text : ::String?
      # gtk_text_get_placeholder_text: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_placeholder_text(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def propagate_text_width : Bool
      # gtk_text_get_propagate_text_width: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_propagate_text_width(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def tabs : Pango::TabArray?
      # gtk_text_get_tabs: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_tabs(self)

      # Return value handling
      Pango::TabArray.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def text_length : UInt16
      # gtk_text_get_text_length: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_text_length(self)

      # Return value handling
      _retval
    end

    def truncate_multiline : Bool
      # gtk_text_get_truncate_multiline: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_truncate_multiline(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def visibility : Bool
      # gtk_text_get_visibility: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_get_visibility(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def grab_focus_without_selecting : Bool
      # gtk_text_grab_focus_without_selecting: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_grab_focus_without_selecting(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def activates_default=(activates : Bool) : Nil
      # gtk_text_set_activates_default: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_set_activates_default(self, activates)

      # Return value handling
    end

    def attributes=(attrs : Pango::AttrList?) : Nil
      # gtk_text_set_attributes: (Method | Setter)
      # @attrs: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      attrs = if attrs.nil?
                Pointer(Void).null
              else
                attrs.to_unsafe
              end

      # C call
      LibGtk.gtk_text_set_attributes(self, attrs)

      # Return value handling
    end

    def buffer=(buffer : Gtk::EntryBuffer) : Nil
      # gtk_text_set_buffer: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_set_buffer(self, buffer)

      # Return value handling
    end

    def enable_emoji_completion=(enable_emoji_completion : Bool) : Nil
      # gtk_text_set_enable_emoji_completion: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_set_enable_emoji_completion(self, enable_emoji_completion)

      # Return value handling
    end

    def extra_menu=(model : Gio::MenuModel?) : Nil
      # gtk_text_set_extra_menu: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_text_set_extra_menu(self, model)

      # Return value handling
    end

    def input_hints=(hints : Gtk::InputHints) : Nil
      # gtk_text_set_input_hints: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_set_input_hints(self, hints)

      # Return value handling
    end

    def input_purpose=(purpose : Gtk::InputPurpose) : Nil
      # gtk_text_set_input_purpose: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_set_input_purpose(self, purpose)

      # Return value handling
    end

    def invisible_char=(ch : UInt32) : Nil
      # gtk_text_set_invisible_char: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_set_invisible_char(self, ch)

      # Return value handling
    end

    def max_length=(length : Int32) : Nil
      # gtk_text_set_max_length: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_set_max_length(self, length)

      # Return value handling
    end

    def overwrite_mode=(overwrite : Bool) : Nil
      # gtk_text_set_overwrite_mode: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_set_overwrite_mode(self, overwrite)

      # Return value handling
    end

    def placeholder_text=(text : ::String?) : Nil
      # gtk_text_set_placeholder_text: (Method | Setter)
      # @text: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      text = if text.nil?
               Pointer(LibC::Char).null
             else
               text.to_unsafe
             end

      # C call
      LibGtk.gtk_text_set_placeholder_text(self, text)

      # Return value handling
    end

    def propagate_text_width=(propagate_text_width : Bool) : Nil
      # gtk_text_set_propagate_text_width: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_set_propagate_text_width(self, propagate_text_width)

      # Return value handling
    end

    def tabs=(tabs : Pango::TabArray?) : Nil
      # gtk_text_set_tabs: (Method | Setter)
      # @tabs: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      tabs = if tabs.nil?
               Pointer(Void).null
             else
               tabs.to_unsafe
             end

      # C call
      LibGtk.gtk_text_set_tabs(self, tabs)

      # Return value handling
    end

    def truncate_multiline=(truncate_multiline : Bool) : Nil
      # gtk_text_set_truncate_multiline: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_set_truncate_multiline(self, truncate_multiline)

      # Return value handling
    end

    def visibility=(visible : Bool) : Nil
      # gtk_text_set_visibility: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_set_visibility(self, visible)

      # Return value handling
    end

    def unset_invisible_char : Nil
      # gtk_text_unset_invisible_char: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_unset_invisible_char(self)

      # Return value handling
    end

    struct ActivateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate::#{@detail}" : "activate"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Text, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Text, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Text, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Text, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate")
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end

    struct BackspaceSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "backspace::#{@detail}" : "backspace"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Text, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Text, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Text, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Text, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "backspace")
      end
    end

    def backspace_signal
      BackspaceSignal.new(self)
    end

    struct CopyClipboardSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "copy-clipboard::#{@detail}" : "copy-clipboard"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Text, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Text, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Text, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Text, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "copy-clipboard")
      end
    end

    def copy_clipboard_signal
      CopyClipboardSignal.new(self)
    end

    struct CutClipboardSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "cut-clipboard::#{@detail}" : "cut-clipboard"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Text, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Text, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Text, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Text, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "cut-clipboard")
      end
    end

    def cut_clipboard_signal
      CutClipboardSignal.new(self)
    end

    struct DeleteFromCursorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "delete-from-cursor::#{@detail}" : "delete-from-cursor"
      end

      def connect(&block : Proc(Gtk::DeleteType, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::DeleteType, Int32, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::DeleteType, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = Gtk::DeleteType.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::DeleteType, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DeleteType, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = Gtk::DeleteType.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::DeleteType, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Text, Gtk::DeleteType, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DeleteType.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Text, Gtk::DeleteType, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Text, Gtk::DeleteType, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DeleteType.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Text, Gtk::DeleteType, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(type : Gtk::DeleteType, count : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "delete-from-cursor", type, count)
      end
    end

    def delete_from_cursor_signal
      DeleteFromCursorSignal.new(self)
    end

    struct InsertAtCursorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "insert-at-cursor::#{@detail}" : "insert-at-cursor"
      end

      def connect(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Text, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::Text, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Text, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::Text, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(string : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "insert-at-cursor", string)
      end
    end

    def insert_at_cursor_signal
      InsertAtCursorSignal.new(self)
    end

    struct InsertEmojiSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "insert-emoji::#{@detail}" : "insert-emoji"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Text, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Text, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Text, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Text, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "insert-emoji")
      end
    end

    def insert_emoji_signal
      InsertEmojiSignal.new(self)
    end

    struct MoveCursorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "move-cursor::#{@detail}" : "move-cursor"
      end

      def connect(&block : Proc(Gtk::MovementStep, Int32, Bool, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::MovementStep, Int32, Bool, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::MovementStep, Int32, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::MovementStep, Int32, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Text, Gtk::MovementStep, Int32, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Gtk::Text, Gtk::MovementStep, Int32, Bool, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Text, Gtk::MovementStep, Int32, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Gtk::Text, Gtk::MovementStep, Int32, Bool, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(step : Gtk::MovementStep, count : Int32, _extend : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-cursor", step, count, _extend)
      end
    end

    def move_cursor_signal
      MoveCursorSignal.new(self)
    end

    struct PasteClipboardSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "paste-clipboard::#{@detail}" : "paste-clipboard"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Text, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Text, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Text, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Text, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "paste-clipboard")
      end
    end

    def paste_clipboard_signal
      PasteClipboardSignal.new(self)
    end

    struct PreeditChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "preedit-changed::#{@detail}" : "preedit-changed"
      end

      def connect(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Text, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::Text, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Text, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::Text, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(preedit : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "preedit-changed", preedit)
      end
    end

    def preedit_changed_signal
      PreeditChangedSignal.new(self)
    end

    struct ToggleOverwriteSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "toggle-overwrite::#{@detail}" : "toggle-overwrite"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Text, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Text, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Text, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Text.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Text, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "toggle-overwrite")
      end
    end

    def toggle_overwrite_signal
      ToggleOverwriteSignal.new(self)
    end
  end
end
