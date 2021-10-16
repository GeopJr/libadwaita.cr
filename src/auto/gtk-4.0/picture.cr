require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # The `GtkPicture` widget displays a `GdkPaintable`.
  #
  # ![An example GtkPicture](picture.png)
  #
  # Many convenience functions are provided to make pictures simple to use.
  # For example, if you want to load an image from a file, and then display
  # it, there’s a convenience function to do this:
  #
  # ```c
  # GtkWidget *widget = gtk_picture_new_for_filename ("myfile.png");
  # ```
  #
  # If the file isn’t loaded successfully, the picture will contain a
  # “broken image” icon similar to that used in many web browsers.
  # If you want to handle errors in loading the file yourself,
  # for example by displaying an error message, then load the image with
  # [ctor@Gdk.Texture.new_from_file], then create the `GtkPicture` with
  # [ctor@Gtk.Picture.new_for_paintable].
  #
  # Sometimes an application will want to avoid depending on external data
  # files, such as image files. See the documentation of `GResource` for details.
  # In this case, [ctor@Gtk.Picture.new_for_resource] and
  # [method@Gtk.Picture.set_resource] should be used.
  #
  # `GtkPicture` displays an image at its natural size. See [class@Gtk.Image]
  # if you want to display a fixed-size image, such as an icon.
  #
  # ## Sizing the paintable
  #
  # You can influence how the paintable is displayed inside the `GtkPicture`.
  # By turning off [property@Gtk.Picture:keep-aspect-ratio] you can allow the
  # paintable to get stretched. [property@Gtk.Picture:can-shrink] can be unset
  # to make sure that paintables are never made smaller than their ideal size -
  # but be careful if you do not know the size of the paintable in use (like
  # when displaying user-loaded images). This can easily cause the picture to
  # grow larger than the screen. And [property@GtkWidget:halign] and
  # [property@GtkWidget:valign] can be used to make sure the paintable doesn't
  # fill all available space but is instead displayed at its original size.
  #
  # ## CSS nodes
  #
  # `GtkPicture` has a single CSS node with the name `picture`.
  #
  # ## Accessibility
  #
  # `GtkPicture` uses the `GTK_ACCESSIBLE_ROLE_IMG` role.
  class Picture < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, alternative_text : ::String? = nil, can_focus : Bool? = nil, can_shrink : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, file : Gio::File? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, keep_aspect_ratio : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, paintable : Gdk::Paintable? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[40]
      _values = StaticArray(LibGObject::Value, 40).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if alternative_text
        (_names.to_unsafe + _n).value = "alternative-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, alternative_text)
        _n += 1
      end
      if can_focus
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if can_shrink
        (_names.to_unsafe + _n).value = "can-shrink".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_shrink)
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
      if keep_aspect_ratio
        (_names.to_unsafe + _n).value = "keep-aspect-ratio".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, keep_aspect_ratio)
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

      @pointer = LibGObject.g_object_new_with_properties(Picture.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_picture_get_type
    end

    def alternative_text=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "alternative-text", unsafe_value, Pointer(Void).null)
      value
    end

    def alternative_text : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "alternative-text", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def can_shrink=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "can-shrink", unsafe_value, Pointer(Void).null)
      value
    end

    def can_shrink? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "can-shrink", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def file=(value : Gio::File?) : Gio::File?
      unsafe_value = value

      LibGObject.g_object_set(self, "file", unsafe_value, Pointer(Void).null)
      value
    end

    def file : Gio::File?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "file", pointerof(value), Pointer(Void).null)
      Gio::File__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def keep_aspect_ratio=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "keep-aspect-ratio", unsafe_value, Pointer(Void).null)
      value
    end

    def keep_aspect_ratio? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "keep-aspect-ratio", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    def initialize
      # gtk_picture_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_picture_new
      @pointer = _retval
    end

    def self.new_for_file(file : Gio::File?) : Gtk::Widget
      # gtk_picture_new_for_file: (Constructor)
      # @file: (nullable)
      # Returns: (transfer none)

      file = if file.nil?
               Pointer(Void).null
             else
               file.to_unsafe
             end

      _retval = LibGtk.gtk_picture_new_for_file(file)
      Gtk::Picture.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_filename(filename : ::String?) : Gtk::Widget
      # gtk_picture_new_for_filename: (Constructor)
      # @filename: (nullable)
      # Returns: (transfer none)

      filename = if filename.nil?
                   Pointer(LibC::Char).null
                 else
                   filename.to_unsafe
                 end

      _retval = LibGtk.gtk_picture_new_for_filename(filename)
      Gtk::Picture.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_paintable(paintable : Gdk::Paintable?) : Gtk::Widget
      # gtk_picture_new_for_paintable: (Constructor)
      # @paintable: (nullable)
      # Returns: (transfer none)

      paintable = if paintable.nil?
                    Pointer(Void).null
                  else
                    paintable.to_unsafe
                  end

      _retval = LibGtk.gtk_picture_new_for_paintable(paintable)
      Gtk::Picture.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_pixbuf(pixbuf : GdkPixbuf::Pixbuf?) : Gtk::Widget
      # gtk_picture_new_for_pixbuf: (Constructor)
      # @pixbuf: (nullable)
      # Returns: (transfer none)

      pixbuf = if pixbuf.nil?
                 Pointer(Void).null
               else
                 pixbuf.to_unsafe
               end

      _retval = LibGtk.gtk_picture_new_for_pixbuf(pixbuf)
      Gtk::Picture.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_resource(resource_path : ::String?) : Gtk::Widget
      # gtk_picture_new_for_resource: (Constructor)
      # @resource_path: (nullable)
      # Returns: (transfer none)

      resource_path = if resource_path.nil?
                        Pointer(LibC::Char).null
                      else
                        resource_path.to_unsafe
                      end

      _retval = LibGtk.gtk_picture_new_for_resource(resource_path)
      Gtk::Picture.new(_retval, GICrystal::Transfer::Full)
    end

    def alternative_text : ::String?
      # gtk_picture_get_alternative_text: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_picture_get_alternative_text(self)
      ::String.new(_retval) unless _retval.null?
    end

    def can_shrink : Bool
      # gtk_picture_get_can_shrink: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_picture_get_can_shrink(self)
      GICrystal.to_bool(_retval)
    end

    def file : Gio::File?
      # gtk_picture_get_file: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_picture_get_file(self)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def keep_aspect_ratio : Bool
      # gtk_picture_get_keep_aspect_ratio: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_picture_get_keep_aspect_ratio(self)
      GICrystal.to_bool(_retval)
    end

    def paintable : Gdk::Paintable?
      # gtk_picture_get_paintable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_picture_get_paintable(self)
      Gdk::Paintable__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def alternative_text=(alternative_text : ::String?) : Nil
      # gtk_picture_set_alternative_text: (Method)
      # @alternative_text: (nullable)
      # Returns: (transfer none)

      alternative_text = if alternative_text.nil?
                           Pointer(LibC::Char).null
                         else
                           alternative_text.to_unsafe
                         end

      LibGtk.gtk_picture_set_alternative_text(self, alternative_text)
    end

    def can_shrink=(can_shrink : Bool) : Nil
      # gtk_picture_set_can_shrink: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_picture_set_can_shrink(self, can_shrink)
    end

    def file=(file : Gio::File?) : Nil
      # gtk_picture_set_file: (Method)
      # @file: (nullable)
      # Returns: (transfer none)

      file = if file.nil?
               Pointer(Void).null
             else
               file.to_unsafe
             end

      LibGtk.gtk_picture_set_file(self, file)
    end

    def filename=(filename : ::String?) : Nil
      # gtk_picture_set_filename: (Method)
      # @filename: (nullable)
      # Returns: (transfer none)

      filename = if filename.nil?
                   Pointer(LibC::Char).null
                 else
                   filename.to_unsafe
                 end

      LibGtk.gtk_picture_set_filename(self, filename)
    end

    def keep_aspect_ratio=(keep_aspect_ratio : Bool) : Nil
      # gtk_picture_set_keep_aspect_ratio: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_picture_set_keep_aspect_ratio(self, keep_aspect_ratio)
    end

    def paintable=(paintable : Gdk::Paintable?) : Nil
      # gtk_picture_set_paintable: (Method)
      # @paintable: (nullable)
      # Returns: (transfer none)

      paintable = if paintable.nil?
                    Pointer(Void).null
                  else
                    paintable.to_unsafe
                  end

      LibGtk.gtk_picture_set_paintable(self, paintable)
    end

    def pixbuf=(pixbuf : GdkPixbuf::Pixbuf?) : Nil
      # gtk_picture_set_pixbuf: (Method)
      # @pixbuf: (nullable)
      # Returns: (transfer none)

      pixbuf = if pixbuf.nil?
                 Pointer(Void).null
               else
                 pixbuf.to_unsafe
               end

      LibGtk.gtk_picture_set_pixbuf(self, pixbuf)
    end

    def resource=(resource_path : ::String?) : Nil
      # gtk_picture_set_resource: (Method)
      # @resource_path: (nullable)
      # Returns: (transfer none)

      resource_path = if resource_path.nil?
                        Pointer(LibC::Char).null
                      else
                        resource_path.to_unsafe
                      end

      LibGtk.gtk_picture_set_resource(self, resource_path)
    end
  end
end
