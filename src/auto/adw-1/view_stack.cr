require "../gtk-4.0/widget"
require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

module Adw
  # A view container for `#ViewSwitcher`.
  #
  # `AdwViewStack` is a container which only shows one page at a time.
  # It is typically used to hold an application's main views.
  #
  # It doesn't provide a way to transition between pages.
  # Instead, a separate widget such as `#ViewSwitcher` can be used with
  # `AdwViewStack` to provide this functionality.
  #
  # `AdwViewStack` pages can have a title, an icon, an attention request, and a
  # numbered badge that `#ViewSwitcher` will use to let users identify which
  # page is which. Set them using the `ViewStackPage#title`,
  # [property@ViewStackPage:icon-name],
  # [property@ViewStackPage:needs-attention], and
  # [property@ViewStackPage:badge-number] properties.
  #
  # Unlike `Gtk#Stack`, transitions between views are not animated.
  #
  # `AdwViewStack` maintains a `#ViewStackPage` object for each added child,
  # which holds additional per-child properties. You obtain the
  # `#ViewStackPage` for a child with `ViewStack#page` and you
  # can obtain a `Gtk#SelectionModel` containing all the pages with
  # `ViewStack#pages`.
  #
  # ## AdwViewStack as GtkBuildable
  #
  # To set child-specific properties in a .ui file, create
  # `#ViewStackPage` objects explicitly, and set the child widget as a
  # property on it:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  #   <object class="AdwViewStack" id="stack">
  #     <child>
  #       <object class="AdwViewStackPage">
  #         <property name="name">overview</property>
  #         <property name="title">Overview</property>
  #         <property name="child">
  #           <object class="AdwStatusPage">
  #             <property name="title">Welcome!</property>
  #           </object>
  #         </property>
  #       </object>
  #     </child>
  #   </object>
  # ```
  #
  # ## CSS nodes
  #
  # `AdwViewStack` has a single CSS node named `stack`.
  @[GObject::GeneratedWrapper]
  class ViewStack < Gtk::Widget
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::ViewStackClass), class_init,
        sizeof(LibAdw::ViewStack), instance_init, 0)
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

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hhomogeneous : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, pages : Gtk::SelectionModel? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, vhomogeneous : Bool? = nil, visible : Bool? = nil, visible_child : Gtk::Widget? = nil, visible_child_name : ::String? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[40]
      _values = StaticArray(LibGObject::Value, 40).new(LibGObject::Value.new)
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

      @pointer = LibGObject.g_object_new_with_properties(ViewStack.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_view_stack_get_type
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

    def pages : Gtk::SelectionModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "pages", pointerof(value), Pointer(Void).null)
      Gtk::SelectionModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
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

    # Creates a new `AdwViewStack`.
    def initialize
      # adw_view_stack_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_view_stack_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Adds a child to @self.
    def add(child : Gtk::Widget) : Adw::ViewStackPage
      # adw_view_stack_add: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_view_stack_add(self, child)

      # Return value handling

      Adw::ViewStackPage.new(_retval, GICrystal::Transfer::None)
    end

    # Adds a child to @self.
    #
    # The child is identified by the @name.
    def add_named(child : Gtk::Widget, name : ::String?) : Adw::ViewStackPage
      # adw_view_stack_add_named: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      _retval = LibAdw.adw_view_stack_add_named(self, child, name)

      # Return value handling

      Adw::ViewStackPage.new(_retval, GICrystal::Transfer::None)
    end

    # Adds a child to @self.
    #
    # The child is identified by the @name. The @title will be used by
    # `#ViewSwitcher` to represent @child, so it should be short.
    def add_titled(child : Gtk::Widget, name : ::String?, title : ::String) : Adw::ViewStackPage
      # adw_view_stack_add_titled: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      _retval = LibAdw.adw_view_stack_add_titled(self, child, name, title)

      # Return value handling

      Adw::ViewStackPage.new(_retval, GICrystal::Transfer::None)
    end

    # Finds the child with @name in @self.
    def child_by_name(name : ::String) : Gtk::Widget?
      # adw_view_stack_get_child_by_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_view_stack_get_child_by_name(self, name)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether @self is horizontally homogeneous.
    def hhomogeneous : Bool
      # adw_view_stack_get_hhomogeneous: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_view_stack_get_hhomogeneous(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the `#ViewStackPage` object for @child.
    def page(child : Gtk::Widget) : Adw::ViewStackPage
      # adw_view_stack_get_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_view_stack_get_page(self, child)

      # Return value handling

      Adw::ViewStackPage.new(_retval, GICrystal::Transfer::None)
    end

    # Returns a `Gio#ListModel` that contains the pages of the stack.
    #
    # This can be used to keep an up-to-date view. The model also implements
    # `Gtk#SelectionModel` and can be used to track and change the visible
    # page.
    def pages : Gtk::SelectionModel
      # adw_view_stack_get_pages: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibAdw.adw_view_stack_get_pages(self)

      # Return value handling

      Gtk::SelectionModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets whether @self is vertically homogeneous.
    def vhomogeneous : Bool
      # adw_view_stack_get_vhomogeneous: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_view_stack_get_vhomogeneous(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the currently visible child of @self, .
    def visible_child : Gtk::Widget?
      # adw_view_stack_get_visible_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_view_stack_get_visible_child(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the name of the currently visible child of @self.
    def visible_child_name : ::String?
      # adw_view_stack_get_visible_child_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_view_stack_get_visible_child_name(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Removes a child widget from @self.
    def remove(child : Gtk::Widget) : Nil
      # adw_view_stack_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_view_stack_remove(self, child)

      # Return value handling
    end

    # Sets @self to be horizontally homogeneous or not.
    def hhomogeneous=(hhomogeneous : Bool) : Nil
      # adw_view_stack_set_hhomogeneous: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_view_stack_set_hhomogeneous(self, hhomogeneous)

      # Return value handling
    end

    # Sets @self to be vertically homogeneous or not.
    def vhomogeneous=(vhomogeneous : Bool) : Nil
      # adw_view_stack_set_vhomogeneous: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_view_stack_set_vhomogeneous(self, vhomogeneous)

      # Return value handling
    end

    # Makes @child the visible child of @self.
    def visible_child=(child : Gtk::Widget) : Nil
      # adw_view_stack_set_visible_child: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_view_stack_set_visible_child(self, child)

      # Return value handling
    end

    # Makes the child with @name visible.
    def visible_child_name=(name : ::String) : Nil
      # adw_view_stack_set_visible_child_name: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_view_stack_set_visible_child_name(self, name)

      # Return value handling
    end
  end
end
