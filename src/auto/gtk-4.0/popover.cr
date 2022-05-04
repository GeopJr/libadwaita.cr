require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./native"

require "./shortcut_manager"

module Gtk
  # `GtkPopover` is a bubble-like context popup.
  #
  # ![An example GtkPopover](popover.png)
  #
  # It is primarily meant to provide context-dependent information
  # or options. Popovers are attached to a parent widget. By default,
  # they point to the whole widget area, although this behavior can be
  # changed with `Gtk::Popover#pointing_to=`.
  #
  # The position of a popover relative to the widget it is attached to
  # can also be changed with `Gtk::Popover#position=`
  #
  # By default, `GtkPopover` performs a grab, in order to ensure input
  # events get redirected to it while it is shown, and also so the popover
  # is dismissed in the expected situations (clicks outside the popover,
  # or the Escape key being pressed). If no such modal behavior is desired
  # on a popover, `Gtk::Popover#autohide=` may be called on it to
  # tweak its behavior.
  #
  # ## GtkPopover as menu replacement
  #
  # `GtkPopover` is often used to replace menus. The best was to do this
  # is to use the `Gtk#PopoverMenu` subclass which supports being
  # populated from a `GMenuModel` with `Gtk::PopoverMenu#new_from_model`.
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <section>
  #   <attribute name="display-hint">horizontal-buttons</attribute>
  #   <item>
  #     <attribute name="label">Cut</attribute>
  #     <attribute name="action">app.cut</attribute>
  #     <attribute name="verb-icon">edit-cut-symbolic</attribute>
  #   </item>
  #   <item>
  #     <attribute name="label">Copy</attribute>
  #     <attribute name="action">app.copy</attribute>
  #     <attribute name="verb-icon">edit-copy-symbolic</attribute>
  #   </item>
  #   <item>
  #     <attribute name="label">Paste</attribute>
  #     <attribute name="action">app.paste</attribute>
  #     <attribute name="verb-icon">edit-paste-symbolic</attribute>
  #   </item>
  # </section>
  # ```
  #
  # # CSS nodes
  #
  # ```
  # popover[.menu]
  # ├── arrow
  # ╰── contents.background
  #     ╰── <child>
  # ```
  #
  # The contents child node always gets the .background style class
  # and the popover itself gets the .menu style class if the popover
  # is menu-like (i.e. `GtkPopoverMenu`).
  #
  # Particular uses of `GtkPopover`, such as touch selection popups or
  # magnifiers in `GtkEntry` or `GtkTextView` get style classes like
  # .touch-selection or .magnifier to differentiate from plain popovers.
  #
  # When styling a popover directly, the popover node should usually
  # not have any background. The visible part of the popover can have
  # a shadow. To specify it in CSS, set the box-shadow of the contents node.
  #
  # Note that, in order to accomplish appropriate arrow visuals, `GtkPopover`
  # uses custom drawing for the arrow node. This makes it possible for the
  # arrow to change its shape dynamically, but it also limits the possibilities
  # of styling it using CSS. In particular, the arrow gets drawn over the
  # content node's border and shadow, so they look like one shape, which
  # means that the border width of the content node and the arrow node should
  # be the same. The arrow also does not support any border shape other than
  # solid, no border-radius, only one border width (border-bottom-width is
  # used) and no box-shadow.
  @[GObject::GeneratedWrapper]
  class Popover < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Native
    include ShortcutManager

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::PopoverClass), class_init,
        sizeof(LibGtk::Popover), instance_init, 0)
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

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, autohide : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, cascade_popdown : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, default_widget : Gtk::Widget? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_arrow : Bool? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, mnemonics_visible : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, pointing_to : Gdk::Rectangle? = nil, position : Gtk::PositionType? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[43]
      _values = StaticArray(LibGObject::Value, 43).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !autohide.nil?
        (_names.to_unsafe + _n).value = "autohide".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, autohide)
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
      if !cascade_popdown.nil?
        (_names.to_unsafe + _n).value = "cascade-popdown".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cascade_popdown)
        _n += 1
      end
      if !child.nil?
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
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
      if !default_widget.nil?
        (_names.to_unsafe + _n).value = "default-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_widget)
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
      if !has_arrow.nil?
        (_names.to_unsafe + _n).value = "has-arrow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_arrow)
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
      if !mnemonics_visible.nil?
        (_names.to_unsafe + _n).value = "mnemonics-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mnemonics_visible)
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
      if !pointing_to.nil?
        (_names.to_unsafe + _n).value = "pointing-to".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pointing_to)
        _n += 1
      end
      if !position.nil?
        (_names.to_unsafe + _n).value = "position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, position)
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

      @pointer = LibGObject.g_object_new_with_properties(Popover.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_popover_get_type
    end

    def autohide=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "autohide", unsafe_value, Pointer(Void).null)
      value
    end

    def autohide? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "autohide", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def cascade_popdown=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "cascade-popdown", unsafe_value, Pointer(Void).null)
      value
    end

    def cascade_popdown? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "cascade-popdown", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def child=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "child", unsafe_value, Pointer(Void).null)
      value
    end

    def child : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "child", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def default_widget=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "default-widget", unsafe_value, Pointer(Void).null)
      value
    end

    def default_widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "default-widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def has_arrow=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "has-arrow", unsafe_value, Pointer(Void).null)
      value
    end

    def has_arrow? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-arrow", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def mnemonics_visible=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "mnemonics-visible", unsafe_value, Pointer(Void).null)
      value
    end

    def mnemonics_visible? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "mnemonics-visible", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def pointing_to=(value : Gdk::Rectangle?) : Gdk::Rectangle?
      unsafe_value = value

      LibGObject.g_object_set(self, "pointing-to", unsafe_value, Pointer(Void).null)
      value
    end

    def pointing_to : Gdk::Rectangle?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "pointing-to", pointerof(value), Pointer(Void).null)
      Gdk::Rectangle.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def position=(value : Gtk::PositionType) : Gtk::PositionType
      unsafe_value = value

      LibGObject.g_object_set(self, "position", unsafe_value, Pointer(Void).null)
      value
    end

    def position : Gtk::PositionType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "position", pointerof(value), Pointer(Void).null)
      Gtk::PositionType.new(value)
    end

    # Creates a new `GtkPopover`.
    def initialize
      # gtk_popover_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_popover_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns whether the popover is modal.
    #
    # See `Gtk::Popover#autohide=` for the
    # implications of this.
    def autohide : Bool
      # gtk_popover_get_autohide: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_popover_get_autohide(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the popover will close after a modal child is closed.
    def cascade_popdown : Bool
      # gtk_popover_get_cascade_popdown: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_popover_get_cascade_popdown(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the child widget of @popover.
    def child : Gtk::Widget?
      # gtk_popover_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_popover_get_child(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether this popover is showing an arrow
    # pointing at the widget that it is relative to.
    def has_arrow : Bool
      # gtk_popover_get_has_arrow: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_popover_get_has_arrow(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether mnemonics are visible.
    def mnemonics_visible : Bool
      # gtk_popover_get_mnemonics_visible: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_popover_get_mnemonics_visible(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the offset previous set with gtk_popover_set_offset().
    def offset(x_offset : Int32?, y_offset : Int32?) : Nil
      # gtk_popover_get_offset: (Method)
      # @x_offset: (out) (transfer full) (nullable)
      # @y_offset: (out) (transfer full) (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      x_offset = if x_offset.nil?
                   Int32.null
                 else
                   x_offset.to_unsafe
                 end
      # Generator::NullableArrayPlan
      y_offset = if y_offset.nil?
                   Int32.null
                 else
                   y_offset.to_unsafe
                 end

      # C call
      LibGtk.gtk_popover_get_offset(self, x_offset, y_offset)

      # Return value handling
    end

    # Gets the rectangle that the popover points to.
    #
    # If a rectangle to point to has been set, this function will
    # return %TRUE and fill in @rect with such rectangle, otherwise
    # it will return %FALSE and fill in @rect with the parent
    # widget coordinates.
    def pointing_to : Gdk::Rectangle
      # gtk_popover_get_pointing_to: (Method | Getter)
      # @rect: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      rect = Gdk::Rectangle.new
      # C call
      _retval = LibGtk.gtk_popover_get_pointing_to(self, rect)

      # Return value handling

      rect
    end

    # Returns the preferred position of @popover.
    def position : Gtk::PositionType
      # gtk_popover_get_position: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_popover_get_position(self)

      # Return value handling

      Gtk::PositionType.new(_retval)
    end

    # Pops @popover down.
    #
    # This may have the side-effect of closing a parent popover
    # as well. See [property@Gtk.Popover:cascade-popdown].
    def popdown : Nil
      # gtk_popover_popdown: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_popover_popdown(self)

      # Return value handling
    end

    # Pops @popover up.
    def popup : Nil
      # gtk_popover_popup: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_popover_popup(self)

      # Return value handling
    end

    # Presents the popover to the user.
    def present : Nil
      # gtk_popover_present: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_popover_present(self)

      # Return value handling
    end

    # Sets whether @popover is modal.
    #
    # A modal popover will grab the keyboard focus on it when being
    # displayed. Focus will wrap around within the popover. Clicking
    # outside the popover area or pressing Esc will dismiss the popover.
    #
    # Called this function on an already showing popup with a new
    # autohide value different from the current one, will cause the
    # popup to be hidden.
    def autohide=(autohide : Bool) : Nil
      # gtk_popover_set_autohide: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_popover_set_autohide(self, autohide)

      # Return value handling
    end

    # If @cascade_popdown is %TRUE, the popover will be
    # closed when a child modal popover is closed.
    #
    # If %FALSE, @popover will stay visible.
    def cascade_popdown=(cascade_popdown : Bool) : Nil
      # gtk_popover_set_cascade_popdown: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_popover_set_cascade_popdown(self, cascade_popdown)

      # Return value handling
    end

    # Sets the child widget of @popover.
    def child=(child : Gtk::Widget?) : Nil
      # gtk_popover_set_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_popover_set_child(self, child)

      # Return value handling
    end

    # Sets the default widget of a `GtkPopover`.
    #
    # The default widget is the widget that’s activated when the user
    # presses Enter in a dialog (for example). This function sets or
    # unsets the default widget for a `GtkPopover`.
    def default_widget=(widget : Gtk::Widget?) : Nil
      # gtk_popover_set_default_widget: (Method | Setter)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      LibGtk.gtk_popover_set_default_widget(self, widget)

      # Return value handling
    end

    # Sets whether this popover should draw an arrow
    # pointing at the widget it is relative to.
    def has_arrow=(has_arrow : Bool) : Nil
      # gtk_popover_set_has_arrow: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_popover_set_has_arrow(self, has_arrow)

      # Return value handling
    end

    # Sets whether mnemonics should be visible.
    def mnemonics_visible=(mnemonics_visible : Bool) : Nil
      # gtk_popover_set_mnemonics_visible: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_popover_set_mnemonics_visible(self, mnemonics_visible)

      # Return value handling
    end

    # Sets the offset to use when calculating the position
    # of the popover.
    #
    # These values are used when preparing the `Gdk#PopupLayout`
    # for positioning the popover.
    def set_offset(x_offset : Int32, y_offset : Int32) : Nil
      # gtk_popover_set_offset: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_popover_set_offset(self, x_offset, y_offset)

      # Return value handling
    end

    # Sets the rectangle that @popover points to.
    #
    # This is in the coordinate space of the @popover parent.
    def pointing_to=(rect : Gdk::Rectangle?) : Nil
      # gtk_popover_set_pointing_to: (Method | Setter)
      # @rect: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      rect = if rect.nil?
               Pointer(Void).null
             else
               rect.to_unsafe
             end

      # C call
      LibGtk.gtk_popover_set_pointing_to(self, rect)

      # Return value handling
    end

    # Sets the preferred position for @popover to appear.
    #
    # If the @popover is currently visible, it will be immediately
    # updated.
    #
    # This preference will be respected where possible, although
    # on lack of space (eg. if close to the window edges), the
    # `GtkPopover` may choose to appear on the opposite side.
    def position=(position : Gtk::PositionType) : Nil
      # gtk_popover_set_position: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_popover_set_position(self, position)

      # Return value handling
    end

    # Emitted whend the user activates the default widget.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    struct ActivateDefaultSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate-default::#{@detail}" : "activate-default"
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

      def connect(handler : Proc(Gtk::Popover, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Popover.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Popover, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Popover, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Popover.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Popover, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-default")
      end
    end

    def activate_default_signal
      ActivateDefaultSignal.new(self)
    end

    # Emitted when the popover is closed.
    struct ClosedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "closed::#{@detail}" : "closed"
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

      def connect(handler : Proc(Gtk::Popover, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Popover.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Popover, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Popover, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Popover.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Popover, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "closed")
      end
    end

    def closed_signal
      ClosedSignal.new(self)
    end
  end
end
