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
  # such as `Gtk#StackSwitcher` or `Gtk#StackSidebar` can
  # be used with `GtkStack` to provide this functionality.
  #
  # Transitions between pages can be animated as slides or fades. This
  # can be controlled with `Gtk::Stack#transition_type=`.
  # These animations respect the [property@Gtk.Settings:gtk-enable-animations]
  # setting.
  #
  # `GtkStack` maintains a `Gtk#StackPage` object for each added
  # child, which holds additional per-child properties. You
  # obtain the `GtkStackPage` for a child with `Gtk::Stack#page`
  # and you can obtain a `GtkSelectionModel` containing all the pages
  # with `Gtk::Stack#pages`.
  #
  # # GtkStack as GtkBuildable
  #
  # To set child-specific properties in a .ui file, create `GtkStackPage`
  # objects explicitly, and set the child widget as a property on it:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
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
  @[GObject::GeneratedWrapper]
  class Stack < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::Stack), instance_init, 0)
    end

    GICrystal.define_new_method(Stack, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Stack`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hhomogeneous : Bool? = nil, interpolate_size : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, pages : Gtk::SelectionModel? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transition_duration : UInt32? = nil, transition_running : Bool? = nil, transition_type : Gtk::StackTransitionType? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, vhomogeneous : Bool? = nil, visible : Bool? = nil, visible_child : Gtk::Widget? = nil, visible_child_name : ::String? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[44]
      _values = StaticArray(LibGObject::Value, 44).new(LibGObject::Value.new)
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
      if !hhomogeneous.nil?
        (_names.to_unsafe + _n).value = "hhomogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hhomogeneous)
        _n += 1
      end
      if !interpolate_size.nil?
        (_names.to_unsafe + _n).value = "interpolate-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, interpolate_size)
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
      if !pages.nil?
        (_names.to_unsafe + _n).value = "pages".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pages)
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
      if !transition_duration.nil?
        (_names.to_unsafe + _n).value = "transition-duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transition_duration)
        _n += 1
      end
      if !transition_running.nil?
        (_names.to_unsafe + _n).value = "transition-running".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transition_running)
        _n += 1
      end
      if !transition_type.nil?
        (_names.to_unsafe + _n).value = "transition-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transition_type)
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
      if !vhomogeneous.nil?
        (_names.to_unsafe + _n).value = "vhomogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vhomogeneous)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if !visible_child.nil?
        (_names.to_unsafe + _n).value = "visible-child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible_child)
        _n += 1
      end
      if !visible_child_name.nil?
        (_names.to_unsafe + _n).value = "visible-child-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible_child_name)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Stack.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gtk::AbstractSelectionModel.new(value, GICrystal::Transfer::None) unless value.null?
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
      Gtk::StackTransitionType.new(value)
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

    # Creates a new `GtkStack`.
    def initialize
      # gtk_stack_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_stack_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Adds a child to @stack.
    def add_child(child : Gtk::Widget) : Gtk::StackPage
      # gtk_stack_add_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_stack_add_child(@pointer, child)

      # Return value handling

      Gtk::StackPage.new(_retval, GICrystal::Transfer::None)
    end

    # Adds a child to @stack.
    #
    # The child is identified by the @name.
    def add_named(child : Gtk::Widget, name : ::String?) : Gtk::StackPage
      # gtk_stack_add_named: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      _retval = LibGtk.gtk_stack_add_named(@pointer, child, name)

      # Return value handling

      Gtk::StackPage.new(_retval, GICrystal::Transfer::None)
    end

    # Adds a child to @stack.
    #
    # The child is identified by the @name. The @title
    # will be used by `GtkStackSwitcher` to represent
    # @child in a tab bar, so it should be short.
    def add_titled(child : Gtk::Widget, name : ::String?, title : ::String) : Gtk::StackPage
      # gtk_stack_add_titled: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      _retval = LibGtk.gtk_stack_add_titled(@pointer, child, name, title)

      # Return value handling

      Gtk::StackPage.new(_retval, GICrystal::Transfer::None)
    end

    # Finds the child with the name given as the argument.
    #
    # Returns %NULL if there is no child with this name.
    def child_by_name(name : ::String) : Gtk::Widget?
      # gtk_stack_get_child_by_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_stack_get_child_by_name(@pointer, name)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether @stack is horizontally homogeneous.
    def hhomogeneous : Bool
      # gtk_stack_get_hhomogeneous: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_stack_get_hhomogeneous(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the `GtkStack` is set up to interpolate between
    # the sizes of children on page switch.
    def interpolate_size : Bool
      # gtk_stack_get_interpolate_size: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_stack_get_interpolate_size(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the `GtkStackPage` object for @child.
    def page(child : Gtk::Widget) : Gtk::StackPage
      # gtk_stack_get_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_stack_get_page(@pointer, child)

      # Return value handling

      Gtk::StackPage.new(_retval, GICrystal::Transfer::None)
    end

    # Returns a `GListModel` that contains the pages of the stack.
    #
    # This can be used to keep an up-to-date view. The model also
    # implements `Gtk#SelectionModel` and can be used to track
    # and modify the visible page.
    def pages : Gtk::SelectionModel
      # gtk_stack_get_pages: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_stack_get_pages(@pointer)

      # Return value handling

      Gtk::AbstractSelectionModel.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns the amount of time (in milliseconds) that
    # transitions between pages in @stack will take.
    def transition_duration : UInt32
      # gtk_stack_get_transition_duration: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_stack_get_transition_duration(@pointer)

      # Return value handling

      _retval
    end

    # Returns whether the @stack is currently in a transition from one page to
    # another.
    def transition_running : Bool
      # gtk_stack_get_transition_running: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_stack_get_transition_running(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the type of animation that will be used
    # for transitions between pages in @stack.
    def transition_type : Gtk::StackTransitionType
      # gtk_stack_get_transition_type: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_stack_get_transition_type(@pointer)

      # Return value handling

      Gtk::StackTransitionType.new(_retval)
    end

    # Gets whether @stack is vertically homogeneous.
    def vhomogeneous : Bool
      # gtk_stack_get_vhomogeneous: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_stack_get_vhomogeneous(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the currently visible child of @stack.
    #
    # Returns %NULL if there are no visible children.
    def visible_child : Gtk::Widget?
      # gtk_stack_get_visible_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_stack_get_visible_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the name of the currently visible child of @stack.
    #
    # Returns %NULL if there is no visible child.
    def visible_child_name : ::String?
      # gtk_stack_get_visible_child_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_stack_get_visible_child_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Removes a child widget from @stack.
    def remove(child : Gtk::Widget) : Nil
      # gtk_stack_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_stack_remove(@pointer, child)

      # Return value handling
    end

    # Sets the `GtkStack` to be horizontally homogeneous or not.
    #
    # If it is homogeneous, the `GtkStack` will request the same
    # width for all its children. If it isn't, the stack
    # may change width when a different child becomes visible.
    def hhomogeneous=(hhomogeneous : Bool) : Nil
      # gtk_stack_set_hhomogeneous: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_stack_set_hhomogeneous(@pointer, hhomogeneous)

      # Return value handling
    end

    # Sets whether or not @stack will interpolate its size when
    # changing the visible child.
    #
    # If the [property@Gtk.Stack:interpolate-size] property is set
    # to %TRUE, @stack will interpolate its size between the current
    # one and the one it'll take after changing the visible child,
    # according to the set transition duration.
    def interpolate_size=(interpolate_size : Bool) : Nil
      # gtk_stack_set_interpolate_size: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_stack_set_interpolate_size(@pointer, interpolate_size)

      # Return value handling
    end

    # Sets the duration that transitions between pages in @stack
    # will take.
    def transition_duration=(duration : UInt32) : Nil
      # gtk_stack_set_transition_duration: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_stack_set_transition_duration(@pointer, duration)

      # Return value handling
    end

    # Sets the type of animation that will be used for
    # transitions between pages in @stack.
    #
    # Available types include various kinds of fades and slides.
    #
    # The transition type can be changed without problems
    # at runtime, so it is possible to change the animation
    # based on the page that is about to become current.
    def transition_type=(transition : Gtk::StackTransitionType) : Nil
      # gtk_stack_set_transition_type: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_stack_set_transition_type(@pointer, transition)

      # Return value handling
    end

    # Sets the `GtkStack` to be vertically homogeneous or not.
    #
    # If it is homogeneous, the `GtkStack` will request the same
    # height for all its children. If it isn't, the stack
    # may change height when a different child becomes visible.
    def vhomogeneous=(vhomogeneous : Bool) : Nil
      # gtk_stack_set_vhomogeneous: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_stack_set_vhomogeneous(@pointer, vhomogeneous)

      # Return value handling
    end

    # Makes @child the visible child of @stack.
    #
    # If @child is different from the currently visible child,
    # the transition between the two will be animated with the
    # current transition type of @stack.
    #
    # Note that the @child widget has to be visible itself
    # (see `Gtk::Widget#show`) in order to become the visible
    # child of @stack.
    def visible_child=(child : Gtk::Widget) : Nil
      # gtk_stack_set_visible_child: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_stack_set_visible_child(@pointer, child)

      # Return value handling
    end

    # Makes the child with the given name visible.
    #
    # Note that the child widget has to be visible itself
    # (see `Gtk::Widget#show`) in order to become the visible
    # child of @stack.
    def set_visible_child_full(name : ::String, transition : Gtk::StackTransitionType) : Nil
      # gtk_stack_set_visible_child_full: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_stack_set_visible_child_full(@pointer, name, transition)

      # Return value handling
    end

    # Makes the child with the given name visible.
    #
    # If @child is different from the currently visible child,
    # the transition between the two will be animated with the
    # current transition type of @stack.
    #
    # Note that the child widget has to be visible itself
    # (see `Gtk::Widget#show`) in order to become the visible
    # child of @stack.
    def visible_child_name=(name : ::String) : Nil
      # gtk_stack_set_visible_child_name: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_stack_set_visible_child_name(@pointer, name)

      # Return value handling
    end
  end
end
