require "../g_object-2.0/object"

module Adw
  # An auxiliary class used by `#TabView`.
  @[GObject::GeneratedWrapper]
  class TabPage < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::TabPageClass), class_init,
        sizeof(LibAdw::TabPage), instance_init, 0)
    end

    GICrystal.define_new_method(TabPage, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TabPage`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child : Gtk::Widget? = nil, icon : Gio::Icon? = nil, indicator_activatable : Bool? = nil, indicator_icon : Gio::Icon? = nil, loading : Bool? = nil, needs_attention : Bool? = nil, parent : Adw::TabPage? = nil, pinned : Bool? = nil, selected : Bool? = nil, title : ::String? = nil, tooltip : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[11]
      _values = StaticArray(LibGObject::Value, 11).new(LibGObject::Value.new)
      _n = 0

      if !child.nil?
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
        _n += 1
      end
      if !icon.nil?
        (_names.to_unsafe + _n).value = "icon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon)
        _n += 1
      end
      if !indicator_activatable.nil?
        (_names.to_unsafe + _n).value = "indicator-activatable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, indicator_activatable)
        _n += 1
      end
      if !indicator_icon.nil?
        (_names.to_unsafe + _n).value = "indicator-icon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, indicator_icon)
        _n += 1
      end
      if !loading.nil?
        (_names.to_unsafe + _n).value = "loading".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, loading)
        _n += 1
      end
      if !needs_attention.nil?
        (_names.to_unsafe + _n).value = "needs-attention".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, needs_attention)
        _n += 1
      end
      if !parent.nil?
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if !pinned.nil?
        (_names.to_unsafe + _n).value = "pinned".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pinned)
        _n += 1
      end
      if !selected.nil?
        (_names.to_unsafe + _n).value = "selected".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selected)
        _n += 1
      end
      if !title.nil?
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if !tooltip.nil?
        (_names.to_unsafe + _n).value = "tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TabPage.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_tab_page_get_type
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

    def icon=(value : Gio::Icon?) : Gio::Icon?
      unsafe_value = value

      LibGObject.g_object_set(self, "icon", unsafe_value, Pointer(Void).null)
      value
    end

    def icon : Gio::Icon?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "icon", pointerof(value), Pointer(Void).null)
      Gio::AbstractIcon.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def indicator_activatable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "indicator-activatable", unsafe_value, Pointer(Void).null)
      value
    end

    def indicator_activatable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "indicator-activatable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def indicator_icon=(value : Gio::Icon?) : Gio::Icon?
      unsafe_value = value

      LibGObject.g_object_set(self, "indicator-icon", unsafe_value, Pointer(Void).null)
      value
    end

    def indicator_icon : Gio::Icon?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "indicator-icon", pointerof(value), Pointer(Void).null)
      Gio::AbstractIcon.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def loading=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "loading", unsafe_value, Pointer(Void).null)
      value
    end

    def loading? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "loading", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def needs_attention=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "needs-attention", unsafe_value, Pointer(Void).null)
      value
    end

    def needs_attention? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "needs-attention", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def parent=(value : Adw::TabPage?) : Adw::TabPage?
      unsafe_value = value

      LibGObject.g_object_set(self, "parent", unsafe_value, Pointer(Void).null)
      value
    end

    def parent : Adw::TabPage?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "parent", pointerof(value), Pointer(Void).null)
      Adw::TabPage.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def pinned? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "pinned", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def selected? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "selected", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    def tooltip=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "tooltip", unsafe_value, Pointer(Void).null)
      value
    end

    def tooltip : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "tooltip", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Gets the child of @self.
    def child : Gtk::Widget
      # adw_tab_page_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_page_get_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the icon of @self.
    def icon : Gio::Icon?
      # adw_tab_page_get_icon: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_page_get_icon(@pointer)

      # Return value handling

      Gio::AbstractIcon.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether the indicator of @self is activatable.
    def indicator_activatable : Bool
      # adw_tab_page_get_indicator_activatable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_page_get_indicator_activatable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the indicator icon of @self.
    def indicator_icon : Gio::Icon?
      # adw_tab_page_get_indicator_icon: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_page_get_indicator_icon(@pointer)

      # Return value handling

      Gio::AbstractIcon.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether @self is loading.
    def loading : Bool
      # adw_tab_page_get_loading: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_page_get_loading(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @self needs attention.
    def needs_attention : Bool
      # adw_tab_page_get_needs_attention: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_page_get_needs_attention(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the parent page of @self.
    def parent : Adw::TabPage?
      # adw_tab_page_get_parent: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_page_get_parent(@pointer)

      # Return value handling

      Adw::TabPage.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether @self is pinned.
    def pinned : Bool
      # adw_tab_page_get_pinned: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_page_get_pinned(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @self is selected.
    def selected : Bool
      # adw_tab_page_get_selected: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_page_get_selected(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the title of @self.
    def title : ::String
      # adw_tab_page_get_title: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_page_get_title(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the tooltip of @self.
    def tooltip : ::String?
      # adw_tab_page_get_tooltip: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_page_get_tooltip(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Sets the icon of @self.
    def icon=(icon : Gio::Icon?) : Nil
      # adw_tab_page_set_icon: (Method | Setter)
      # @icon: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      icon = if icon.nil?
               Pointer(Void).null
             else
               icon.to_unsafe
             end

      # C call
      LibAdw.adw_tab_page_set_icon(@pointer, icon)

      # Return value handling
    end

    # Sets whether the indicator of @self is activatable.
    def indicator_activatable=(activatable : Bool) : Nil
      # adw_tab_page_set_indicator_activatable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_tab_page_set_indicator_activatable(@pointer, activatable)

      # Return value handling
    end

    # Sets the indicator icon of @self.
    def indicator_icon=(indicator_icon : Gio::Icon?) : Nil
      # adw_tab_page_set_indicator_icon: (Method | Setter)
      # @indicator_icon: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      indicator_icon = if indicator_icon.nil?
                         Pointer(Void).null
                       else
                         indicator_icon.to_unsafe
                       end

      # C call
      LibAdw.adw_tab_page_set_indicator_icon(@pointer, indicator_icon)

      # Return value handling
    end

    # Sets wether @self is loading.
    def loading=(loading : Bool) : Nil
      # adw_tab_page_set_loading: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_tab_page_set_loading(@pointer, loading)

      # Return value handling
    end

    # Sets whether @self needs attention.
    def needs_attention=(needs_attention : Bool) : Nil
      # adw_tab_page_set_needs_attention: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_tab_page_set_needs_attention(@pointer, needs_attention)

      # Return value handling
    end

    # Sets the title of @self.
    def title=(title : ::String) : Nil
      # adw_tab_page_set_title: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_tab_page_set_title(@pointer, title)

      # Return value handling
    end

    # Sets the tooltip of @self.
    def tooltip=(tooltip : ::String) : Nil
      # adw_tab_page_set_tooltip: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_tab_page_set_tooltip(@pointer, tooltip)

      # Return value handling
    end
  end
end
