require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # The `GtkImage` widget displays an image.
  #
  # ![An example GtkImage](image.png)
  #
  # Various kinds of object can be displayed as an image; most typically,
  # you would load a `GdkTexture` from a file, using the convenience function
  # [ctor@Gtk.Image.new_from_file], for instance:
  #
  # ```c
  # GtkWidget *image = gtk_image_new_from_file ("myfile.png");
  # ```
  #
  # If the file isn’t loaded successfully, the image will contain a
  # “broken image” icon similar to that used in many web browsers.
  #
  # If you want to handle errors in loading the file yourself,
  # for example by displaying an error message, then load the image with
  # [ctor@Gdk.Texture.new_from_file], then create the `GtkImage` with
  # [ctor@Gtk.Image.new_from_paintable].
  #
  # Sometimes an application will want to avoid depending on external data
  # files, such as image files. See the documentation of `GResource` inside
  # GIO, for details. In this case, [property@Gtk.Image:resource],
  # [ctor@Gtk.Image.new_from_resource], and [method@Gtk.Image.set_from_resource]
  # should be used.
  #
  # `GtkImage` displays its image as an icon, with a size that is determined
  # by the application. See [class@Gtk.Picture] if you want to show an image
  # at is actual size.
  #
  # ## CSS nodes
  #
  # `GtkImage` has a single CSS node with the name `image`. The style classes
  # `.normal-icons` or `.large-icons` may appear, depending on the
  # [property@Gtk.Image:icon-size] property.
  #
  # ## Accessibility
  #
  # `GtkImage` uses the `GTK_ACCESSIBLE_ROLE_IMG` role.
  class Image < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, file : ::String? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, gicon : Gio::Icon? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, icon_name : ::String? = nil, icon_size : Gtk::IconSize? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, paintable : Gdk::Paintable? = nil, parent : Gtk::Widget? = nil, pixel_size : Int32? = nil, receives_default : Bool? = nil, resource : ::String? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, storage_type : Gtk::ImageType? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_fallback : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
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
      if file
        (_names.to_unsafe + _n).value = "file".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, file)
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
      if gicon
        (_names.to_unsafe + _n).value = "gicon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gicon)
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
      if icon_name
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
        _n += 1
      end
      if icon_size
        (_names.to_unsafe + _n).value = "icon-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_size)
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
      if paintable
        (_names.to_unsafe + _n).value = "paintable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, paintable)
        _n += 1
      end
      if parent
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if pixel_size
        (_names.to_unsafe + _n).value = "pixel-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixel_size)
        _n += 1
      end
      if receives_default
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if resource
        (_names.to_unsafe + _n).value = "resource".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resource)
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
      if storage_type
        (_names.to_unsafe + _n).value = "storage-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, storage_type)
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
      if use_fallback
        (_names.to_unsafe + _n).value = "use-fallback".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_fallback)
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

      @pointer = LibGObject.g_object_new_with_properties(Image.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_image_get_type
    end

    def file=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "file", unsafe_value, Pointer(Void).null)
      value
    end

    def file : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "file", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def gicon=(value : Gio::Icon?) : Gio::Icon?
      unsafe_value = value

      LibGObject.g_object_set(self, "gicon", unsafe_value, Pointer(Void).null)
      value
    end

    def gicon : Gio::Icon?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "gicon", pointerof(value), Pointer(Void).null)
      Gio::Icon__Impl.new(value, GICrystal::Transfer::None) unless value.null?
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

    def icon_size=(value : Gtk::IconSize) : Gtk::IconSize
      unsafe_value = value

      LibGObject.g_object_set(self, "icon-size", unsafe_value, Pointer(Void).null)
      value
    end

    def icon_size : Gtk::IconSize
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "icon-size", pointerof(value), Pointer(Void).null)
      Gtk::IconSize.from_value(value)
    end

    def paintable=(value : Gdk::Paintable?) : Gdk::Paintable?
      unsafe_value = value

      LibGObject.g_object_set(self, "paintable", unsafe_value, Pointer(Void).null)
      value
    end

    def paintable : Gdk::Paintable?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "paintable", pointerof(value), Pointer(Void).null)
      Gdk::Paintable__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def pixel_size=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "pixel-size", unsafe_value, Pointer(Void).null)
      value
    end

    def pixel_size : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "pixel-size", pointerof(value), Pointer(Void).null)
      value
    end

    def resource=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "resource", unsafe_value, Pointer(Void).null)
      value
    end

    def resource : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "resource", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def storage_type : Gtk::ImageType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "storage-type", pointerof(value), Pointer(Void).null)
      Gtk::ImageType.from_value(value)
    end

    def use_fallback=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-fallback", unsafe_value, Pointer(Void).null)
      value
    end

    def use_fallback? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-fallback", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def initialize
      # gtk_image_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_image_new
      @pointer = _retval
    end

    def self.new_from_file(filename : ::String) : Gtk::Widget
      # gtk_image_new_from_file: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_image_new_from_file(filename)
      Gtk::Image.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_gicon(icon : Gio::Icon) : Gtk::Widget
      # gtk_image_new_from_gicon: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_image_new_from_gicon(icon)
      Gtk::Image.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_icon_name(icon_name : ::String?) : Gtk::Widget
      # gtk_image_new_from_icon_name: (Constructor)
      # @icon_name: (nullable)
      # Returns: (transfer none)

      icon_name = if icon_name.nil?
                    Pointer(LibC::Char).null
                  else
                    icon_name.to_unsafe
                  end

      _retval = LibGtk.gtk_image_new_from_icon_name(icon_name)
      Gtk::Image.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_paintable(paintable : Gdk::Paintable?) : Gtk::Widget
      # gtk_image_new_from_paintable: (Constructor)
      # @paintable: (nullable)
      # Returns: (transfer none)

      paintable = if paintable.nil?
                    Pointer(Void).null
                  else
                    paintable.to_unsafe
                  end

      _retval = LibGtk.gtk_image_new_from_paintable(paintable)
      Gtk::Image.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_pixbuf(pixbuf : GdkPixbuf::Pixbuf?) : Gtk::Widget
      # gtk_image_new_from_pixbuf: (Constructor)
      # @pixbuf: (nullable)
      # Returns: (transfer none)

      pixbuf = if pixbuf.nil?
                 Pointer(Void).null
               else
                 pixbuf.to_unsafe
               end

      _retval = LibGtk.gtk_image_new_from_pixbuf(pixbuf)
      Gtk::Image.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_resource(resource_path : ::String) : Gtk::Widget
      # gtk_image_new_from_resource: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_image_new_from_resource(resource_path)
      Gtk::Image.new(_retval, GICrystal::Transfer::Full)
    end

    def clear : Nil
      # gtk_image_clear: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_image_clear(self)
    end

    def gicon : Gio::Icon?
      # gtk_image_get_gicon: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_image_get_gicon(self)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def icon_name : ::String?
      # gtk_image_get_icon_name: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_image_get_icon_name(self)
      ::String.new(_retval) unless _retval.null?
    end

    def icon_size : Gtk::IconSize
      # gtk_image_get_icon_size: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_image_get_icon_size(self)
      Gtk::IconSize.from_value(_retval)
    end

    def paintable : Gdk::Paintable?
      # gtk_image_get_paintable: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_image_get_paintable(self)
      Gdk::Paintable__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def pixel_size : Int32
      # gtk_image_get_pixel_size: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_image_get_pixel_size(self)
      _retval
    end

    def storage_type : Gtk::ImageType
      # gtk_image_get_storage_type: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_image_get_storage_type(self)
      Gtk::ImageType.from_value(_retval)
    end

    def from_file=(filename : ::String?) : Nil
      # gtk_image_set_from_file: (Method)
      # @filename: (nullable)
      # Returns: (transfer none)

      filename = if filename.nil?
                   Pointer(LibC::Char).null
                 else
                   filename.to_unsafe
                 end

      LibGtk.gtk_image_set_from_file(self, filename)
    end

    def from_gicon=(icon : Gio::Icon) : Nil
      # gtk_image_set_from_gicon: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_image_set_from_gicon(self, icon)
    end

    def from_icon_name=(icon_name : ::String?) : Nil
      # gtk_image_set_from_icon_name: (Method)
      # @icon_name: (nullable)
      # Returns: (transfer none)

      icon_name = if icon_name.nil?
                    Pointer(LibC::Char).null
                  else
                    icon_name.to_unsafe
                  end

      LibGtk.gtk_image_set_from_icon_name(self, icon_name)
    end

    def from_paintable=(paintable : Gdk::Paintable?) : Nil
      # gtk_image_set_from_paintable: (Method)
      # @paintable: (nullable)
      # Returns: (transfer none)

      paintable = if paintable.nil?
                    Pointer(Void).null
                  else
                    paintable.to_unsafe
                  end

      LibGtk.gtk_image_set_from_paintable(self, paintable)
    end

    def from_pixbuf=(pixbuf : GdkPixbuf::Pixbuf?) : Nil
      # gtk_image_set_from_pixbuf: (Method)
      # @pixbuf: (nullable)
      # Returns: (transfer none)

      pixbuf = if pixbuf.nil?
                 Pointer(Void).null
               else
                 pixbuf.to_unsafe
               end

      LibGtk.gtk_image_set_from_pixbuf(self, pixbuf)
    end

    def from_resource=(resource_path : ::String?) : Nil
      # gtk_image_set_from_resource: (Method)
      # @resource_path: (nullable)
      # Returns: (transfer none)

      resource_path = if resource_path.nil?
                        Pointer(LibC::Char).null
                      else
                        resource_path.to_unsafe
                      end

      LibGtk.gtk_image_set_from_resource(self, resource_path)
    end

    def icon_size=(icon_size : Gtk::IconSize) : Nil
      # gtk_image_set_icon_size: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_image_set_icon_size(self, icon_size)
    end

    def pixel_size=(pixel_size : Int32) : Nil
      # gtk_image_set_pixel_size: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_image_set_pixel_size(self, pixel_size)
    end
  end
end
