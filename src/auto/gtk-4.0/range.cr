require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./orientable"

module Gtk
  # `GtkRange` is the common base class for widgets which visualize an
  # adjustment.
  #
  # Widgets that are derived from `GtkRange` include
  # [class@Gtk.Scale] and [class@Gtk.Scrollbar].
  #
  # Apart from signals for monitoring the parameters of the adjustment,
  # `GtkRange` provides properties and methods for setting a
  # “fill level” on range widgets. See [method@Gtk.Range.set_fill_level].
  class Range < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, adjustment : Gtk::Adjustment? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, fill_level : Float64? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, inverted : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, restrict_to_fill_level : Bool? = nil, root : Gtk::Root? = nil, round_digits : Int32? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_fill_level : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[42]
      _values = StaticArray(LibGObject::Value, 42).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if adjustment
        (_names.to_unsafe + _n).value = "adjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, adjustment)
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
      if fill_level
        (_names.to_unsafe + _n).value = "fill-level".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fill_level)
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
      if inverted
        (_names.to_unsafe + _n).value = "inverted".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, inverted)
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
      if orientation
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
        _n += 1
      end
      if overflow
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if parent
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if receives_default
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if restrict_to_fill_level
        (_names.to_unsafe + _n).value = "restrict-to-fill-level".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, restrict_to_fill_level)
        _n += 1
      end
      if root
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if round_digits
        (_names.to_unsafe + _n).value = "round-digits".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, round_digits)
        _n += 1
      end
      if scale_factor
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if show_fill_level
        (_names.to_unsafe + _n).value = "show-fill-level".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_fill_level)
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
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Range.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_range_get_type
    end

    def adjustment=(value : Gtk::Adjustment?) : Gtk::Adjustment?
      unsafe_value = value

      LibGObject.g_object_set(self, "adjustment", unsafe_value, Pointer(Void).null)
      value
    end

    def adjustment : Gtk::Adjustment?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "adjustment", pointerof(value), Pointer(Void).null)
      Gtk::Adjustment.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def fill_level=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "fill-level", unsafe_value, Pointer(Void).null)
      value
    end

    def fill_level : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "fill-level", pointerof(value), Pointer(Void).null)
      value
    end

    def inverted=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "inverted", unsafe_value, Pointer(Void).null)
      value
    end

    def inverted? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "inverted", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def restrict_to_fill_level=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "restrict-to-fill-level", unsafe_value, Pointer(Void).null)
      value
    end

    def restrict_to_fill_level? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "restrict-to-fill-level", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def round_digits=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "round-digits", unsafe_value, Pointer(Void).null)
      value
    end

    def round_digits : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "round-digits", pointerof(value), Pointer(Void).null)
      value
    end

    def show_fill_level=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-fill-level", unsafe_value, Pointer(Void).null)
      value
    end

    def show_fill_level? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-fill-level", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def adjustment : Gtk::Adjustment
      # gtk_range_get_adjustment: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_range_get_adjustment(self)

      # Return value handling
      Gtk::Adjustment.new(_retval, GICrystal::Transfer::None)
    end

    def fill_level : Float64
      # gtk_range_get_fill_level: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_range_get_fill_level(self)

      # Return value handling
      _retval
    end

    def flippable : Bool
      # gtk_range_get_flippable: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_range_get_flippable(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def inverted : Bool
      # gtk_range_get_inverted: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_range_get_inverted(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def range_rect : Gdk::Rectangle
      # gtk_range_get_range_rect: (Method)
      # @range_rect: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      range_rect = Gdk::Rectangle.new

      # C call
      LibGtk.gtk_range_get_range_rect(self, range_rect)

      # Return value handling
      range_rect
    end

    def restrict_to_fill_level : Bool
      # gtk_range_get_restrict_to_fill_level: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_range_get_restrict_to_fill_level(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def round_digits : Int32
      # gtk_range_get_round_digits: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_range_get_round_digits(self)

      # Return value handling
      _retval
    end

    def show_fill_level : Bool
      # gtk_range_get_show_fill_level: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_range_get_show_fill_level(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def slider_range : Nil
      # gtk_range_get_slider_range: (Method)
      # @slider_start: (out) (transfer full) (optional)
      # @slider_end: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      slider_start = Pointer(Int32).null
      slider_end = Pointer(Int32).null

      # C call
      LibGtk.gtk_range_get_slider_range(self, slider_start, slider_end)

      # Return value handling
    end

    def slider_size_fixed : Bool
      # gtk_range_get_slider_size_fixed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_range_get_slider_size_fixed(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def value : Float64
      # gtk_range_get_value: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_range_get_value(self)

      # Return value handling
      _retval
    end

    def adjustment=(adjustment : Gtk::Adjustment) : Nil
      # gtk_range_set_adjustment: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_range_set_adjustment(self, adjustment)

      # Return value handling
    end

    def fill_level=(fill_level : Float64) : Nil
      # gtk_range_set_fill_level: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_range_set_fill_level(self, fill_level)

      # Return value handling
    end

    def flippable=(flippable : Bool) : Nil
      # gtk_range_set_flippable: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_range_set_flippable(self, flippable)

      # Return value handling
    end

    def set_increments(step : Float64, page : Float64) : Nil
      # gtk_range_set_increments: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_range_set_increments(self, step, page)

      # Return value handling
    end

    def inverted=(setting : Bool) : Nil
      # gtk_range_set_inverted: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_range_set_inverted(self, setting)

      # Return value handling
    end

    def set_range(min : Float64, max : Float64) : Nil
      # gtk_range_set_range: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_range_set_range(self, min, max)

      # Return value handling
    end

    def restrict_to_fill_level=(restrict_to_fill_level : Bool) : Nil
      # gtk_range_set_restrict_to_fill_level: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_range_set_restrict_to_fill_level(self, restrict_to_fill_level)

      # Return value handling
    end

    def round_digits=(round_digits : Int32) : Nil
      # gtk_range_set_round_digits: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_range_set_round_digits(self, round_digits)

      # Return value handling
    end

    def show_fill_level=(show_fill_level : Bool) : Nil
      # gtk_range_set_show_fill_level: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_range_set_show_fill_level(self, show_fill_level)

      # Return value handling
    end

    def slider_size_fixed=(size_fixed : Bool) : Nil
      # gtk_range_set_slider_size_fixed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_range_set_slider_size_fixed(self, size_fixed)

      # Return value handling
    end

    def value=(value : Float64) : Nil
      # gtk_range_set_value: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_range_set_value(self, value)

      # Return value handling
    end

    struct AdjustBoundsSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "adjust-bounds::#{@detail}" : "adjust-bounds"
      end

      def connect(&block : Proc(Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Nil))
        connect(block)
      end

      def connect(block : Proc(Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(Float64, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(Float64, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Range, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, box : Pointer(Void)) {
          sender = Gtk::Range.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::Range, Float64, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Range, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, box : Pointer(Void)) {
          sender = Gtk::Range.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::Range, Float64, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(value : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "adjust-bounds", value)
      end
    end

    def adjust_bounds_signal
      AdjustBoundsSignal.new(self)
    end

    struct ChangeValueSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "change-value::#{@detail}" : "change-value"
      end

      def connect(&block : Proc(Gtk::ScrollType, Float64, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::ScrollType, Float64, Bool))
        connect(block)
      end

      def connect(block : Proc(Gtk::ScrollType, Float64, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::ScrollType, Float64, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ScrollType, Float64, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::ScrollType, Float64, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Range, Gtk::ScrollType, Float64, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::Range.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Range, Gtk::ScrollType, Float64, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Range, Gtk::ScrollType, Float64, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::Range.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Range, Gtk::ScrollType, Float64, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(scroll : Gtk::ScrollType, value : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "change-value", scroll, value)
      end
    end

    def change_value_signal
      ChangeValueSignal.new(self)
    end

    struct MoveSliderSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "move-slider::#{@detail}" : "move-slider"
      end

      def connect(&block : Proc(Gtk::ScrollType, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::ScrollType, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::ScrollType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          ::Box(Proc(Gtk::ScrollType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ScrollType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          ::Box(Proc(Gtk::ScrollType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Range, Gtk::ScrollType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Range.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          ::Box(Proc(Gtk::Range, Gtk::ScrollType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Range, Gtk::ScrollType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Range.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          ::Box(Proc(Gtk::Range, Gtk::ScrollType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(step : Gtk::ScrollType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-slider", step)
      end
    end

    def move_slider_signal
      MoveSliderSignal.new(self)
    end

    struct ValueChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "value-changed::#{@detail}" : "value-changed"
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

      def connect(block : Proc(Gtk::Range, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Range.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Range, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Range, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Range.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Range, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "value-changed")
      end
    end

    def value_changed_signal
      ValueChangedSignal.new(self)
    end
  end
end
