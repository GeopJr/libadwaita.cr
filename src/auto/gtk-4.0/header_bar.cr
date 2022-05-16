require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkHeaderBar` is a widget for creating custom title bars for windows.
  #
  # ![An example GtkHeaderBar](headerbar.png)
  #
  # `GtkHeaderBar` is similar to a horizontal `GtkCenterBox`. It allows
  # children to be placed at the start or the end. In addition, it allows
  # the window title to be displayed. The title will be centered with respect
  # to the width of the box, even if the children at either side take up
  # different amounts of space.
  #
  # `GtkHeaderBar` can add typical window frame controls, such as minimize,
  # maximize and close buttons, or the window icon.
  #
  # For these reasons, `GtkHeaderBar` is the natural choice for use as the
  # custom titlebar widget of a `GtkWindow` (see `Gtk::Window#titlebar=`),
  # as it gives features typical of titlebars while allowing the addition of
  # child widgets.
  #
  # ## GtkHeaderBar as GtkBuildable
  #
  # The `GtkHeaderBar` implementation of the `GtkBuildable` interface supports
  # adding children at the start or end sides by specifying “start” or “end” as
  # the “type” attribute of a <child> element, or setting the title widget by
  # specifying “title” value.
  #
  # By default the `GtkHeaderBar` uses a `GtkLabel` displaying the title of the
  # window it is contained in as the title widget, equivalent to the following
  # UI definition:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <object class="GtkHeaderBar">
  #   <property name="title-widget">
  #     <object class="GtkLabel">
  #       <property name="label" translatable="yes">Label</property>
  #       <property name="single-line-mode">True</property>
  #       <property name="ellipsize">end</property>
  #       <property name="width-chars">5</property>
  #       <style>
  #         <class name="title"/>
  #       </style>
  #     </object>
  #   </property>
  # </object>
  # ```
  #
  # # CSS nodes
  #
  # ```
  # headerbar
  # ╰── windowhandle
  #     ╰── box
  #         ├── box.start
  #         │   ├── windowcontrols.start
  #         │   ╰── [other children]
  #         ├── [Title Widget]
  #         ╰── box.end
  #             ├── [other children]
  #             ╰── windowcontrols.end
  # ```
  #
  # A `GtkHeaderBar`'s CSS node is called `headerbar`. It contains a `windowhandle`
  # subnode, which contains a `box` subnode, which contains two `box` subnodes at
  # the start and end of the header bar, as well as a center node that represents
  # the title.
  #
  # Each of the boxes contains a `windowcontrols` subnode, see
  # `Gtk#WindowControls` for details, as well as other children.
  #
  # # Accessibility
  #
  # `GtkHeaderBar` uses the %GTK_ACCESSIBLE_ROLE_GROUP role.
  @[GObject::GeneratedWrapper]
  class HeaderBar < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::HeaderBar), instance_init, 0)
    end

    GICrystal.define_new_method(HeaderBar, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `HeaderBar`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, decoration_layout : ::String? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_title_buttons : Bool? = nil, title_widget : Gtk::Widget? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[38]
      _values = StaticArray(LibGObject::Value, 38).new(LibGObject::Value.new)
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
      if !decoration_layout.nil?
        (_names.to_unsafe + _n).value = "decoration-layout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, decoration_layout)
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
      if !show_title_buttons.nil?
        (_names.to_unsafe + _n).value = "show-title-buttons".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_title_buttons)
        _n += 1
      end
      if !title_widget.nil?
        (_names.to_unsafe + _n).value = "title-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title_widget)
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

      @pointer = LibGObject.g_object_new_with_properties(HeaderBar.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_header_bar_get_type
    end

    def decoration_layout=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "decoration-layout", unsafe_value, Pointer(Void).null)
      value
    end

    def decoration_layout : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "decoration-layout", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def show_title_buttons=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-title-buttons", unsafe_value, Pointer(Void).null)
      value
    end

    def show_title_buttons? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-title-buttons", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def title_widget=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "title-widget", unsafe_value, Pointer(Void).null)
      value
    end

    def title_widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "title-widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new `GtkHeaderBar` widget.
    def initialize
      # gtk_header_bar_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_header_bar_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the decoration layout of the `GtkHeaderBar`.
    def decoration_layout : ::String?
      # gtk_header_bar_get_decoration_layout: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_header_bar_get_decoration_layout(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns whether this header bar shows the standard window
    # title buttons.
    def show_title_buttons : Bool
      # gtk_header_bar_get_show_title_buttons: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_header_bar_get_show_title_buttons(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the title widget of the header.
    #
    # See `Gtk::HeaderBar#title_widget=`.
    def title_widget : Gtk::Widget?
      # gtk_header_bar_get_title_widget: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_header_bar_get_title_widget(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Adds @child to @bar, packed with reference to the
    # end of the @bar.
    def pack_end(child : Gtk::Widget) : Nil
      # gtk_header_bar_pack_end: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_header_bar_pack_end(@pointer, child)

      # Return value handling
    end

    # Adds @child to @bar, packed with reference to the
    # start of the @bar.
    def pack_start(child : Gtk::Widget) : Nil
      # gtk_header_bar_pack_start: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_header_bar_pack_start(@pointer, child)

      # Return value handling
    end

    # Removes a child from the `GtkHeaderBar`.
    #
    # The child must have been added with
    # `Gtk::HeaderBar#pack_start`,
    # `Gtk::HeaderBar#pack_end` or
    # `Gtk::HeaderBar#title_widget=`.
    def remove(child : Gtk::Widget) : Nil
      # gtk_header_bar_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_header_bar_remove(@pointer, child)

      # Return value handling
    end

    # Sets the decoration layout for this header bar.
    #
    # This property overrides the
    # [property@Gtk.Settings:gtk-decoration-layout] setting.
    #
    # There can be valid reasons for overriding the setting, such
    # as a header bar design that does not allow for buttons to take
    # room on the right, or only offers room for a single close button.
    # Split header bars are another example for overriding the setting.
    #
    # The format of the string is button names, separated by commas.
    # A colon separates the buttons that should appear on the left
    # from those on the right. Recognized button names are minimize,
    # maximize, close and icon (the window icon).
    #
    # For example, “icon:minimize,maximize,close” specifies a icon
    # on the left, and minimize, maximize and close buttons on the right.
    def decoration_layout=(layout : ::String?) : Nil
      # gtk_header_bar_set_decoration_layout: (Method | Setter)
      # @layout: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      layout = if layout.nil?
                 Pointer(LibC::Char).null
               else
                 layout.to_unsafe
               end

      # C call
      LibGtk.gtk_header_bar_set_decoration_layout(@pointer, layout)

      # Return value handling
    end

    # Sets whether this header bar shows the standard window
    # title buttons.
    def show_title_buttons=(setting : Bool) : Nil
      # gtk_header_bar_set_show_title_buttons: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_header_bar_set_show_title_buttons(@pointer, setting)

      # Return value handling
    end

    # Sets the title for the `GtkHeaderBar`.
    #
    # When set to %NULL, the headerbar will display the title of
    # the window it is contained in.
    #
    # The title should help a user identify the current view.
    # To achieve the same style as the builtin title, use the
    # “title” style class.
    #
    # You should set the title widget to %NULL, for the window
    # title label to be visible again.
    def title_widget=(title_widget : Gtk::Widget?) : Nil
      # gtk_header_bar_set_title_widget: (Method | Setter)
      # @title_widget: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      title_widget = if title_widget.nil?
                       Pointer(Void).null
                     else
                       title_widget.to_unsafe
                     end

      # C call
      LibGtk.gtk_header_bar_set_title_widget(@pointer, title_widget)

      # Return value handling
    end
  end
end
