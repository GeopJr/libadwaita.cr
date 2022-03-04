require "./media_stream"
require "../gdk-4.0/paintable"

module Gtk
  # `GtkMediaFile` implements `GtkMediaStream` for files.
  #
  # This provides a simple way to play back video files with GTK.
  #
  # GTK provides a GIO extension point for `GtkMediaFile` implementations
  # to allow for external implementations using various media frameworks.
  #
  # GTK itself includes implementations using GStreamer and ffmpeg.
  class MediaFile < MediaStream
    include Gdk::Paintable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, duration : Int64? = nil, ended : Bool? = nil, error : GLib::Error? = nil, file : Gio::File? = nil, has_audio : Bool? = nil, has_video : Bool? = nil, input_stream : Gio::InputStream? = nil, loop : Bool? = nil, muted : Bool? = nil, playing : Bool? = nil, prepared : Bool? = nil, seekable : Bool? = nil, seeking : Bool? = nil, timestamp : Int64? = nil, volume : Float64? = nil)
      _names = uninitialized Pointer(LibC::Char)[15]
      _values = StaticArray(LibGObject::Value, 15).new(LibGObject::Value.new)
      _n = 0

      if duration
        (_names.to_unsafe + _n).value = "duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, duration)
        _n += 1
      end
      if ended
        (_names.to_unsafe + _n).value = "ended".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ended)
        _n += 1
      end
      if error
        (_names.to_unsafe + _n).value = "error".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, error)
        _n += 1
      end
      if file
        (_names.to_unsafe + _n).value = "file".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, file)
        _n += 1
      end
      if has_audio
        (_names.to_unsafe + _n).value = "has-audio".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_audio)
        _n += 1
      end
      if has_video
        (_names.to_unsafe + _n).value = "has-video".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_video)
        _n += 1
      end
      if input_stream
        (_names.to_unsafe + _n).value = "input-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_stream)
        _n += 1
      end
      if loop
        (_names.to_unsafe + _n).value = "loop".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, loop)
        _n += 1
      end
      if muted
        (_names.to_unsafe + _n).value = "muted".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, muted)
        _n += 1
      end
      if playing
        (_names.to_unsafe + _n).value = "playing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, playing)
        _n += 1
      end
      if prepared
        (_names.to_unsafe + _n).value = "prepared".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, prepared)
        _n += 1
      end
      if seekable
        (_names.to_unsafe + _n).value = "seekable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, seekable)
        _n += 1
      end
      if seeking
        (_names.to_unsafe + _n).value = "seeking".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, seeking)
        _n += 1
      end
      if timestamp
        (_names.to_unsafe + _n).value = "timestamp".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, timestamp)
        _n += 1
      end
      if volume
        (_names.to_unsafe + _n).value = "volume".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, volume)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(MediaFile.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_media_file_get_type
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

    def input_stream=(value : Gio::InputStream?) : Gio::InputStream?
      unsafe_value = value

      LibGObject.g_object_set(self, "input-stream", unsafe_value, Pointer(Void).null)
      value
    end

    def input_stream : Gio::InputStream?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "input-stream", pointerof(value), Pointer(Void).null)
      Gio::InputStream.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize
      # gtk_media_file_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_file_new

      # Return value handling
      @pointer = _retval
    end

    def self.new_for_file(file : Gio::File) : self
      # gtk_media_file_new_for_file: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_file_new_for_file(file)

      # Return value handling
      Gtk::MediaFile.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_filename(filename : ::String) : self
      # gtk_media_file_new_for_filename: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_file_new_for_filename(filename)

      # Return value handling
      Gtk::MediaFile.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_input_stream(stream : Gio::InputStream) : self
      # gtk_media_file_new_for_input_stream: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_file_new_for_input_stream(stream)

      # Return value handling
      Gtk::MediaFile.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_resource(resource_path : ::String) : self
      # gtk_media_file_new_for_resource: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_file_new_for_resource(resource_path)

      # Return value handling
      Gtk::MediaFile.new(_retval, GICrystal::Transfer::Full)
    end

    def clear : Nil
      # gtk_media_file_clear: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_file_clear(self)

      # Return value handling
    end

    def file : Gio::File?
      # gtk_media_file_get_file: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_file_get_file(self)

      # Return value handling
      Gio::File__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def input_stream : Gio::InputStream?
      # gtk_media_file_get_input_stream: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_file_get_input_stream(self)

      # Return value handling
      Gio::InputStream.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def file=(file : Gio::File?) : Nil
      # gtk_media_file_set_file: (Method | Setter)
      # @file: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      file = if file.nil?
               Pointer(Void).null
             else
               file.to_unsafe
             end

      # C call
      LibGtk.gtk_media_file_set_file(self, file)

      # Return value handling
    end

    def filename=(filename : ::String?) : Nil
      # gtk_media_file_set_filename: (Method)
      # @filename: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      filename = if filename.nil?
                   Pointer(LibC::Char).null
                 else
                   filename.to_unsafe
                 end

      # C call
      LibGtk.gtk_media_file_set_filename(self, filename)

      # Return value handling
    end

    def input_stream=(stream : Gio::InputStream?) : Nil
      # gtk_media_file_set_input_stream: (Method | Setter)
      # @stream: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      stream = if stream.nil?
                 Pointer(Void).null
               else
                 stream.to_unsafe
               end

      # C call
      LibGtk.gtk_media_file_set_input_stream(self, stream)

      # Return value handling
    end

    def resource=(resource_path : ::String?) : Nil
      # gtk_media_file_set_resource: (Method)
      # @resource_path: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      resource_path = if resource_path.nil?
                        Pointer(LibC::Char).null
                      else
                        resource_path.to_unsafe
                      end

      # C call
      LibGtk.gtk_media_file_set_resource(self, resource_path)

      # Return value handling
    end
  end
end
