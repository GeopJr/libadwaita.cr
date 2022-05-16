require "../gtk-4.0/widget"
require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

module Adw
  # A title bar widget.
  #
  # <picture>
  #   <source srcset="header-bar-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="header-bar.png" alt="header-bar">
  # </picture>
  #
  # `AdwHeaderBar` is similar to `Gtk#HeaderBar`, but provides additional
  # features compared to it. Refer to `GtkHeaderBar` for details.
  #
  # [property@HeaderBar:centering-policy] allows to enforce strict centering of
  # the title widget, this is useful for `#ViewSwitcherTitle`.
  #
  # [property@HeaderBar:show-start-title-buttons] and
  # [property@HeaderBar:show-end-title-buttons] allow to easily create split
  # header bar layouts using `#Leaflet`, as follows:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <object class="AdwLeaflet" id="leaflet">
  #   <child>
  #     <object class="GtkBox">
  #       <property name="orientation">vertical</property>
  #       <child>
  #         <object class="AdwHeaderBar">
  #           <binding name="show-end-title-buttons">
  #             <lookup name="folded">leaflet</lookup>
  #           </binding>
  #         </object>
  #       </child>
  #       <!-- ... -->
  #     </object>
  #   </child>
  #   <!-- ... -->
  #   <child>
  #     <object class="GtkBox">
  #       <property name="orientation">vertical</property>
  #       <property name="hexpand">True</property>
  #       <child>
  #         <object class="AdwHeaderBar">
  #           <binding name="show-start-title-buttons">
  #             <lookup name="folded">leaflet</lookup>
  #           </binding>
  #         </object>
  #       </child>
  #       <!-- ... -->
  #     </object>
  #   </child>
  # </object>
  # ```
  #
  # <picture>
  #   <source srcset="header-bar-split-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="header-bar-split.png" alt="header-bar-split">
  # </picture>
  #
  # ## CSS nodes
  #
  # ```
  # headerbar
  # ╰── windowhandle
  #     ╰── box
  #         ├── widget
  #         │   ╰── box.start
  #         │       ├── windowcontrols.start
  #         │       ╰── [other children]
  #         ├── [Title Widget]
  #         ╰── widget
  #             ╰── box.end
  #                 ├── [other children]
  #                 ╰── windowcontrols.end
  # ```
  #
  # `AdwHeaderBar`'s CSS node is called `headerbar`. It contains a `windowhandle`
  # subnode, which contains a `box` subnode, which contains two `widget` subnodes
  # at the start and end of the header bar, each of which contains a `box`
  # subnode with the `.start` and `.end` style classes respectively, as well as a
  # center node that represents the title.
  #
  # Each of the boxes contains a `windowcontrols` subnode, see
  # `Gtk#WindowControls` for details, as well as other children.
  #
  # ## Accessibility
  #
  # `AdwHeaderBar` uses the `GTK_ACCESSIBLE_ROLE_GROUP` role.
  @[GObject::GeneratedWrapper]
  class HeaderBar < Gtk::Widget
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::HeaderBarClass), class_init,
        sizeof(LibAdw::HeaderBar), instance_init, 0)
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

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, centering_policy : Adw::CenteringPolicy? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, decoration_layout : ::String? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_end_title_buttons : Bool? = nil, show_start_title_buttons : Bool? = nil, title_widget : Gtk::Widget? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
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
      if !centering_policy.nil?
        (_names.to_unsafe + _n).value = "centering-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, centering_policy)
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
      if !show_end_title_buttons.nil?
        (_names.to_unsafe + _n).value = "show-end-title-buttons".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_end_title_buttons)
        _n += 1
      end
      if !show_start_title_buttons.nil?
        (_names.to_unsafe + _n).value = "show-start-title-buttons".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_start_title_buttons)
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
      LibAdw.adw_header_bar_get_type
    end

    def centering_policy=(value : Adw::CenteringPolicy) : Adw::CenteringPolicy
      unsafe_value = value

      LibGObject.g_object_set(self, "centering-policy", unsafe_value, Pointer(Void).null)
      value
    end

    def centering_policy : Adw::CenteringPolicy
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "centering-policy", pointerof(value), Pointer(Void).null)
      Adw::CenteringPolicy.new(value)
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

    def show_end_title_buttons=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-end-title-buttons", unsafe_value, Pointer(Void).null)
      value
    end

    def show_end_title_buttons? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-end-title-buttons", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def show_start_title_buttons=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-start-title-buttons", unsafe_value, Pointer(Void).null)
      value
    end

    def show_start_title_buttons? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-start-title-buttons", pointerof(value), Pointer(Void).null)
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

    # Creates a new `AdwHeaderBar`.
    def initialize
      # adw_header_bar_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_header_bar_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the policy for aligning the center widget.
    def centering_policy : Adw::CenteringPolicy
      # adw_header_bar_get_centering_policy: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_header_bar_get_centering_policy(@pointer)

      # Return value handling

      Adw::CenteringPolicy.new(_retval)
    end

    # Gets the decoration layout for @self.
    def decoration_layout : ::String?
      # adw_header_bar_get_decoration_layout: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_header_bar_get_decoration_layout(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets whether to show title buttons at the end of @self.
    def show_end_title_buttons : Bool
      # adw_header_bar_get_show_end_title_buttons: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_header_bar_get_show_end_title_buttons(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether to show title buttons at the start of @self.
    def show_start_title_buttons : Bool
      # adw_header_bar_get_show_start_title_buttons: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_header_bar_get_show_start_title_buttons(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the title widget widget of @self.
    def title_widget : Gtk::Widget?
      # adw_header_bar_get_title_widget: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_header_bar_get_title_widget(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Adds @child to @self, packed with reference to the end of @self.
    def pack_end(child : Gtk::Widget) : Nil
      # adw_header_bar_pack_end: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_header_bar_pack_end(@pointer, child)

      # Return value handling
    end

    # Adds @child to @self, packed with reference to the start of the @self.
    def pack_start(child : Gtk::Widget) : Nil
      # adw_header_bar_pack_start: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_header_bar_pack_start(@pointer, child)

      # Return value handling
    end

    # Removes a child from @self.
    #
    # The child must have been added with `HeaderBar#pack_start`,
    # `HeaderBar#pack_end` or [property@HeaderBar:title-widget].
    def remove(child : Gtk::Widget) : Nil
      # adw_header_bar_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_header_bar_remove(@pointer, child)

      # Return value handling
    end

    # Sets the policy for aligning the center widget.
    def centering_policy=(centering_policy : Adw::CenteringPolicy) : Nil
      # adw_header_bar_set_centering_policy: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_header_bar_set_centering_policy(@pointer, centering_policy)

      # Return value handling
    end

    # Sets the decoration layout for @self.
    def decoration_layout=(layout : ::String?) : Nil
      # adw_header_bar_set_decoration_layout: (Method | Setter)
      # @layout: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      layout = if layout.nil?
                 Pointer(LibC::Char).null
               else
                 layout.to_unsafe
               end

      # C call
      LibAdw.adw_header_bar_set_decoration_layout(@pointer, layout)

      # Return value handling
    end

    # Sets whether to show title buttons at the end of @self.
    def show_end_title_buttons=(setting : Bool) : Nil
      # adw_header_bar_set_show_end_title_buttons: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_header_bar_set_show_end_title_buttons(@pointer, setting)

      # Return value handling
    end

    # Sets whether to show title buttons at the start of @self.
    def show_start_title_buttons=(setting : Bool) : Nil
      # adw_header_bar_set_show_start_title_buttons: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_header_bar_set_show_start_title_buttons(@pointer, setting)

      # Return value handling
    end

    # Sets the title widget for @self.
    def title_widget=(title_widget : Gtk::Widget?) : Nil
      # adw_header_bar_set_title_widget: (Method | Setter)
      # @title_widget: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      title_widget = if title_widget.nil?
                       Pointer(Void).null
                     else
                       title_widget.to_unsafe
                     end

      # C call
      LibAdw.adw_header_bar_set_title_widget(@pointer, title_widget)

      # Return value handling
    end
  end
end
