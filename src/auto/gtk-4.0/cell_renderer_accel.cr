require "./cell_renderer_text"

module Gtk
  # Renders a keyboard accelerator in a cell
  #
  # `GtkCellRendererAccel` displays a keyboard accelerator (i.e. a key
  # combination like `Control + a`). If the cell renderer is editable,
  # the accelerator can be changed by simply typing the new combination.
  class CellRendererAccel < CellRendererText
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accel_key : UInt32? = nil, accel_mode : Gtk::CellRendererAccelMode? = nil, accel_mods : Gdk::ModifierType? = nil, align_set : Bool? = nil, alignment : Pango::Alignment? = nil, attributes : Pango::AttrList? = nil, background : ::String? = nil, background_rgba : Gdk::RGBA? = nil, background_set : Bool? = nil, cell_background : ::String? = nil, cell_background_rgba : Gdk::RGBA? = nil, cell_background_set : Bool? = nil, editable : Bool? = nil, editable_set : Bool? = nil, editing : Bool? = nil, ellipsize : Pango::EllipsizeMode? = nil, ellipsize_set : Bool? = nil, family : ::String? = nil, family_set : Bool? = nil, font : ::String? = nil, font_desc : Pango::FontDescription? = nil, foreground : ::String? = nil, foreground_rgba : Gdk::RGBA? = nil, foreground_set : Bool? = nil, height : Int32? = nil, is_expanded : Bool? = nil, is_expander : Bool? = nil, keycode : UInt32? = nil, language : ::String? = nil, language_set : Bool? = nil, markup : ::String? = nil, max_width_chars : Int32? = nil, mode : Gtk::CellRendererMode? = nil, placeholder_text : ::String? = nil, rise : Int32? = nil, rise_set : Bool? = nil, scale : Float64? = nil, scale_set : Bool? = nil, sensitive : Bool? = nil, single_paragraph_mode : Bool? = nil, size : Int32? = nil, size_points : Float64? = nil, size_set : Bool? = nil, stretch : Pango::Stretch? = nil, stretch_set : Bool? = nil, strikethrough : Bool? = nil, strikethrough_set : Bool? = nil, style : Pango::Style? = nil, style_set : Bool? = nil, text : ::String? = nil, underline : Pango::Underline? = nil, underline_set : Bool? = nil, variant : Pango::Variant? = nil, variant_set : Bool? = nil, visible : Bool? = nil, weight : Int32? = nil, weight_set : Bool? = nil, width : Int32? = nil, width_chars : Int32? = nil, wrap_mode : Pango::WrapMode? = nil, wrap_width : Int32? = nil, xalign : Float32? = nil, xpad : UInt32? = nil, yalign : Float32? = nil, ypad : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[65]
      _values = StaticArray(LibGObject::Value, 65).new(LibGObject::Value.new)
      _n = 0

      if accel_key
        (_names.to_unsafe + _n).value = "accel-key".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accel_key)
        _n += 1
      end
      if accel_mode
        (_names.to_unsafe + _n).value = "accel-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accel_mode)
        _n += 1
      end
      if accel_mods
        (_names.to_unsafe + _n).value = "accel-mods".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accel_mods)
        _n += 1
      end
      if align_set
        (_names.to_unsafe + _n).value = "align-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, align_set)
        _n += 1
      end
      if alignment
        (_names.to_unsafe + _n).value = "alignment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, alignment)
        _n += 1
      end
      if attributes
        (_names.to_unsafe + _n).value = "attributes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, attributes)
        _n += 1
      end
      if background
        (_names.to_unsafe + _n).value = "background".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, background)
        _n += 1
      end
      if background_rgba
        (_names.to_unsafe + _n).value = "background-rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, background_rgba)
        _n += 1
      end
      if background_set
        (_names.to_unsafe + _n).value = "background-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, background_set)
        _n += 1
      end
      if cell_background
        (_names.to_unsafe + _n).value = "cell-background".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_background)
        _n += 1
      end
      if cell_background_rgba
        (_names.to_unsafe + _n).value = "cell-background-rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_background_rgba)
        _n += 1
      end
      if cell_background_set
        (_names.to_unsafe + _n).value = "cell-background-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_background_set)
        _n += 1
      end
      if editable
        (_names.to_unsafe + _n).value = "editable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editable)
        _n += 1
      end
      if editable_set
        (_names.to_unsafe + _n).value = "editable-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editable_set)
        _n += 1
      end
      if editing
        (_names.to_unsafe + _n).value = "editing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editing)
        _n += 1
      end
      if ellipsize
        (_names.to_unsafe + _n).value = "ellipsize".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ellipsize)
        _n += 1
      end
      if ellipsize_set
        (_names.to_unsafe + _n).value = "ellipsize-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ellipsize_set)
        _n += 1
      end
      if family
        (_names.to_unsafe + _n).value = "family".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family)
        _n += 1
      end
      if family_set
        (_names.to_unsafe + _n).value = "family-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family_set)
        _n += 1
      end
      if font
        (_names.to_unsafe + _n).value = "font".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, font)
        _n += 1
      end
      if font_desc
        (_names.to_unsafe + _n).value = "font-desc".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, font_desc)
        _n += 1
      end
      if foreground
        (_names.to_unsafe + _n).value = "foreground".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, foreground)
        _n += 1
      end
      if foreground_rgba
        (_names.to_unsafe + _n).value = "foreground-rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, foreground_rgba)
        _n += 1
      end
      if foreground_set
        (_names.to_unsafe + _n).value = "foreground-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, foreground_set)
        _n += 1
      end
      if height
        (_names.to_unsafe + _n).value = "height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height)
        _n += 1
      end
      if is_expanded
        (_names.to_unsafe + _n).value = "is-expanded".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_expanded)
        _n += 1
      end
      if is_expander
        (_names.to_unsafe + _n).value = "is-expander".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_expander)
        _n += 1
      end
      if keycode
        (_names.to_unsafe + _n).value = "keycode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, keycode)
        _n += 1
      end
      if language
        (_names.to_unsafe + _n).value = "language".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, language)
        _n += 1
      end
      if language_set
        (_names.to_unsafe + _n).value = "language-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, language_set)
        _n += 1
      end
      if markup
        (_names.to_unsafe + _n).value = "markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, markup)
        _n += 1
      end
      if max_width_chars
        (_names.to_unsafe + _n).value = "max-width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_width_chars)
        _n += 1
      end
      if mode
        (_names.to_unsafe + _n).value = "mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mode)
        _n += 1
      end
      if placeholder_text
        (_names.to_unsafe + _n).value = "placeholder-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, placeholder_text)
        _n += 1
      end
      if rise
        (_names.to_unsafe + _n).value = "rise".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rise)
        _n += 1
      end
      if rise_set
        (_names.to_unsafe + _n).value = "rise-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rise_set)
        _n += 1
      end
      if scale
        (_names.to_unsafe + _n).value = "scale".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale)
        _n += 1
      end
      if scale_set
        (_names.to_unsafe + _n).value = "scale-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_set)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if single_paragraph_mode
        (_names.to_unsafe + _n).value = "single-paragraph-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, single_paragraph_mode)
        _n += 1
      end
      if size
        (_names.to_unsafe + _n).value = "size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, size)
        _n += 1
      end
      if size_points
        (_names.to_unsafe + _n).value = "size-points".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, size_points)
        _n += 1
      end
      if size_set
        (_names.to_unsafe + _n).value = "size-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, size_set)
        _n += 1
      end
      if stretch
        (_names.to_unsafe + _n).value = "stretch".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, stretch)
        _n += 1
      end
      if stretch_set
        (_names.to_unsafe + _n).value = "stretch-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, stretch_set)
        _n += 1
      end
      if strikethrough
        (_names.to_unsafe + _n).value = "strikethrough".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, strikethrough)
        _n += 1
      end
      if strikethrough_set
        (_names.to_unsafe + _n).value = "strikethrough-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, strikethrough_set)
        _n += 1
      end
      if style
        (_names.to_unsafe + _n).value = "style".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, style)
        _n += 1
      end
      if style_set
        (_names.to_unsafe + _n).value = "style-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, style_set)
        _n += 1
      end
      if text
        (_names.to_unsafe + _n).value = "text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text)
        _n += 1
      end
      if underline
        (_names.to_unsafe + _n).value = "underline".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, underline)
        _n += 1
      end
      if underline_set
        (_names.to_unsafe + _n).value = "underline-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, underline_set)
        _n += 1
      end
      if variant
        (_names.to_unsafe + _n).value = "variant".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, variant)
        _n += 1
      end
      if variant_set
        (_names.to_unsafe + _n).value = "variant-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, variant_set)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if weight
        (_names.to_unsafe + _n).value = "weight".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, weight)
        _n += 1
      end
      if weight_set
        (_names.to_unsafe + _n).value = "weight-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, weight_set)
        _n += 1
      end
      if width
        (_names.to_unsafe + _n).value = "width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width)
        _n += 1
      end
      if width_chars
        (_names.to_unsafe + _n).value = "width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_chars)
        _n += 1
      end
      if wrap_mode
        (_names.to_unsafe + _n).value = "wrap-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap_mode)
        _n += 1
      end
      if wrap_width
        (_names.to_unsafe + _n).value = "wrap-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap_width)
        _n += 1
      end
      if xalign
        (_names.to_unsafe + _n).value = "xalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xalign)
        _n += 1
      end
      if xpad
        (_names.to_unsafe + _n).value = "xpad".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xpad)
        _n += 1
      end
      if yalign
        (_names.to_unsafe + _n).value = "yalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, yalign)
        _n += 1
      end
      if ypad
        (_names.to_unsafe + _n).value = "ypad".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ypad)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(CellRendererAccel.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_renderer_accel_get_type
    end

    def accel_key=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "accel-key", unsafe_value, Pointer(Void).null)
      value
    end

    def accel_key : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "accel-key", pointerof(value), Pointer(Void).null)
      value
    end

    def accel_mode=(value : Gtk::CellRendererAccelMode) : Gtk::CellRendererAccelMode
      unsafe_value = value

      LibGObject.g_object_set(self, "accel-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def accel_mode : Gtk::CellRendererAccelMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "accel-mode", pointerof(value), Pointer(Void).null)
      Gtk::CellRendererAccelMode.from_value(value)
    end

    def accel_mods=(value : Gdk::ModifierType) : Gdk::ModifierType
      unsafe_value = value

      LibGObject.g_object_set(self, "accel-mods", unsafe_value, Pointer(Void).null)
      value
    end

    def accel_mods : Gdk::ModifierType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "accel-mods", pointerof(value), Pointer(Void).null)
      Gdk::ModifierType.from_value(value)
    end

    def keycode=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "keycode", unsafe_value, Pointer(Void).null)
      value
    end

    def keycode : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "keycode", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize
      # gtk_cell_renderer_accel_new: (Constructor)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_cell_renderer_accel_new

      # Return value handling
      @pointer = _retval
      LibGObject.g_object_ref(_retval)
    end

    struct AccelClearedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "accel-cleared::#{@detail}" : "accel-cleared"
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

      def connect(block : Proc(Gtk::CellRendererAccel, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::CellRendererAccel.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::CellRendererAccel, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CellRendererAccel, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::CellRendererAccel.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::CellRendererAccel, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(path_string : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "accel-cleared", path_string)
      end
    end

    def accel_cleared_signal
      AccelClearedSignal.new(self)
    end

    struct AccelEditedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "accel-edited::#{@detail}" : "accel-edited"
      end

      def connect(&block : Proc(::String, UInt32, Gdk::ModifierType, UInt32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, UInt32, Gdk::ModifierType, UInt32, Nil))
        connect(block)
      end

      def connect(block : Proc(::String, UInt32, Gdk::ModifierType, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : UInt32, lib_arg2 : UInt32, lib_arg3 : UInt32, box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          arg1 = lib_arg1
          arg2 = Gdk::ModifierType.from_value(lib_arg2)
          arg3 = lib_arg3
          ::Box(Proc(::String, UInt32, Gdk::ModifierType, UInt32, Nil)).unbox(box).call(arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, UInt32, Gdk::ModifierType, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : UInt32, lib_arg2 : UInt32, lib_arg3 : UInt32, box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          arg1 = lib_arg1
          arg2 = Gdk::ModifierType.from_value(lib_arg2)
          arg3 = lib_arg3
          ::Box(Proc(::String, UInt32, Gdk::ModifierType, UInt32, Nil)).unbox(box).call(arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::CellRendererAccel, ::String, UInt32, Gdk::ModifierType, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : UInt32, lib_arg2 : UInt32, lib_arg3 : UInt32, box : Pointer(Void)) {
          sender = Gtk::CellRendererAccel.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          arg1 = lib_arg1
          arg2 = Gdk::ModifierType.from_value(lib_arg2)
          arg3 = lib_arg3
          ::Box(Proc(Gtk::CellRendererAccel, ::String, UInt32, Gdk::ModifierType, UInt32, Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CellRendererAccel, ::String, UInt32, Gdk::ModifierType, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : UInt32, lib_arg2 : UInt32, lib_arg3 : UInt32, box : Pointer(Void)) {
          sender = Gtk::CellRendererAccel.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          arg1 = lib_arg1
          arg2 = Gdk::ModifierType.from_value(lib_arg2)
          arg3 = lib_arg3
          ::Box(Proc(Gtk::CellRendererAccel, ::String, UInt32, Gdk::ModifierType, UInt32, Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(path_string : ::String, accel_key : UInt32, accel_mods : Gdk::ModifierType, hardware_keycode : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "accel-edited", path_string, accel_key, accel_mods, hardware_keycode)
      end
    end

    def accel_edited_signal
      AccelEditedSignal.new(self)
    end
  end
end
