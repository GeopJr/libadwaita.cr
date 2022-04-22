require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkFixed` places its child widgets at fixed positions and with fixed sizes.
  #
  # `GtkFixed` performs no automatic layout management.
  #
  # For most applications, you should not use this container! It keeps
  # you from having to learn about the other GTK containers, but it
  # results in broken applications.  With `GtkFixed`, the following
  # things will result in truncated text, overlapping widgets, and
  # other display bugs:
  #
  # - Themes, which may change widget sizes.
  #
  # - Fonts other than the one you used to write the app will of course
  #   change the size of widgets containing text; keep in mind that
  #   users may use a larger font because of difficulty reading the
  #   default, or they may be using a different OS that provides different fonts.
  #
  # - Translation of text into other languages changes its size. Also,
  #   display of non-English text will use a different font in many
  #   cases.
  #
  # In addition, `GtkFixed` does not pay attention to text direction and
  # thus may produce unwanted results if your app is run under right-to-left
  # languages such as Hebrew or Arabic. That is: normally GTK will order
  # containers appropriately for the text direction, e.g. to put labels to
  # the right of the thing they label when using an RTL language, but it can’t
  # do that with `GtkFixed`. So if you need to reorder widgets depending on
  # the text direction, you would need to manually detect it and adjust child
  # positions accordingly.
  #
  # Finally, fixed positioning makes it kind of annoying to add/remove
  # UI elements, since you have to reposition all the other elements. This
  # is a long-term maintenance problem for your application.
  #
  # If you know none of these things are an issue for your application,
  # and prefer the simplicity of `GtkFixed`, by all means use the
  # widget. But you should be aware of the tradeoffs.
  @[GObject::GeneratedWrapper]
  class Fixed < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::FixedClass), class_init,
        sizeof(LibGtk::Fixed), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[35]
      _values = StaticArray(LibGObject::Value, 35).new(LibGObject::Value.new)
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

      @pointer = LibGObject.g_object_new_with_properties(Fixed.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_fixed_get_type
    end

    # Creates a new `GtkFixed`.
    def initialize
      # gtk_fixed_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_fixed_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
    end

    # Retrieves the translation transformation of the
    # given child `GtkWidget` in the `GtkFixed`.
    #
    # See also: `Gtk::Fixed#child_transform`.
    def child_position(widget : Gtk::Widget, x : Float64, y : Float64) : Nil
      # gtk_fixed_get_child_position: (Method)
      # @x: (out) (transfer full)
      # @y: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_fixed_get_child_position(self, widget, x, y)

      # Return value handling
    end

    # Retrieves the transformation for @widget set using
    # gtk_fixed_set_child_transform().
    def child_transform(widget : Gtk::Widget) : Gsk::Transform?
      # gtk_fixed_get_child_transform: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_fixed_get_child_transform(self, widget)

      # Return value handling

      Gsk::Transform.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets a translation transformation to the given @x and @y
    # coordinates to the child @widget of the `GtkFixed`.
    def move(widget : Gtk::Widget, x : Float64, y : Float64) : Nil
      # gtk_fixed_move: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_fixed_move(self, widget, x, y)

      # Return value handling
    end

    # Adds a widget to a `GtkFixed` at the given position.
    def put(widget : Gtk::Widget, x : Float64, y : Float64) : Nil
      # gtk_fixed_put: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_fixed_put(self, widget, x, y)

      # Return value handling
    end

    # Removes a child from @fixed.
    def remove(widget : Gtk::Widget) : Nil
      # gtk_fixed_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_fixed_remove(self, widget)

      # Return value handling
    end

    # Sets the transformation for @widget.
    #
    # This is a convenience function that retrieves the
    # `Gtk#FixedLayoutChild` instance associated to
    # @widget and calls `Gtk::FixedLayoutChild#transform=`.
    def set_child_transform(widget : Gtk::Widget, transform : Gsk::Transform?) : Nil
      # gtk_fixed_set_child_transform: (Method)
      # @transform: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      transform = if transform.nil?
                    Pointer(Void).null
                  else
                    transform.to_unsafe
                  end

      # C call
      LibGtk.gtk_fixed_set_child_transform(self, widget, transform)

      # Return value handling
    end
  end
end
