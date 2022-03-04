require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkWindowControls` shows window frame controls.
  #
  # Typical window frame controls are minimize, maximize and close buttons,
  # and the window icon.
  #
  # ![An example GtkWindowControls](windowcontrols.png)
  #
  # `GtkWindowControls` only displays start or end side of the controls (see
  # [property@Gtk.WindowControls:side]), so it's intended to be always used
  # in pair with another `GtkWindowControls` for the opposite side, for example:
  #
  # ```xml
  # <object class="GtkBox">
  #   <child>
  #     <object class="GtkWindowControls">
  #       <property name="side">start</property>
  #     </object>
  #   </child>
  #
  #   ...
  #
  #   <child>
  #     <object class="GtkWindowControls">
  #       <property name="side">end</property>
  #     </object>
  #   </child>
  # </object>
  # ```
  #
  # # CSS nodes
  #
  # ```
  # windowcontrols
  # ├── [image.icon]
  # ├── [button.minimize]
  # ├── [button.maximize]
  # ╰── [button.close]
  # ```
  #
  # A `GtkWindowControls`' CSS node is called windowcontrols. It contains
  # subnodes corresponding to each title button. Which of the title buttons
  # exist and where they are placed exactly depends on the desktop environment
  # and [property@Gtk.WindowControls:decoration-layout] value.
  #
  # When [property@Gtk.WindowControls:empty] is %TRUE, it gets the .empty
  # style class.
  #
  # # Accessibility
  #
  # `GtkWindowControls` uses the %GTK_ACCESSIBLE_ROLE_GROUP role.
  class WindowControls < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, decoration_layout : ::String? = nil, empty : Bool? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, side : Gtk::PackType? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
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
      if empty
        (_names.to_unsafe + _n).value = "empty".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, empty)
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
      if side
        (_names.to_unsafe + _n).value = "side".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, side)
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

      @pointer = LibGObject.g_object_new_with_properties(WindowControls.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_window_controls_get_type
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

    def empty? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "empty", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def side=(value : Gtk::PackType) : Gtk::PackType
      unsafe_value = value

      LibGObject.g_object_set(self, "side", unsafe_value, Pointer(Void).null)
      value
    end

    def side : Gtk::PackType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "side", pointerof(value), Pointer(Void).null)
      Gtk::PackType.from_value(value)
    end

    def initialize(side : Gtk::PackType)
      # gtk_window_controls_new: (Constructor)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_window_controls_new(side)

      # Return value handling
      @pointer = _retval
      LibGObject.g_object_ref(_retval)
    end

    def decoration_layout : ::String?
      # gtk_window_controls_get_decoration_layout: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_window_controls_get_decoration_layout(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def empty : Bool
      # gtk_window_controls_get_empty: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_window_controls_get_empty(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def side : Gtk::PackType
      # gtk_window_controls_get_side: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_window_controls_get_side(self)

      # Return value handling
      Gtk::PackType.from_value(_retval)
    end

    def decoration_layout=(layout : ::String?) : Nil
      # gtk_window_controls_set_decoration_layout: (Method | Setter)
      # @layout: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      layout = if layout.nil?
                 Pointer(LibC::Char).null
               else
                 layout.to_unsafe
               end

      # C call
      LibGtk.gtk_window_controls_set_decoration_layout(self, layout)

      # Return value handling
    end

    def side=(side : Gtk::PackType) : Nil
      # gtk_window_controls_set_side: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_window_controls_set_side(self, side)

      # Return value handling
    end
  end
end
