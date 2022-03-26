require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkVideo` is a widget to show a `GtkMediaStream` with media controls.
  #
  # ![An example GtkVideo](video.png)
  #
  # The controls are available separately as [class@Gtk.MediaControls].
  # If you just want to display a video without controls, you can treat it
  # like any other paintable and for example put it into a [class@Gtk.Picture].
  #
  # `GtkVideo` aims to cover use cases such as previews, embedded animations,
  # etc. It supports autoplay, looping, and simple media controls. It does
  # not have support for video overlays, multichannel audio, device
  # selection, or input. If you are writing a full-fledged video player,
  # you may want to use the [iface@Gdk.Paintable] API and a media framework
  # such as Gstreamer directly.
  class Video < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, autoplay : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, file : Gio::File? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, loop : Bool? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, media_stream : Gtk::MediaStream? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[39]
      _values = StaticArray(LibGObject::Value, 39).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if autoplay
        (_names.to_unsafe + _n).value = "autoplay".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, autoplay)
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
      if loop
        (_names.to_unsafe + _n).value = "loop".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, loop)
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
      if media_stream
        (_names.to_unsafe + _n).value = "media-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, media_stream)
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

      @pointer = LibGObject.g_object_new_with_properties(Video.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_video_get_type
    end

    def autoplay=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "autoplay", unsafe_value, Pointer(Void).null)
      value
    end

    def autoplay? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "autoplay", pointerof(value), Pointer(Void).null)
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

    def loop=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "loop", unsafe_value, Pointer(Void).null)
      value
    end

    def loop? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "loop", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def media_stream=(value : Gtk::MediaStream?) : Gtk::MediaStream?
      unsafe_value = value

      LibGObject.g_object_set(self, "media-stream", unsafe_value, Pointer(Void).null)
      value
    end

    def media_stream : Gtk::MediaStream?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "media-stream", pointerof(value), Pointer(Void).null)
      Gtk::MediaStream.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize
      # gtk_video_new: (Constructor)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_video_new

      # Return value handling
      @pointer = _retval
      LibGObject.g_object_ref(_retval)
    end

    def self.new_for_file(file : Gio::File?) : self
      # gtk_video_new_for_file: (Constructor)
      # @file: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      file = if file.nil?
               Pointer(Void).null
             else
               file.to_unsafe
             end

      # C call
      _retval = LibGtk.gtk_video_new_for_file(file)

      # Return value handling
      Gtk::Video.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_filename(filename : ::String?) : self
      # gtk_video_new_for_filename: (Constructor)
      # @filename: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      filename = if filename.nil?
                   Pointer(LibC::Char).null
                 else
                   filename.to_unsafe
                 end

      # C call
      _retval = LibGtk.gtk_video_new_for_filename(filename)

      # Return value handling
      Gtk::Video.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_media_stream(stream : Gtk::MediaStream?) : self
      # gtk_video_new_for_media_stream: (Constructor)
      # @stream: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      stream = if stream.nil?
                 Pointer(Void).null
               else
                 stream.to_unsafe
               end

      # C call
      _retval = LibGtk.gtk_video_new_for_media_stream(stream)

      # Return value handling
      Gtk::Video.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_resource(resource_path : ::String?) : self
      # gtk_video_new_for_resource: (Constructor)
      # @resource_path: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      resource_path = if resource_path.nil?
                        Pointer(LibC::Char).null
                      else
                        resource_path.to_unsafe
                      end

      # C call
      _retval = LibGtk.gtk_video_new_for_resource(resource_path)

      # Return value handling
      Gtk::Video.new(_retval, GICrystal::Transfer::Full)
    end

    def autoplay : Bool
      # gtk_video_get_autoplay: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_video_get_autoplay(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def file : Gio::File?
      # gtk_video_get_file: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_video_get_file(self)

      # Return value handling
      Gio::File__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def loop : Bool
      # gtk_video_get_loop: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_video_get_loop(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def media_stream : Gtk::MediaStream?
      # gtk_video_get_media_stream: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_video_get_media_stream(self)

      # Return value handling
      Gtk::MediaStream.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def autoplay=(autoplay : Bool) : Nil
      # gtk_video_set_autoplay: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_video_set_autoplay(self, autoplay)

      # Return value handling
    end

    def file=(file : Gio::File?) : Nil
      # gtk_video_set_file: (Method | Setter)
      # @file: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      file = if file.nil?
               Pointer(Void).null
             else
               file.to_unsafe
             end

      # C call
      LibGtk.gtk_video_set_file(self, file)

      # Return value handling
    end

    def filename=(filename : ::String?) : Nil
      # gtk_video_set_filename: (Method)
      # @filename: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      filename = if filename.nil?
                   Pointer(LibC::Char).null
                 else
                   filename.to_unsafe
                 end

      # C call
      LibGtk.gtk_video_set_filename(self, filename)

      # Return value handling
    end

    def loop=(loop : Bool) : Nil
      # gtk_video_set_loop: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_video_set_loop(self, loop)

      # Return value handling
    end

    def media_stream=(stream : Gtk::MediaStream?) : Nil
      # gtk_video_set_media_stream: (Method | Setter)
      # @stream: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      stream = if stream.nil?
                 Pointer(Void).null
               else
                 stream.to_unsafe
               end

      # C call
      LibGtk.gtk_video_set_media_stream(self, stream)

      # Return value handling
    end

    def resource=(resource_path : ::String?) : Nil
      # gtk_video_set_resource: (Method)
      # @resource_path: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      resource_path = if resource_path.nil?
                        Pointer(LibC::Char).null
                      else
                        resource_path.to_unsafe
                      end

      # C call
      LibGtk.gtk_video_set_resource(self, resource_path)

      # Return value handling
    end
  end
end