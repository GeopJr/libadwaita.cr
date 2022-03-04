require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./orientable"

module Gtk
  # `GtkLevelBar` is a widget that can be used as a level indicator.
  #
  # Typical use cases are displaying the strength of a password, or
  # showing the charge level of a battery.
  #
  # ![An example GtkLevelBar](levelbar.png)
  #
  # Use [method@Gtk.LevelBar.set_value] to set the current value, and
  # [method@Gtk.LevelBar.add_offset_value] to set the value offsets at which
  # the bar will be considered in a different state. GTK will add a few
  # offsets by default on the level bar: %GTK_LEVEL_BAR_OFFSET_LOW,
  # %GTK_LEVEL_BAR_OFFSET_HIGH and %GTK_LEVEL_BAR_OFFSET_FULL, with
  # values 0.25, 0.75 and 1.0 respectively.
  #
  # Note that it is your responsibility to update preexisting offsets
  # when changing the minimum or maximum value. GTK will simply clamp
  # them to the new range.
  #
  # ## Adding a custom offset on the bar
  #
  # ```c
  # static GtkWidget *
  # create_level_bar (void)
  # {
  #   GtkWidget *widget;
  #   GtkLevelBar *bar;
  #
  #   widget = gtk_level_bar_new ();
  #   bar = GTK_LEVEL_BAR (widget);
  #
  #   // This changes the value of the default low offset
  #
  #   gtk_level_bar_add_offset_value (bar,
  #                                   GTK_LEVEL_BAR_OFFSET_LOW,
  #                                   0.10);
  #
  #   // This adds a new offset to the bar; the application will
  #   // be able to change its color CSS like this:
  #   //
  #   // levelbar block.my-offset {
  #   //   background-color: magenta;
  #   //   border-style: solid;
  #   //   border-color: black;
  #   //   border-style: 1px;
  #   // }
  #
  #   gtk_level_bar_add_offset_value (bar, "my-offset", 0.60);
  #
  #   return widget;
  # }
  # ```
  #
  # The default interval of values is between zero and one, but it’s possible
  # to modify the interval using [method@Gtk.LevelBar.set_min_value] and
  # [method@Gtk.LevelBar.set_max_value]. The value will be always drawn in
  # proportion to the admissible interval, i.e. a value of 15 with a specified
  # interval between 10 and 20 is equivalent to a value of 0.5 with an interval
  # between 0 and 1. When %GTK_LEVEL_BAR_MODE_DISCRETE is used, the bar level
  # is rendered as a finite number of separated blocks instead of a single one.
  # The number of blocks that will be rendered is equal to the number of units
  # specified by the admissible interval.
  #
  # For instance, to build a bar rendered with five blocks, it’s sufficient to
  # set the minimum value to 0 and the maximum value to 5 after changing the
  # indicator mode to discrete.
  #
  # # GtkLevelBar as GtkBuildable
  #
  # The `GtkLevelBar` implementation of the `GtkBuildable` interface supports a
  # custom <offsets> element, which can contain any number of <offset> elements,
  # each of which must have name and value attributes.
  #
  # # CSS nodes
  #
  # ```
  # levelbar[.discrete]
  # ╰── trough
  #     ├── block.filled.level-name
  #     ┊
  #     ├── block.empty
  #     ┊
  # ```
  #
  # `GtkLevelBar` has a main CSS node with name levelbar and one of the style
  # classes .discrete or .continuous and a subnode with name trough. Below the
  # trough node are a number of nodes with name block and style class .filled
  # or .empty. In continuous mode, there is exactly one node of each, in discrete
  # mode, the number of filled and unfilled nodes corresponds to blocks that are
  # drawn. The block.filled nodes also get a style class .level-name corresponding
  # to the level for the current value.
  #
  # In horizontal orientation, the nodes are always arranged from left to right,
  # regardless of text direction.
  #
  # # Accessibility
  #
  # `GtkLevelBar` uses the %GTK_ACCESSIBLE_ROLE_METER role.
  class LevelBar < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, inverted : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, max_value : Float64? = nil, min_value : Float64? = nil, mode : Gtk::LevelBarMode? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, value : Float64? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[41]
      _values = StaticArray(LibGObject::Value, 41).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
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
      if max_value
        (_names.to_unsafe + _n).value = "max-value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_value)
        _n += 1
      end
      if min_value
        (_names.to_unsafe + _n).value = "min-value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, min_value)
        _n += 1
      end
      if mode
        (_names.to_unsafe + _n).value = "mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mode)
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
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
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
      if value
        (_names.to_unsafe + _n).value = "value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value)
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

      @pointer = LibGObject.g_object_new_with_properties(LevelBar.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_level_bar_get_type
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

    def max_value=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "max-value", unsafe_value, Pointer(Void).null)
      value
    end

    def max_value : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "max-value", pointerof(value), Pointer(Void).null)
      value
    end

    def min_value=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "min-value", unsafe_value, Pointer(Void).null)
      value
    end

    def min_value : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "min-value", pointerof(value), Pointer(Void).null)
      value
    end

    def mode=(value : Gtk::LevelBarMode) : Gtk::LevelBarMode
      unsafe_value = value

      LibGObject.g_object_set(self, "mode", unsafe_value, Pointer(Void).null)
      value
    end

    def mode : Gtk::LevelBarMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "mode", pointerof(value), Pointer(Void).null)
      Gtk::LevelBarMode.from_value(value)
    end

    def value=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "value", unsafe_value, Pointer(Void).null)
      value
    end

    def value : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "value", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize
      # gtk_level_bar_new: (Constructor)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_level_bar_new

      # Return value handling
      @pointer = _retval
      LibGObject.g_object_ref(_retval)
    end

    def self.new_for_interval(min_value : Float64, max_value : Float64) : self
      # gtk_level_bar_new_for_interval: (Constructor)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_level_bar_new_for_interval(min_value, max_value)

      # Return value handling
      Gtk::LevelBar.new(_retval, GICrystal::Transfer::Full)
    end

    def add_offset_value(name : ::String, value : Float64) : Nil
      # gtk_level_bar_add_offset_value: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_level_bar_add_offset_value(self, name, value)

      # Return value handling
    end

    def inverted : Bool
      # gtk_level_bar_get_inverted: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_level_bar_get_inverted(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def max_value : Float64
      # gtk_level_bar_get_max_value: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_level_bar_get_max_value(self)

      # Return value handling
      _retval
    end

    def min_value : Float64
      # gtk_level_bar_get_min_value: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_level_bar_get_min_value(self)

      # Return value handling
      _retval
    end

    def mode : Gtk::LevelBarMode
      # gtk_level_bar_get_mode: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_level_bar_get_mode(self)

      # Return value handling
      Gtk::LevelBarMode.from_value(_retval)
    end

    def offset_value(name : ::String?, value : Float64) : Bool
      # gtk_level_bar_get_offset_value: (Method)
      # @name: (nullable)
      # @value: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      _retval = LibGtk.gtk_level_bar_get_offset_value(self, name, value)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def value : Float64
      # gtk_level_bar_get_value: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_level_bar_get_value(self)

      # Return value handling
      _retval
    end

    def remove_offset_value(name : ::String?) : Nil
      # gtk_level_bar_remove_offset_value: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      LibGtk.gtk_level_bar_remove_offset_value(self, name)

      # Return value handling
    end

    def inverted=(inverted : Bool) : Nil
      # gtk_level_bar_set_inverted: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_level_bar_set_inverted(self, inverted)

      # Return value handling
    end

    def max_value=(value : Float64) : Nil
      # gtk_level_bar_set_max_value: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_level_bar_set_max_value(self, value)

      # Return value handling
    end

    def min_value=(value : Float64) : Nil
      # gtk_level_bar_set_min_value: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_level_bar_set_min_value(self, value)

      # Return value handling
    end

    def mode=(mode : Gtk::LevelBarMode) : Nil
      # gtk_level_bar_set_mode: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_level_bar_set_mode(self, mode)

      # Return value handling
    end

    def value=(value : Float64) : Nil
      # gtk_level_bar_set_value: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_level_bar_set_value(self, value)

      # Return value handling
    end

    struct OffsetChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "offset-changed::#{@detail}" : "offset-changed"
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

      def connect(block : Proc(Gtk::LevelBar, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::LevelBar.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::LevelBar, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::LevelBar, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::LevelBar.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::LevelBar, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(name : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "offset-changed", name)
      end
    end

    def offset_changed_signal
      OffsetChangedSignal.new(self)
    end
  end
end
