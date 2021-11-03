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
  # custom titlebar widget of a `GtkWindow (see [method@Gtk.Window.set_titlebar]),
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
  # [class@Gtk.WindowControls] for details, as well as other children.
  #
  # # Accessibility
  #
  # `GtkHeaderBar` uses the %GTK_ACCESSIBLE_ROLE_GROUP role.
  class HeaderBar < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, decoration_layout : ::String? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_title_buttons : Bool? = nil, title_widget : Gtk::Widget? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[38]
      _values = StaticArray(LibGObject::Value, 38).new(LibGObject::Value.new)
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
      if decoration_layout
        (_names.to_unsafe + _n).value = "decoration-layout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, decoration_layout)
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
      if show_title_buttons
        (_names.to_unsafe + _n).value = "show-title-buttons".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_title_buttons)
        _n += 1
      end
      if title_widget
        (_names.to_unsafe + _n).value = "title-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title_widget)
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

      @pointer = LibGObject.g_object_new_with_properties(HeaderBar.g_type, _n, _names, _values)
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

    def initialize
      # gtk_header_bar_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_header_bar_new
      @pointer = _retval
    end

    def decoration_layout : ::String?
      # gtk_header_bar_get_decoration_layout: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_header_bar_get_decoration_layout(self)
      ::String.new(_retval) unless _retval.null?
    end

    def show_title_buttons : Bool
      # gtk_header_bar_get_show_title_buttons: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_header_bar_get_show_title_buttons(self)
      GICrystal.to_bool(_retval)
    end

    def title_widget : Gtk::Widget?
      # gtk_header_bar_get_title_widget: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_header_bar_get_title_widget(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def pack_end(child : Gtk::Widget) : Nil
      # gtk_header_bar_pack_end: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_header_bar_pack_end(self, child)
    end

    def pack_start(child : Gtk::Widget) : Nil
      # gtk_header_bar_pack_start: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_header_bar_pack_start(self, child)
    end

    def remove(child : Gtk::Widget) : Nil
      # gtk_header_bar_remove: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_header_bar_remove(self, child)
    end

    def decoration_layout=(layout : ::String?) : Nil
      # gtk_header_bar_set_decoration_layout: (Method | Setter)
      # @layout: (nullable)
      # Returns: (transfer none)

      layout = if layout.nil?
                 Pointer(LibC::Char).null
               else
                 layout.to_unsafe
               end

      LibGtk.gtk_header_bar_set_decoration_layout(self, layout)
    end

    def show_title_buttons=(setting : Bool) : Nil
      # gtk_header_bar_set_show_title_buttons: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_header_bar_set_show_title_buttons(self, setting)
    end

    def title_widget=(title_widget : Gtk::Widget?) : Nil
      # gtk_header_bar_set_title_widget: (Method | Setter)
      # @title_widget: (nullable)
      # Returns: (transfer none)

      title_widget = if title_widget.nil?
                       Pointer(Void).null
                     else
                       title_widget.to_unsafe
                     end

      LibGtk.gtk_header_bar_set_title_widget(self, title_widget)
    end
  end
end
