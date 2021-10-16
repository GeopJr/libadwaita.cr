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
  # class, [class@GtkRange], in addition to the methods for `GtkScale` itself.
  # To set the value of a scale, you would normally use [method@Gtk.Range.set_value].
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
  # meaning as [method@Gtk.Scale.add_mark] parameters of the same name. If
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
  # If the scale has an origin (see [method@Gtk.Scale.set_has_origin]), there is
  # a subnode with name highlight below the trough node that is used for rendering
  # the highlighted part of the trough.
  #
  # If the scale is showing a fill level (see [method@Gtk.Range.set_show_fill_level]),
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
  class Scale < Range
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, adjustment : Gtk::Adjustment? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, digits : Int32? = nil, draw_value : Bool? = nil, fill_level : Float64? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_origin : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, inverted : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, restrict_to_fill_level : Bool? = nil, root : Gtk::Root? = nil, round_digits : Int32? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_fill_level : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, value_pos : Gtk::PositionType? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[46]
      _values = StaticArray(LibGObject::Value, 46).new(LibGObject::Value.new)
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
      if digits
        (_names.to_unsafe + _n).value = "digits".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, digits)
        _n += 1
      end
      if draw_value
        (_names.to_unsafe + _n).value = "draw-value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, draw_value)
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
      if has_origin
        (_names.to_unsafe + _n).value = "has-origin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_origin)
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
      if value_pos
        (_names.to_unsafe + _n).value = "value-pos".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value_pos)
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

      @pointer = LibGObject.g_object_new_with_properties(Scale.g_type, _n, _names, _values)
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
      Gtk::PositionType.from_value(value)
    end

    def initialize(orientation : Gtk::Orientation, adjustment : Gtk::Adjustment?)
      # gtk_scale_new: (Constructor)
      # @adjustment: (nullable)
      # Returns: (transfer none)

      adjustment = if adjustment.nil?
                     Pointer(Void).null
                   else
                     adjustment.to_unsafe
                   end

      _retval = LibGtk.gtk_scale_new(orientation, adjustment)
      @pointer = _retval
    end

    def self.new_with_range(orientation : Gtk::Orientation, min : Float64, max : Float64, step : Float64) : Gtk::Widget
      # gtk_scale_new_with_range: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_scale_new_with_range(orientation, min, max, step)
      Gtk::Scale.new(_retval, GICrystal::Transfer::Full)
    end

    def add_mark(value : Float64, position : Gtk::PositionType, markup : ::String?) : Nil
      # gtk_scale_add_mark: (Method)
      # @markup: (nullable)
      # Returns: (transfer none)

      markup = if markup.nil?
                 Pointer(LibC::Char).null
               else
                 markup.to_unsafe
               end

      LibGtk.gtk_scale_add_mark(self, value, position, markup)
    end

    def clear_marks : Nil
      # gtk_scale_clear_marks: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_scale_clear_marks(self)
    end

    def digits : Int32
      # gtk_scale_get_digits: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_scale_get_digits(self)
      _retval
    end

    def draw_value : Bool
      # gtk_scale_get_draw_value: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_scale_get_draw_value(self)
      GICrystal.to_bool(_retval)
    end

    def has_origin : Bool
      # gtk_scale_get_has_origin: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_scale_get_has_origin(self)
      GICrystal.to_bool(_retval)
    end

    def layout : Pango::Layout?
      # gtk_scale_get_layout: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_scale_get_layout(self)
      Pango::Layout.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def layout_offsets : Nil
      # gtk_scale_get_layout_offsets: (Method)
      # @x: (out) (transfer full) (optional)
      # @y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      x = Pointer(Int32).null
      y = Pointer(Int32).null

      LibGtk.gtk_scale_get_layout_offsets(self, x, y)
    end

    def value_pos : Gtk::PositionType
      # gtk_scale_get_value_pos: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_scale_get_value_pos(self)
      Gtk::PositionType.from_value(_retval)
    end

    def digits=(digits : Int32) : Nil
      # gtk_scale_set_digits: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_scale_set_digits(self, digits)
    end

    def draw_value=(draw_value : Bool) : Nil
      # gtk_scale_set_draw_value: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_scale_set_draw_value(self, draw_value)
    end

    def set_format_value_func(func : Pointer(Void)?, user_data : Pointer(Nil)?, destroy_notify : Pointer(Void)?) : Nil
      # gtk_scale_set_format_value_func: (Method)
      # @func: (nullable)
      # @user_data: (nullable)
      # @destroy_notify: (nullable)
      # Returns: (transfer none)

      func = if func.nil?
               LibGtk::ScaleFormatValueFunc.null
             else
               func.to_unsafe
             end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      destroy_notify = if destroy_notify.nil?
                         LibGLib::DestroyNotify.null
                       else
                         destroy_notify.to_unsafe
                       end

      LibGtk.gtk_scale_set_format_value_func(self, func, user_data, destroy_notify)
    end

    def has_origin=(has_origin : Bool) : Nil
      # gtk_scale_set_has_origin: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_scale_set_has_origin(self, has_origin)
    end

    def value_pos=(pos : Gtk::PositionType) : Nil
      # gtk_scale_set_value_pos: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_scale_set_value_pos(self, pos)
    end
  end
end
