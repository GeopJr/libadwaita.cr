require "../gtk-4.0/widget"
require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

module Adw
  # A view switcher action bar.
  #
  # <picture>
  #   <source srcset="view-switcher-bar-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="view-switcher-bar.png" alt="view-switcher-bar">
  # </picture>
  #
  # An action bar letting you switch between multiple views contained in a
  # `#ViewStack`, via an `#ViewSwitcher`. It is designed to be put at
  # the bottom of a window and to be revealed only on really narrow windows, e.g.
  # on mobile phones. It can't be revealed if there are less than two pages.
  #
  # `AdwViewSwitcherBar` is intended to be used together with
  # `#ViewSwitcherTitle`.
  #
  # A common use case is to bind the `ViewSwitcherBar#reveal` property
  # to [property@ViewSwitcherTitle:title-visible] to automatically reveal the
  # view switcher bar when the title label is displayed in place of the view
  # switcher, as follows:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
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
  #       <property name="orientation">vertical</property>
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
  # `AdwViewSwitcherBar` has a single CSS node with name` viewswitcherbar`.
  @[GObject::GeneratedWrapper]
  class ViewSwitcherBar < Gtk::Widget
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::ViewSwitcherBarClass), class_init,
        sizeof(LibAdw::ViewSwitcherBar), instance_init, 0)
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

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, reveal : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, stack : Adw::ViewStack? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[37]
      _values = StaticArray(LibGObject::Value, 37).new(LibGObject::Value.new)
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
      if !reveal.nil?
        (_names.to_unsafe + _n).value = "reveal".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reveal)
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
      if !stack.nil?
        (_names.to_unsafe + _n).value = "stack".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, stack)
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

      @pointer = LibGObject.g_object_new_with_properties(ViewSwitcherBar.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_view_switcher_bar_get_type
    end

    def reveal=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "reveal", unsafe_value, Pointer(Void).null)
      value
    end

    def reveal? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "reveal", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    # Creates a new `AdwViewSwitcherBar`.
    def initialize
      # adw_view_switcher_bar_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_view_switcher_bar_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets whether @self should be revealed or hidden.
    def reveal : Bool
      # adw_view_switcher_bar_get_reveal: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_view_switcher_bar_get_reveal(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the stack controlled by @self.
    def stack : Adw::ViewStack?
      # adw_view_switcher_bar_get_stack: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_view_switcher_bar_get_stack(self)

      # Return value handling

      Adw::ViewStack.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets whether @self should be revealed or hidden.
    def reveal=(reveal : Bool) : Nil
      # adw_view_switcher_bar_set_reveal: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_view_switcher_bar_set_reveal(self, reveal)

      # Return value handling
    end

    # Sets the stack controlled by @self.
    def stack=(stack : Adw::ViewStack?) : Nil
      # adw_view_switcher_bar_set_stack: (Method | Setter)
      # @stack: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      stack = if stack.nil?
                Pointer(Void).null
              else
                stack.to_unsafe
              end

      # C call
      LibAdw.adw_view_switcher_bar_set_stack(self, stack)

      # Return value handling
    end
  end
end
