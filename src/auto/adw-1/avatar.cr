require "../gtk-4.0/widget"
require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

module Adw
  # A widget displaying an image, with a generated fallback.
  #
  # <picture>
  #   <source srcset="avatar-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="avatar.png" alt="avatar">
  # </picture>
  #
  # `AdwAvatar` is a widget that shows a round avatar.
  #
  # `AdwAvatar` generates an avatar with the initials of  the
  # `Avatar#text` on top of a colored background.
  #
  # The color is picked based on the hash of the `Avatar#text`.
  #
  # If [property@Avatar:show-initials] is set to `FALSE`,
  # [property@Avatar:icon-name] or `avatar-default-symbolic` is shown instead of
  # the initials.
  #
  # Use [property@Avatar:custom-image] to set a custom image.
  #
  # ## CSS nodes
  #
  # `AdwAvatar` has a single CSS node with name `avatar`.
  @[GObject::GeneratedWrapper]
  class Avatar < Gtk::Widget
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::AvatarClass), class_init,
        sizeof(LibAdw::Avatar), instance_init, 0)
    end

    GICrystal.define_new_method(Avatar, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Avatar`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, custom_image : Gdk::Paintable? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, icon_name : ::String? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_initials : Bool? = nil, size : Int32? = nil, text : ::String? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
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
      if !custom_image.nil?
        (_names.to_unsafe + _n).value = "custom-image".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, custom_image)
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
      if !icon_name.nil?
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
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
      if !show_initials.nil?
        (_names.to_unsafe + _n).value = "show-initials".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_initials)
        _n += 1
      end
      if !size.nil?
        (_names.to_unsafe + _n).value = "size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, size)
        _n += 1
      end
      if !text.nil?
        (_names.to_unsafe + _n).value = "text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text)
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

      @pointer = LibGObject.g_object_new_with_properties(Avatar.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_avatar_get_type
    end

    def custom_image=(value : Gdk::Paintable?) : Gdk::Paintable?
      unsafe_value = value

      LibGObject.g_object_set(self, "custom-image", unsafe_value, Pointer(Void).null)
      value
    end

    def custom_image : Gdk::Paintable?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "custom-image", pointerof(value), Pointer(Void).null)
      Gdk::AbstractPaintable.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def icon_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "icon-name", unsafe_value, Pointer(Void).null)
      value
    end

    def icon_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "icon-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def show_initials=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-initials", unsafe_value, Pointer(Void).null)
      value
    end

    def show_initials? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-initials", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def size=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "size", unsafe_value, Pointer(Void).null)
      value
    end

    def size : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "size", pointerof(value), Pointer(Void).null)
      value
    end

    def text=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "text", unsafe_value, Pointer(Void).null)
      value
    end

    def text : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "text", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a new `AdwAvatar`.
    def self.new(size : Int32, text : ::String?, show_initials : Bool) : self
      # adw_avatar_new: (Constructor)
      # @text: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      text = if text.nil?
               Pointer(LibC::Char).null
             else
               text.to_unsafe
             end

      # C call
      _retval = LibAdw.adw_avatar_new(size, text, show_initials)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Adw::Avatar.new(_retval, GICrystal::Transfer::Full)
    end

    # Renders @self into a `Gdk#Texture` at @scale_factor.
    #
    # This can be used to export the fallback avatar.
    def draw_to_texture(scale_factor : Int32) : Gdk::Texture
      # adw_avatar_draw_to_texture: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibAdw.adw_avatar_draw_to_texture(@pointer, scale_factor)

      # Return value handling

      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the custom image paintable.
    def custom_image : Gdk::Paintable?
      # adw_avatar_get_custom_image: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_avatar_get_custom_image(@pointer)

      # Return value handling

      Gdk::AbstractPaintable.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the name of an icon to use as a fallback.
    def icon_name : ::String?
      # adw_avatar_get_icon_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_avatar_get_icon_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets whether initials are used instead of an icon on the fallback avatar.
    def show_initials : Bool
      # adw_avatar_get_show_initials: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_avatar_get_show_initials(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the size of the avatar.
    def size : Int32
      # adw_avatar_get_size: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_avatar_get_size(@pointer)

      # Return value handling

      _retval
    end

    # Gets the text used to generate the fallback initials and color.
    def text : ::String?
      # adw_avatar_get_text: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_avatar_get_text(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Sets the custom image paintable.
    def custom_image=(custom_image : Gdk::Paintable?) : Nil
      # adw_avatar_set_custom_image: (Method | Setter)
      # @custom_image: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      custom_image = if custom_image.nil?
                       Pointer(Void).null
                     else
                       custom_image.to_unsafe
                     end

      # C call
      LibAdw.adw_avatar_set_custom_image(@pointer, custom_image)

      # Return value handling
    end

    # Sets the name of an icon to use as a fallback.
    #
    # If no name is set, `avatar-default-symbolic` will be used.
    def icon_name=(icon_name : ::String?) : Nil
      # adw_avatar_set_icon_name: (Method | Setter)
      # @icon_name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      icon_name = if icon_name.nil?
                    Pointer(LibC::Char).null
                  else
                    icon_name.to_unsafe
                  end

      # C call
      LibAdw.adw_avatar_set_icon_name(@pointer, icon_name)

      # Return value handling
    end

    # Sets whether to use initials instead of an icon on the fallback avatar.
    def show_initials=(show_initials : Bool) : Nil
      # adw_avatar_set_show_initials: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_avatar_set_show_initials(@pointer, show_initials)

      # Return value handling
    end

    # Sets the size of the avatar.
    def size=(size : Int32) : Nil
      # adw_avatar_set_size: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_avatar_set_size(@pointer, size)

      # Return value handling
    end

    # Sets the text used to generate the fallback initials and color.
    def text=(text : ::String?) : Nil
      # adw_avatar_set_text: (Method | Setter)
      # @text: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      text = if text.nil?
               Pointer(LibC::Char).null
             else
               text.to_unsafe
             end

      # C call
      LibAdw.adw_avatar_set_text(@pointer, text)

      # Return value handling
    end
  end
end
