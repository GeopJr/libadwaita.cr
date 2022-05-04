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
  # Use `Gtk::LevelBar#value=` to set the current value, and
  # `Gtk::LevelBar#add_offset_value` to set the value offsets at which
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
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  # to modify the interval using `Gtk::LevelBar#min_value=` and
  # `Gtk::LevelBar#max_value=`. The value will be always drawn in
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
  @[GObject::GeneratedWrapper]
  class LevelBar < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::LevelBar), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, inverted : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, max_value : Float64? = nil, min_value : Float64? = nil, mode : Gtk::LevelBarMode? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, value : Float64? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[41]
      _values = StaticArray(LibGObject::Value, 41).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
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
      if !max_value.nil?
        (_names.to_unsafe + _n).value = "max-value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_value)
        _n += 1
      end
      if !min_value.nil?
        (_names.to_unsafe + _n).value = "min-value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, min_value)
        _n += 1
      end
      if !mode.nil?
        (_names.to_unsafe + _n).value = "mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mode)
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
      if !root.nil?
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
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
      if !value.nil?
        (_names.to_unsafe + _n).value = "value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value)
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

      @pointer = LibGObject.g_object_new_with_properties(LevelBar.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gtk::LevelBarMode.new(value)
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

    # Creates a new `GtkLevelBar`.
    def initialize
      # gtk_level_bar_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_level_bar_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new `GtkLevelBar` for the specified interval.
    def self.new_for_interval(min_value : Float64, max_value : Float64) : self
      # gtk_level_bar_new_for_interval: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_level_bar_new_for_interval(min_value, max_value)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::LevelBar.new(_retval, GICrystal::Transfer::Full)
    end

    # Adds a new offset marker on @self at the position specified by @value.
    #
    # When the bar value is in the interval topped by @value (or between @value
    # and [property@Gtk.LevelBar:max-value] in case the offset is the last one
    # on the bar) a style class named `level-`@name will be applied
    # when rendering the level bar fill.
    #
    # If another offset marker named @name exists, its value will be
    # replaced by @value.
    def add_offset_value(name : ::String, value : Float64) : Nil
      # gtk_level_bar_add_offset_value: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_level_bar_add_offset_value(self, name, value)

      # Return value handling
    end

    # Returns whether the levelbar is inverted.
    def inverted : Bool
      # gtk_level_bar_get_inverted: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_level_bar_get_inverted(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the `max-value` of the `GtkLevelBar`.
    def max_value : Float64
      # gtk_level_bar_get_max_value: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_level_bar_get_max_value(self)

      # Return value handling

      _retval
    end

    # Returns the `min-value of the `GtkLevelBar`.
    def min_value : Float64
      # gtk_level_bar_get_min_value: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_level_bar_get_min_value(self)

      # Return value handling

      _retval
    end

    # Returns the `mode` of the `GtkLevelBar`.
    def mode : Gtk::LevelBarMode
      # gtk_level_bar_get_mode: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_level_bar_get_mode(self)

      # Return value handling

      Gtk::LevelBarMode.new(_retval)
    end

    # Fetches the value specified for the offset marker @name in @self.
    def offset_value(name : ::String?, value : Float64) : Bool
      # gtk_level_bar_get_offset_value: (Method)
      # @name: (nullable)
      # @value: (out) (transfer full)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
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

    # Returns the `value` of the `GtkLevelBar`.
    def value : Float64
      # gtk_level_bar_get_value: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_level_bar_get_value(self)

      # Return value handling

      _retval
    end

    # Removes an offset marker from a `GtkLevelBar`.
    #
    # The marker must have been previously added with
    # `Gtk::LevelBar#add_offset_value`.
    def remove_offset_value(name : ::String?) : Nil
      # gtk_level_bar_remove_offset_value: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      LibGtk.gtk_level_bar_remove_offset_value(self, name)

      # Return value handling
    end

    # Sets whether the `GtkLevelBar` is inverted.
    def inverted=(inverted : Bool) : Nil
      # gtk_level_bar_set_inverted: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_level_bar_set_inverted(self, inverted)

      # Return value handling
    end

    # Sets the `max-value` of the `GtkLevelBar`.
    #
    # You probably want to update preexisting level offsets after calling
    # this function.
    def max_value=(value : Float64) : Nil
      # gtk_level_bar_set_max_value: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_level_bar_set_max_value(self, value)

      # Return value handling
    end

    # Sets the `min-value` of the `GtkLevelBar`.
    #
    # You probably want to update preexisting level offsets after calling
    # this function.
    def min_value=(value : Float64) : Nil
      # gtk_level_bar_set_min_value: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_level_bar_set_min_value(self, value)

      # Return value handling
    end

    # Sets the `mode` of the `GtkLevelBar`.
    def mode=(mode : Gtk::LevelBarMode) : Nil
      # gtk_level_bar_set_mode: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_level_bar_set_mode(self, mode)

      # Return value handling
    end

    # Sets the value of the `GtkLevelBar`.
    def value=(value : Float64) : Nil
      # gtk_level_bar_set_value: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_level_bar_set_value(self, value)

      # Return value handling
    end

    # Emitted when an offset specified on the bar changes value.
    #
    # This typically is the result of a `Gtk::LevelBar#add_offset_value`
    # call.
    #
    # The signal supports detailed connections; you can connect to the
    # detailed signal "changed::x" in order to only receive callbacks when
    # the value of offset "x" changes.
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

      def connect(handler : Proc(::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_name : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          name = lib_name
          ::Box(Proc(::String, Nil)).unbox(_lib_box).call(name)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_name : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          name = lib_name
          ::Box(Proc(::String, Nil)).unbox(_lib_box).call(name)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::LevelBar, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_name : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::LevelBar.new(_lib_sender, GICrystal::Transfer::None)
          name = lib_name
          ::Box(Proc(Gtk::LevelBar, ::String, Nil)).unbox(_lib_box).call(_sender, name)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::LevelBar, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_name : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::LevelBar.new(_lib_sender, GICrystal::Transfer::None)
          name = lib_name
          ::Box(Proc(Gtk::LevelBar, ::String, Nil)).unbox(_lib_box).call(_sender, name)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
