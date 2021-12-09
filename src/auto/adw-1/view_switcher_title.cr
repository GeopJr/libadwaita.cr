require "../gtk-4.0/widget"
require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

module Adw
  # A view switcher title.
  #
  # A widget letting you switch between multiple views contained by a
  # [class@Adw.ViewStack] via an [class@Adw.ViewSwitcher].
  #
  # It is designed to be used as the title widget of a [class@Adw.HeaderBar], and
  # will display the window's title when the window is too narrow to fit the view
  # switcher e.g. on mobile phones, or if there are less than two views.
  #
  # You can conveniently bind the [property@Adw.ViewSwitcherBar:reveal] property
  # to [property@Adw.ViewSwitcherTitle:title-visible] to automatically reveal the
  # view switcher bar when the title label is displayed in place of the view
  # switcher.
  #
  # An example of the UI definition for a common use case:
  #
  # ```xml
  # <object class="GtkWindow">
  #   <child type="titlebar">
  #     <object class="AdwHeaderBar">
  #       <property name="centering-policy">strict</property>
  #       <child type="title">
  #         <object class="AdwViewSwitcherTitle" id="title">
  #           <property name="stack">stack</property>
  #         </object>
  #       </child>
  #     </object>
  #   </child>
  #   <child>
  #     <object class="GtkBox">
  #       <child>
  #         <object class="AdwViewStack" id="stack"/>
  #       </child>
  #       <child>
  #         <object class="AdwViewSwitcherBar">
  #           <property name="stack">stack</property>
  #           <binding name="reveal">
  #             <lookup name="title-visible">title</lookup>
  #           </binding>
  #         </object>
  #       </child>
  #     </object>
  #   </child>
  # </object>
  # ```
  #
  # ## CSS nodes
  #
  # `AdwViewSwitcherTitle` has a single CSS node with name `viewswitchertitle`.
  class ViewSwitcherTitle < Gtk::Widget
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, stack : Adw::ViewStack? = nil, subtitle : ::String? = nil, title : ::String? = nil, title_visible : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, view_switcher_enabled : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[40]
      _values = StaticArray(LibGObject::Value, 40).new(LibGObject::Value.new)
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
      if stack
        (_names.to_unsafe + _n).value = "stack".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, stack)
        _n += 1
      end
      if subtitle
        (_names.to_unsafe + _n).value = "subtitle".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, subtitle)
        _n += 1
      end
      if title
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if title_visible
        (_names.to_unsafe + _n).value = "title-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title_visible)
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
      if view_switcher_enabled
        (_names.to_unsafe + _n).value = "view-switcher-enabled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, view_switcher_enabled)
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

      @pointer = LibGObject.g_object_new_with_properties(ViewSwitcherTitle.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_view_switcher_title_get_type
    end

    def stack=(value : Adw::ViewStack?) : Adw::ViewStack?
      unsafe_value = value

      LibGObject.g_object_set(self, "stack", unsafe_value, Pointer(Void).null)
      value
    end

    def stack : Adw::ViewStack?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "stack", pointerof(value), Pointer(Void).null)
      Adw::ViewStack.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def subtitle=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "subtitle", unsafe_value, Pointer(Void).null)
      value
    end

    def subtitle : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "subtitle", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def title=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "title", unsafe_value, Pointer(Void).null)
      value
    end

    def title : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "title", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def title_visible? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "title-visible", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def view_switcher_enabled=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "view-switcher-enabled", unsafe_value, Pointer(Void).null)
      value
    end

    def view_switcher_enabled? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "view-switcher-enabled", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def initialize
      # adw_view_switcher_title_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibAdw.adw_view_switcher_title_new
      @pointer = _retval
    end

    def stack : Adw::ViewStack?
      # adw_view_switcher_title_get_stack: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_view_switcher_title_get_stack(self)
      Adw::ViewStack.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def subtitle : ::String
      # adw_view_switcher_title_get_subtitle: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_view_switcher_title_get_subtitle(self)
      ::String.new(_retval)
    end

    def title : ::String
      # adw_view_switcher_title_get_title: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_view_switcher_title_get_title(self)
      ::String.new(_retval)
    end

    def title_visible : Bool
      # adw_view_switcher_title_get_title_visible: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_view_switcher_title_get_title_visible(self)
      GICrystal.to_bool(_retval)
    end

    def view_switcher_enabled : Bool
      # adw_view_switcher_title_get_view_switcher_enabled: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_view_switcher_title_get_view_switcher_enabled(self)
      GICrystal.to_bool(_retval)
    end

    def stack=(stack : Adw::ViewStack?) : Nil
      # adw_view_switcher_title_set_stack: (Method | Setter)
      # @stack: (nullable)
      # Returns: (transfer none)

      stack = if stack.nil?
                Pointer(Void).null
              else
                stack.to_unsafe
              end

      LibAdw.adw_view_switcher_title_set_stack(self, stack)
    end

    def subtitle=(subtitle : ::String) : Nil
      # adw_view_switcher_title_set_subtitle: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_view_switcher_title_set_subtitle(self, subtitle)
    end

    def title=(title : ::String) : Nil
      # adw_view_switcher_title_set_title: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_view_switcher_title_set_title(self, title)
    end

    def view_switcher_enabled=(enabled : Bool) : Nil
      # adw_view_switcher_title_set_view_switcher_enabled: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_view_switcher_title_set_view_switcher_enabled(self, enabled)
    end
  end
end
