require "./range"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./orientable"

module Gtk
  # A `GtkScale` is a slider control used to select a numeric value.
  #
  # ![An example GtkScale](scales.png)
  #
  # To use it, you’ll probably want to investigate the methods on its base
  # class, `#GtkRange`, in addition to the methods for `GtkScale` itself.
  # To set the value of a scale, you would normally use `Gtk::Range#value=`.
  # To detect changes to the value, you would normally use the
  # [signal@Gtk.Range::value-changed] signal.
  #
  # Note that using the same upper and lower bounds for the `GtkScale` (through
  # the `GtkRange` methods) will hide the slider itself. This is useful for
  # applications that want to show an undeterminate value on the scale, without
  # changing the layout of the application (such as movie or music players).
  #
  # # GtkScale as GtkBuildable
  #
  # `GtkScale` supports a custom <marks> element, which can contain multiple
  # <mark\> elements. The “value” and “position” attributes have the same
  # meaning as `Gtk::Scale#add_mark` parameters of the same name. If
  # the element is not empty, its content is taken as the markup to show at
  # the mark. It can be translated with the usual ”translatable” and
  # “context” attributes.
  #
  # # CSS nodes
  #
  # ```
  # scale[.fine-tune][.marks-before][.marks-after]
  # ├── [value][.top][.right][.bottom][.left]
  # ├── marks.top
  # │   ├── mark
  # │   ┊    ├── [label]
  # │   ┊    ╰── indicator
  # ┊   ┊
  # │   ╰── mark
  # ├── marks.bottom
  # │   ├── mark
  # │   ┊    ├── indicator
  # │   ┊    ╰── [label]
  # ┊   ┊
  # │   ╰── mark
  # ╰── trough
  #     ├── [fill]
  #     ├── [highlight]
  #     ╰── slider
  # ```
  #
  # `GtkScale` has a main CSS node with name scale and a subnode for its contents,
  # with subnodes named trough and slider.
  #
  # The main node gets the style class .fine-tune added when the scale is in
  # 'fine-tuning' mode.
  #
  # If the scale has an origin (see `Gtk::Scale#has_origin=`), there is
  # a subnode with name highlight below the trough node that is used for rendering
  # the highlighted part of the trough.
  #
  # If the scale is showing a fill level (see `Gtk::Range#show_fill_level=`),
  # there is a subnode with name fill below the trough node that is used for
  # rendering the filled in part of the trough.
  #
  # If marks are present, there is a marks subnode before or after the trough
  # node, below which each mark gets a node with name mark. The marks nodes get
  # either the .top or .bottom style class.
  #
  # The mark node has a subnode named indicator. If the mark has text, it also
  # has a subnode named label. When the mark is either above or left of the
  # scale, the label subnode is the first when present. Otherwise, the indicator
  # subnode is the first.
  #
  # The main CSS node gets the 'marks-before' and/or 'marks-after' style classes
  # added depending on what marks are present.
  #
  # If the scale is displaying the value (see [property@Gtk.Scale:draw-value]),
  # there is subnode with name value. This node will get the .top or .bottom style
  # classes similar to the marks node.
  #
  # # Accessibility
  #
  # `GtkScale` uses the %GTK_ACCESSIBLE_ROLE_SLIDER role.
  @[GObject::GeneratedWrapper]
  class Scale < Range
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ScaleClass), class_init,
        sizeof(LibGtk::Scale), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, adjustment : Gtk::Adjustment? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, digits : Int32? = nil, draw_value : Bool? = nil, fill_level : Float64? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_origin : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, inverted : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, restrict_to_fill_level : Bool? = nil, root : Gtk::Root? = nil, round_digits : Int32? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_fill_level : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, value_pos : Gtk::PositionType? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[46]
      _values = StaticArray(LibGObject::Value, 46).new(LibGObject::Value.new)
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
      if !digits.nil?
        (_names.to_unsafe + _n).value = "digits".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, digits)
        _n += 1
      end
      if !draw_value.nil?
        (_names.to_unsafe + _n).value = "draw-value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, draw_value)
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
      if !has_origin.nil?
        (_names.to_unsafe + _n).value = "has-origin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_origin)
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
      if !value_pos.nil?
        (_names.to_unsafe + _n).value = "value-pos".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value_pos)
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

      @pointer = LibGObject.g_object_new_with_properties(Scale.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_scale_get_type
    end

    def digits=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "digits", unsafe_value, Pointer(Void).null)
      value
    end

    def digits : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "digits", pointerof(value), Pointer(Void).null)
      value
    end

    def draw_value=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "draw-value", unsafe_value, Pointer(Void).null)
      value
    end

    def draw_value? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "draw-value", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def has_origin=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "has-origin", unsafe_value, Pointer(Void).null)
      value
    end

    def has_origin? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-origin", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def value_pos=(value : Gtk::PositionType) : Gtk::PositionType
      unsafe_value = value

      LibGObject.g_object_set(self, "value-pos", unsafe_value, Pointer(Void).null)
      value
    end

    def value_pos : Gtk::PositionType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "value-pos", pointerof(value), Pointer(Void).null)
      Gtk::PositionType.new(value)
    end

    # Creates a new `GtkScale`.
    def initialize(orientation : Gtk::Orientation, adjustment : Gtk::Adjustment?)
      # gtk_scale_new: (Constructor)
      # @adjustment: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      adjustment = if adjustment.nil?
                     Pointer(Void).null
                   else
                     adjustment.to_unsafe
                   end

      # C call
      _retval = LibGtk.gtk_scale_new(orientation, adjustment)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
    end

    # Creates a new scale widget with a range from @min to @max.
    #
    # The returns scale will have the given orientation and will let the
    # user input a number between @min and @max (including @min and @max)
    # with the increment @step. @step must be nonzero; it’s the distance
    # the slider moves when using the arrow keys to adjust the scale
    # value.
    #
    # Note that the way in which the precision is derived works best if
    # @step is a power of ten. If the resulting precision is not suitable
    # for your needs, use `Gtk::Scale#digits=` to correct it.
    def self.new_with_range(orientation : Gtk::Orientation, min : Float64, max : Float64, step : Float64) : self
      # gtk_scale_new_with_range: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scale_new_with_range(orientation, min, max, step)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::Scale.new(_retval, GICrystal::Transfer::Full)
    end

    # Adds a mark at @value.
    #
    # A mark is indicated visually by drawing a tick mark next to the scale,
    # and GTK makes it easy for the user to position the scale exactly at the
    # marks value.
    #
    # If @markup is not %NULL, text is shown next to the tick mark.
    #
    # To remove marks from a scale, use `Gtk::Scale#clear_marks`.
    def add_mark(value : Float64, position : Gtk::PositionType, markup : ::String?) : Nil
      # gtk_scale_add_mark: (Method)
      # @markup: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      markup = if markup.nil?
                 Pointer(LibC::Char).null
               else
                 markup.to_unsafe
               end

      # C call
      LibGtk.gtk_scale_add_mark(self, value, position, markup)

      # Return value handling
    end

    # Removes any marks that have been added.
    def clear_marks : Nil
      # gtk_scale_clear_marks: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scale_clear_marks(self)

      # Return value handling
    end

    # Gets the number of decimal places that are displayed in the value.
    def digits : Int32
      # gtk_scale_get_digits: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scale_get_digits(self)

      # Return value handling

      _retval
    end

    # Returns whether the current value is displayed as a string
    # next to the slider.
    def draw_value : Bool
      # gtk_scale_get_draw_value: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scale_get_draw_value(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the scale has an origin.
    def has_origin : Bool
      # gtk_scale_get_has_origin: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scale_get_has_origin(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the `PangoLayout` used to display the scale.
    #
    # The returned object is owned by the scale so does not need
    # to be freed by the caller.
    def layout : Pango::Layout?
      # gtk_scale_get_layout: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scale_get_layout(self)

      # Return value handling

      Pango::Layout.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Obtains the coordinates where the scale will draw the
    # `PangoLayout` representing the text in the scale.
    #
    # Remember when using the `PangoLayout` function you need to
    # convert to and from pixels using `PANGO_PIXELS()` or `PANGO_SCALE`.
    #
    # If the [property@GtkScale:draw-value] property is %FALSE, the return
    # values are undefined.
    def layout_offsets : Nil
      # gtk_scale_get_layout_offsets: (Method)
      # @x: (out) (transfer full) (optional)
      # @y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      x = Pointer(Int32).null
      # Generator::OutArgUsedInReturnPlan
      y = Pointer(Int32).null

      # C call
      LibGtk.gtk_scale_get_layout_offsets(self, x, y)

      # Return value handling
    end

    # Gets the position in which the current value is displayed.
    def value_pos : Gtk::PositionType
      # gtk_scale_get_value_pos: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scale_get_value_pos(self)

      # Return value handling

      Gtk::PositionType.new(_retval)
    end

    # Sets the number of decimal places that are displayed in the value.
    #
    # Also causes the value of the adjustment to be rounded to this number
    # of digits, so the retrieved value matches the displayed one, if
    # [property@GtkScale:draw-value] is %TRUE when the value changes. If
    # you want to enforce rounding the value when [property@GtkScale:draw-value]
    # is %FALSE, you can set [property@GtkRange:round-digits] instead.
    #
    # Note that rounding to a small number of digits can interfere with
    # the smooth autoscrolling that is built into `GtkScale`. As an alternative,
    # you can use `Gtk::Scale#format_value_func=` to format the displayed
    # value yourself.
    def digits=(digits : Int32) : Nil
      # gtk_scale_set_digits: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scale_set_digits(self, digits)

      # Return value handling
    end

    # Specifies whether the current value is displayed as a string next
    # to the slider.
    def draw_value=(draw_value : Bool) : Nil
      # gtk_scale_set_draw_value: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scale_set_draw_value(self, draw_value)

      # Return value handling
    end

    # @func allows you to change how the scale value is displayed.
    #
    # The given function will return an allocated string representing
    # @value. That string will then be used to display the scale's value.
    #
    # If #NULL is passed as @func, the value will be displayed on
    # its own, rounded according to the value of the
    # `GtkScale#digits` property.
    def set_format_value_func(func : Pointer(Void)?, user_data : Pointer(Void)?, destroy_notify : Pointer(Void)?) : Nil
      # gtk_scale_set_format_value_func: (Method)
      # @func: (nullable)
      # @user_data: (nullable)
      # @destroy_notify: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      func = if func.nil?
               LibGtk::ScaleFormatValueFunc.null
             else
               func.to_unsafe
             end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # Generator::NullableArrayPlan
      destroy_notify = if destroy_notify.nil?
                         LibGLib::DestroyNotify.null
                       else
                         destroy_notify.to_unsafe
                       end

      # C call
      LibGtk.gtk_scale_set_format_value_func(self, func, user_data, destroy_notify)

      # Return value handling
    end

    # Sets whether the scale has an origin.
    #
    # If [property@GtkScale:has-origin] is set to %TRUE (the default),
    # the scale will highlight the part of the trough between the origin
    # (bottom or left side) and the current value.
    def has_origin=(has_origin : Bool) : Nil
      # gtk_scale_set_has_origin: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scale_set_has_origin(self, has_origin)

      # Return value handling
    end

    # Sets the position in which the current value is displayed.
    def value_pos=(pos : Gtk::PositionType) : Nil
      # gtk_scale_set_value_pos: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scale_set_value_pos(self, pos)

      # Return value handling
    end
  end
end
