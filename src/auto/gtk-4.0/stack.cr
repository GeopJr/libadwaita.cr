require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkStack` is a container which only shows one of its children
  # at a time.
  #
  # In contrast to `GtkNotebook`, `GtkStack` does not provide a means
  # for users to change the visible child. Instead, a separate widget
  # such as [class@Gtk.StackSwitcher] or [class@Gtk.StackSidebar] can
  # be used with `GtkStack` to provide this functionality.
  #
  # Transitions between pages can be animated as slides or fades. This
  # can be controlled with [method@Gtk.Stack.set_transition_type].
  # These animations respect the [property@Gtk.Settings:gtk-enable-animations]
  # setting.
  #
  # `GtkStack` maintains a [class@Gtk.StackPage] object for each added
  # child, which holds additional per-child properties. You
  # obtain the `GtkStackPage` for a child with [method@Gtk.Stack.get_page]
  # and you can obtain a `GtkSelectionModel` containing all the pages
  # with [method@Gtk.Stack.get_pages].
  #
  # # GtkStack as GtkBuildable
  #
  # To set child-specific properties in a .ui file, create `GtkStackPage`
  # objects explicitly, and set the child widget as a property on it:
  #
  # ```xml
  #   <object class="GtkStack" id="stack">
  #     <child>
  #       <object class="GtkStackPage">
  #         <property name="name">page1</property>
  #         <property name="title">In the beginning…</property>
  #         <property name="child">
  #           <object class="GtkLabel">
  #             <property name="label">It was dark</property>
  #           </object>
  #         </property>
  #       </object>
  #     </child>
  # ```
  #
  # # CSS nodes
  #
  # `GtkStack` has a single CSS node named stack.
  #
  # # Accessibility
  #
  # `GtkStack` uses the %GTK_ACCESSIBLE_ROLE_TAB_PANEL for the stack
  # pages, which are the accessible parent objects of the child widgets.
  class Stack < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hhomogeneous : Bool? = nil, interpolate_size : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, pages : Gtk::SelectionModel? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transition_duration : UInt32? = nil, transition_running : Bool? = nil, transition_type : Gtk::StackTransitionType? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, vhomogeneous : Bool? = nil, visible : Bool? = nil, visible_child : Gtk::Widget? = nil, visible_child_name : ::String? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[44]
      _values = StaticArray(LibGObject::Value, 44).new(LibGObject::Value.new)
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
      if hhomogeneous
        (_names.to_unsafe + _n).value = "hhomogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hhomogeneous)
        _n += 1
      end
      if interpolate_size
        (_names.to_unsafe + _n).value = "interpolate-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, interpolate_size)
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
      if pages
        (_names.to_unsafe + _n).value = "pages".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pages)
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
      if transition_duration
        (_names.to_unsafe + _n).value = "transition-duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transition_duration)
        _n += 1
      end
      if transition_running
        (_names.to_unsafe + _n).value = "transition-running".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transition_running)
        _n += 1
      end
      if transition_type
        (_names.to_unsafe + _n).value = "transition-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transition_type)
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
      if vhomogeneous
        (_names.to_unsafe + _n).value = "vhomogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vhomogeneous)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if visible_child
        (_names.to_unsafe + _n).value = "visible-child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible_child)
        _n += 1
      end
      if visible_child_name
        (_names.to_unsafe + _n).value = "visible-child-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible_child_name)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Stack.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_stack_get_type
    end

    def hhomogeneous=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "hhomogeneous", unsafe_value, Pointer(Void).null)
      value
    end

    def hhomogeneous? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "hhomogeneous", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def interpolate_size=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "interpolate-size", unsafe_value, Pointer(Void).null)
      value
    end

    def interpolate_size? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "interpolate-size", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def pages : Gtk::SelectionModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "pages", pointerof(value), Pointer(Void).null)
      Gtk::SelectionModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def transition_duration=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "transition-duration", unsafe_value, Pointer(Void).null)
      value
    end

    def transition_duration : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "transition-duration", pointerof(value), Pointer(Void).null)
      value
    end

    def transition_running? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "transition-running", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def transition_type=(value : Gtk::StackTransitionType) : Gtk::StackTransitionType
      unsafe_value = value

      LibGObject.g_object_set(self, "transition-type", unsafe_value, Pointer(Void).null)
      value
    end

    def transition_type : Gtk::StackTransitionType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "transition-type", pointerof(value), Pointer(Void).null)
      Gtk::StackTransitionType.from_value(value)
    end

    def vhomogeneous=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "vhomogeneous", unsafe_value, Pointer(Void).null)
      value
    end

    def vhomogeneous? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "vhomogeneous", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def visible_child=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "visible-child", unsafe_value, Pointer(Void).null)
      value
    end

    def visible_child : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "visible-child", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def visible_child_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "visible-child-name", unsafe_value, Pointer(Void).null)
      value
    end

    def visible_child_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "visible-child-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def initialize
      # gtk_stack_new: (Constructor)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_stack_new

      # Return value handling
      @pointer = _retval
      LibGObject.g_object_ref(_retval)
    end

    def add_child(child : Gtk::Widget) : Gtk::StackPage
      # gtk_stack_add_child: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_stack_add_child(self, child)

      # Return value handling
      Gtk::StackPage.new(_retval, GICrystal::Transfer::None)
    end

    def add_named(child : Gtk::Widget, name : ::String?) : Gtk::StackPage
      # gtk_stack_add_named: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      _retval = LibGtk.gtk_stack_add_named(self, child, name)

      # Return value handling
      Gtk::StackPage.new(_retval, GICrystal::Transfer::None)
    end

    def add_titled(child : Gtk::Widget, name : ::String?, title : ::String) : Gtk::StackPage
      # gtk_stack_add_titled: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      _retval = LibGtk.gtk_stack_add_titled(self, child, name, title)

      # Return value handling
      Gtk::StackPage.new(_retval, GICrystal::Transfer::None)
    end

    def child_by_name(name : ::String) : Gtk::Widget?
      # gtk_stack_get_child_by_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_stack_get_child_by_name(self, name)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def hhomogeneous : Bool
      # gtk_stack_get_hhomogeneous: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_stack_get_hhomogeneous(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def interpolate_size : Bool
      # gtk_stack_get_interpolate_size: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_stack_get_interpolate_size(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def page(child : Gtk::Widget) : Gtk::StackPage
      # gtk_stack_get_page: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_stack_get_page(self, child)

      # Return value handling
      Gtk::StackPage.new(_retval, GICrystal::Transfer::None)
    end

    def pages : Gtk::SelectionModel
      # gtk_stack_get_pages: (Method | Getter)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_stack_get_pages(self)

      # Return value handling
      Gtk::SelectionModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def transition_duration : UInt32
      # gtk_stack_get_transition_duration: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_stack_get_transition_duration(self)

      # Return value handling
      _retval
    end

    def transition_running : Bool
      # gtk_stack_get_transition_running: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_stack_get_transition_running(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def transition_type : Gtk::StackTransitionType
      # gtk_stack_get_transition_type: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_stack_get_transition_type(self)

      # Return value handling
      Gtk::StackTransitionType.from_value(_retval)
    end

    def vhomogeneous : Bool
      # gtk_stack_get_vhomogeneous: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_stack_get_vhomogeneous(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def visible_child : Gtk::Widget?
      # gtk_stack_get_visible_child: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_stack_get_visible_child(self)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def visible_child_name : ::String?
      # gtk_stack_get_visible_child_name: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_stack_get_visible_child_name(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def remove(child : Gtk::Widget) : Nil
      # gtk_stack_remove: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_stack_remove(self, child)

      # Return value handling
    end

    def hhomogeneous=(hhomogeneous : Bool) : Nil
      # gtk_stack_set_hhomogeneous: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_stack_set_hhomogeneous(self, hhomogeneous)

      # Return value handling
    end

    def interpolate_size=(interpolate_size : Bool) : Nil
      # gtk_stack_set_interpolate_size: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_stack_set_interpolate_size(self, interpolate_size)

      # Return value handling
    end

    def transition_duration=(duration : UInt32) : Nil
      # gtk_stack_set_transition_duration: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_stack_set_transition_duration(self, duration)

      # Return value handling
    end

    def transition_type=(transition : Gtk::StackTransitionType) : Nil
      # gtk_stack_set_transition_type: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_stack_set_transition_type(self, transition)

      # Return value handling
    end

    def vhomogeneous=(vhomogeneous : Bool) : Nil
      # gtk_stack_set_vhomogeneous: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_stack_set_vhomogeneous(self, vhomogeneous)

      # Return value handling
    end

    def visible_child=(child : Gtk::Widget) : Nil
      # gtk_stack_set_visible_child: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_stack_set_visible_child(self, child)

      # Return value handling
    end

    def set_visible_child_full(name : ::String, transition : Gtk::StackTransitionType) : Nil
      # gtk_stack_set_visible_child_full: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_stack_set_visible_child_full(self, name, transition)

      # Return value handling
    end

    def visible_child_name=(name : ::String) : Nil
      # gtk_stack_set_visible_child_name: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_stack_set_visible_child_name(self, name)

      # Return value handling
    end
  end
end
