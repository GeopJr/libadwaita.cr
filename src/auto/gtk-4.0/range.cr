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
  # `Gtk#Scale` and `Gtk#Scrollbar`.
  #
  # Apart from signals for monitoring the parameters of the adjustment,
  # `GtkRange` provides properties and methods for setting a
  # “fill level” on range widgets. See `Gtk::Range#fill_level=`.
  @[GObject::GeneratedWrapper]
  class Range < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::RangeClass), class_init,
        sizeof(LibGtk::Range), instance_init, 0)
    end

    GICrystal.define_new_method(Range, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Range`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, adjustment : Gtk::Adjustment? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, fill_level : Float64? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, inverted : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, restrict_to_fill_level : Bool? = nil, root : Gtk::Root? = nil, round_digits : Int32? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_fill_level : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[42]
      _values = StaticArray(LibGObject::Value, 42).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !adjustment.nil?
        (_names.to_unsafe + _n).value = "adjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, adjustment)
        _n += 1
      end
      if !can_focus.nil?
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if !can_target.nil?
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if !css_classes.nil?
        (_names.to_unsafe + _n).value = "css-classes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_classes)
        _n += 1
      end
      if !css_name.nil?
        (_names.to_unsafe + _n).value = "css-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_name)
        _n += 1
      end
      if !cursor.nil?
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if !fill_level.nil?
        (_names.to_unsafe + _n).value = "fill-level".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fill_level)
        _n += 1
      end
      if !focus_on_click.nil?
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if !focusable.nil?
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if !halign.nil?
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if !has_default.nil?
        (_names.to_unsafe + _n).value = "has-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_default)
        _n += 1
      end
      if !has_focus.nil?
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if !has_tooltip.nil?
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if !height_request.nil?
        (_names.to_unsafe + _n).value = "height-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_request)
        _n += 1
      end
      if !hexpand.nil?
        (_names.to_unsafe + _n).value = "hexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand)
        _n += 1
      end
      if !hexpand_set.nil?
        (_names.to_unsafe + _n).value = "hexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand_set)
        _n += 1
      end
      if !inverted.nil?
        (_names.to_unsafe + _n).value = "inverted".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, inverted)
        _n += 1
      end
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if !margin_bottom.nil?
        (_names.to_unsafe + _n).value = "margin-bottom".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_bottom)
        _n += 1
      end
      if !margin_end.nil?
        (_names.to_unsafe + _n).value = "margin-end".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_end)
        _n += 1
      end
      if !margin_start.nil?
        (_names.to_unsafe + _n).value = "margin-start".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_start)
        _n += 1
      end
      if !margin_top.nil?
        (_names.to_unsafe + _n).value = "margin-top".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_top)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !opacity.nil?
        (_names.to_unsafe + _n).value = "opacity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, opacity)
        _n += 1
      end
      if !orientation.nil?
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
        _n += 1
      end
      if !overflow.nil?
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if !parent.nil?
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if !receives_default.nil?
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if !restrict_to_fill_level.nil?
        (_names.to_unsafe + _n).value = "restrict-to-fill-level".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, restrict_to_fill_level)
        _n += 1
      end
      if !root.nil?
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if !round_digits.nil?
        (_names.to_unsafe + _n).value = "round-digits".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, round_digits)
        _n += 1
      end
      if !scale_factor.nil?
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !show_fill_level.nil?
        (_names.to_unsafe + _n).value = "show-fill-level".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_fill_level)
        _n += 1
      end
      if !tooltip_markup.nil?
        (_names.to_unsafe + _n).value = "tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_markup)
        _n += 1
      end
      if !tooltip_text.nil?
        (_names.to_unsafe + _n).value = "tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_text)
        _n += 1
      end
      if !valign.nil?
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if !vexpand.nil?
        (_names.to_unsafe + _n).value = "vexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand)
        _n += 1
      end
      if !vexpand_set.nil?
        (_names.to_unsafe + _n).value = "vexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand_set)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Range.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Get the adjustment which is the “model” object for `GtkRange`.
    def adjustment : Gtk::Adjustment
      # gtk_range_get_adjustment: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_range_get_adjustment(@pointer)

      # Return value handling

      Gtk::Adjustment.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the current position of the fill level indicator.
    def fill_level : Float64
      # gtk_range_get_fill_level: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_range_get_fill_level(@pointer)

      # Return value handling

      _retval
    end

    # Gets whether the `GtkRange` respects text direction.
    #
    # See `Gtk::Range#flippable=`.
    def flippable : Bool
      # gtk_range_get_flippable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_range_get_flippable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether the range is inverted.
    #
    # See `Gtk::Range#inverted=`.
    def inverted : Bool
      # gtk_range_get_inverted: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_range_get_inverted(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # This function returns the area that contains the range’s trough,
    # in coordinates relative to @range's origin.
    #
    # This function is useful mainly for `GtkRange` subclasses.
    def range_rect : Gdk::Rectangle
      # gtk_range_get_range_rect: (Method)
      # @range_rect: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      range_rect = Gdk::Rectangle.new
      # C call
      LibGtk.gtk_range_get_range_rect(@pointer, range_rect)

      # Return value handling

      range_rect
    end

    # Gets whether the range is restricted to the fill level.
    def restrict_to_fill_level : Bool
      # gtk_range_get_restrict_to_fill_level: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_range_get_restrict_to_fill_level(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the number of digits to round the value to when
    # it changes.
    #
    # See [signal@Gtk.Range::change-value].
    def round_digits : Int32
      # gtk_range_get_round_digits: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_range_get_round_digits(@pointer)

      # Return value handling

      _retval
    end

    # Gets whether the range displays the fill level graphically.
    def show_fill_level : Bool
      # gtk_range_get_show_fill_level: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_range_get_show_fill_level(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # This function returns sliders range along the long dimension,
    # in widget->window coordinates.
    #
    # This function is useful mainly for `GtkRange` subclasses.
    def slider_range : Nil
      # gtk_range_get_slider_range: (Method)
      # @slider_start: (out) (transfer full) (optional)
      # @slider_end: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      slider_start = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      slider_end = Pointer(Int32).null
      # C call
      LibGtk.gtk_range_get_slider_range(@pointer, slider_start, slider_end)

      # Return value handling
    end

    # This function is useful mainly for `GtkRange` subclasses.
    #
    # See `Gtk::Range#slider_size_fixed=`.
    def slider_size_fixed : Bool
      # gtk_range_get_slider_size_fixed: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_range_get_slider_size_fixed(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the current value of the range.
    def value : Float64
      # gtk_range_get_value: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_range_get_value(@pointer)

      # Return value handling

      _retval
    end

    # Sets the adjustment to be used as the “model” object for the `GtkRange`
    #
    # The adjustment indicates the current range value, the minimum and
    # maximum range values, the step/page increments used for keybindings
    # and scrolling, and the page size.
    #
    # The page size is normally 0 for `GtkScale` and nonzero for `GtkScrollbar`,
    # and indicates the size of the visible area of the widget being scrolled.
    # The page size affects the size of the scrollbar slider.
    def adjustment=(adjustment : Gtk::Adjustment) : Nil
      # gtk_range_set_adjustment: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_range_set_adjustment(@pointer, adjustment)

      # Return value handling
    end

    # Set the new position of the fill level indicator.
    #
    # The “fill level” is probably best described by its most prominent
    # use case, which is an indicator for the amount of pre-buffering in
    # a streaming media player. In that use case, the value of the range
    # would indicate the current play position, and the fill level would
    # be the position up to which the file/stream has been downloaded.
    #
    # This amount of prebuffering can be displayed on the range’s trough
    # and is themeable separately from the trough. To enable fill level
    # display, use `Gtk::Range#show_fill_level=`. The range defaults
    # to not showing the fill level.
    #
    # Additionally, it’s possible to restrict the range’s slider position
    # to values which are smaller than the fill level. This is controlled
    # by `Gtk::Range#restrict_to_fill_level=` and is by default
    # enabled.
    def fill_level=(fill_level : Float64) : Nil
      # gtk_range_set_fill_level: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_range_set_fill_level(@pointer, fill_level)

      # Return value handling
    end

    # Sets whether the `GtkRange` respects text direction.
    #
    # If a range is flippable, it will switch its direction
    # if it is horizontal and its direction is %GTK_TEXT_DIR_RTL.
    #
    # See `Gtk::Widget#direction`.
    def flippable=(flippable : Bool) : Nil
      # gtk_range_set_flippable: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_range_set_flippable(@pointer, flippable)

      # Return value handling
    end

    # Sets the step and page sizes for the range.
    #
    # The step size is used when the user clicks the `GtkScrollbar`
    # arrows or moves a `GtkScale` via arrow keys. The page size
    # is used for example when moving via Page Up or Page Down keys.
    def set_increments(step : Float64, page : Float64) : Nil
      # gtk_range_set_increments: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_range_set_increments(@pointer, step, page)

      # Return value handling
    end

    # Sets whether to invert the range.
    #
    # Ranges normally move from lower to higher values as the
    # slider moves from top to bottom or left to right. Inverted
    # ranges have higher values at the top or on the right rather
    # than on the bottom or left.
    def inverted=(setting : Bool) : Nil
      # gtk_range_set_inverted: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_range_set_inverted(@pointer, setting)

      # Return value handling
    end

    # Sets the allowable values in the `GtkRange`.
    #
    # The range value is clamped to be between @min and @max.
    # (If the range has a non-zero page size, it is clamped
    # between @min and @max - page-size.)
    def set_range(min : Float64, max : Float64) : Nil
      # gtk_range_set_range: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_range_set_range(@pointer, min, max)

      # Return value handling
    end

    # Sets whether the slider is restricted to the fill level.
    #
    # See `Gtk::Range#fill_level=` for a general description
    # of the fill level concept.
    def restrict_to_fill_level=(restrict_to_fill_level : Bool) : Nil
      # gtk_range_set_restrict_to_fill_level: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_range_set_restrict_to_fill_level(@pointer, restrict_to_fill_level)

      # Return value handling
    end

    # Sets the number of digits to round the value to when
    # it changes.
    #
    # See [signal@Gtk.Range::change-value].
    def round_digits=(round_digits : Int32) : Nil
      # gtk_range_set_round_digits: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_range_set_round_digits(@pointer, round_digits)

      # Return value handling
    end

    # Sets whether a graphical fill level is show on the trough.
    #
    # See `Gtk::Range#fill_level=` for a general description
    # of the fill level concept.
    def show_fill_level=(show_fill_level : Bool) : Nil
      # gtk_range_set_show_fill_level: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_range_set_show_fill_level(@pointer, show_fill_level)

      # Return value handling
    end

    # Sets whether the range’s slider has a fixed size, or a size that
    # depends on its adjustment’s page size.
    #
    # This function is useful mainly for `GtkRange` subclasses.
    def slider_size_fixed=(size_fixed : Bool) : Nil
      # gtk_range_set_slider_size_fixed: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_range_set_slider_size_fixed(@pointer, size_fixed)

      # Return value handling
    end

    # Sets the current value of the range.
    #
    # If the value is outside the minimum or maximum range values,
    # it will be clamped to fit inside them. The range emits the
    # [signal@Gtk.Range::value-changed] signal if the value changes.
    def value=(value : Float64) : Nil
      # gtk_range_set_value: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_range_set_value(@pointer, value)

      # Return value handling
    end

    # Emitted before clamping a value, to give the application a
    # chance to adjust the bounds.
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

      def connect(handler : Proc(Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Float64, _lib_box : Pointer(Void)) {
          value = lib_value
          ::Box(Proc(Float64, Nil)).unbox(_lib_box).call(value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Float64, _lib_box : Pointer(Void)) {
          value = lib_value
          ::Box(Proc(Float64, Nil)).unbox(_lib_box).call(value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::Range, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::Range.new(_lib_sender, GICrystal::Transfer::None)
          value = lib_value
          ::Box(Proc(Gtk::Range, Float64, Nil)).unbox(_lib_box).call(_sender, value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Range, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::Range.new(_lib_sender, GICrystal::Transfer::None)
          value = lib_value
          ::Box(Proc(Gtk::Range, Float64, Nil)).unbox(_lib_box).call(_sender, value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(value : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "adjust-bounds", value)
      end
    end

    def adjust_bounds_signal
      AdjustBoundsSignal.new(self)
    end

    # Emitted when a scroll action is performed on a range.
    #
    # It allows an application to determine the type of scroll event
    # that occurred and the resultant new value. The application can
    # handle the event itself and return %TRUE to prevent further
    # processing. Or, by returning %FALSE, it can pass the event to
    # other handlers until the default GTK handler is reached.
    #
    # The value parameter is unrounded. An application that overrides
    # the ::change-value signal is responsible for clamping the value
    # to the desired number of decimal digits; the default GTK
    # handler clamps the value based on [property@Gtk.Range:round-digits].
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

      def connect(handler : Proc(Gtk::ScrollType, Float64, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll : UInt32, lib_value : Float64, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          scroll = Gtk::ScrollType.new(lib_scroll)
          value = lib_value
          ::Box(Proc(Gtk::ScrollType, Float64, Bool)).unbox(_lib_box).call(scroll, value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ScrollType, Float64, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll : UInt32, lib_value : Float64, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          scroll = Gtk::ScrollType.new(lib_scroll)
          value = lib_value
          ::Box(Proc(Gtk::ScrollType, Float64, Bool)).unbox(_lib_box).call(scroll, value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::Range, Gtk::ScrollType, Float64, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll : UInt32, lib_value : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::Range.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          scroll = Gtk::ScrollType.new(lib_scroll)
          value = lib_value
          ::Box(Proc(Gtk::Range, Gtk::ScrollType, Float64, Bool)).unbox(_lib_box).call(_sender, scroll, value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Range, Gtk::ScrollType, Float64, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll : UInt32, lib_value : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::Range.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          scroll = Gtk::ScrollType.new(lib_scroll)
          value = lib_value
          ::Box(Proc(Gtk::Range, Gtk::ScrollType, Float64, Bool)).unbox(_lib_box).call(_sender, scroll, value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(scroll : Gtk::ScrollType, value : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "change-value", scroll, value)
      end
    end

    def change_value_signal
      ChangeValueSignal.new(self)
    end

    # Virtual function that moves the slider.
    #
    # Used for keybindings.
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

      def connect(handler : Proc(Gtk::ScrollType, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          step = Gtk::ScrollType.new(lib_step)
          ::Box(Proc(Gtk::ScrollType, Nil)).unbox(_lib_box).call(step)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ScrollType, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          step = Gtk::ScrollType.new(lib_step)
          ::Box(Proc(Gtk::ScrollType, Nil)).unbox(_lib_box).call(step)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::Range, Gtk::ScrollType, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::Range.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          step = Gtk::ScrollType.new(lib_step)
          ::Box(Proc(Gtk::Range, Gtk::ScrollType, Nil)).unbox(_lib_box).call(_sender, step)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Range, Gtk::ScrollType, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::Range.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          step = Gtk::ScrollType.new(lib_step)
          ::Box(Proc(Gtk::Range, Gtk::ScrollType, Nil)).unbox(_lib_box).call(_sender, step)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(step : Gtk::ScrollType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-slider", step)
      end
    end

    def move_slider_signal
      MoveSliderSignal.new(self)
    end

    # Emitted when the range value changes.
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

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::Range, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Range.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Range, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Range, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Range.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Range, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
