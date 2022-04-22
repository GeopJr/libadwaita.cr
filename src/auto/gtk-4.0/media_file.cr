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
  @[GObject::GeneratedWrapper]
  class MediaFile < MediaStream
    include Gdk::Paintable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::MediaFileClass), class_init,
        sizeof(LibGtk::MediaFile), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, duration : Int64? = nil, ended : Bool? = nil, error : GLib::Error? = nil, file : Gio::File? = nil, has_audio : Bool? = nil, has_video : Bool? = nil, input_stream : Gio::InputStream? = nil, loop : Bool? = nil, muted : Bool? = nil, playing : Bool? = nil, prepared : Bool? = nil, seekable : Bool? = nil, seeking : Bool? = nil, timestamp : Int64? = nil, volume : Float64? = nil)
      _names = uninitialized Pointer(LibC::Char)[15]
      _values = StaticArray(LibGObject::Value, 15).new(LibGObject::Value.new)
      _n = 0

      if !duration.nil?
        (_names.to_unsafe + _n).value = "duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, duration)
        _n += 1
      end
      if !ended.nil?
        (_names.to_unsafe + _n).value = "ended".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ended)
        _n += 1
      end
      if !error.nil?
        (_names.to_unsafe + _n).value = "error".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, error)
        _n += 1
      end
      if !file.nil?
        (_names.to_unsafe + _n).value = "file".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, file)
        _n += 1
      end
      if !has_audio.nil?
        (_names.to_unsafe + _n).value = "has-audio".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_audio)
        _n += 1
      end
      if !has_video.nil?
        (_names.to_unsafe + _n).value = "has-video".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_video)
        _n += 1
      end
      if !input_stream.nil?
        (_names.to_unsafe + _n).value = "input-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_stream)
        _n += 1
      end
      if !loop.nil?
        (_names.to_unsafe + _n).value = "loop".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, loop)
        _n += 1
      end
      if !muted.nil?
        (_names.to_unsafe + _n).value = "muted".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, muted)
        _n += 1
      end
      if !playing.nil?
        (_names.to_unsafe + _n).value = "playing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, playing)
        _n += 1
      end
      if !prepared.nil?
        (_names.to_unsafe + _n).value = "prepared".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, prepared)
        _n += 1
      end
      if !seekable.nil?
        (_names.to_unsafe + _n).value = "seekable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, seekable)
        _n += 1
      end
      if !seeking.nil?
        (_names.to_unsafe + _n).value = "seeking".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, seeking)
        _n += 1
      end
      if !timestamp.nil?
        (_names.to_unsafe + _n).value = "timestamp".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, timestamp)
        _n += 1
      end
      if !volume.nil?
        (_names.to_unsafe + _n).value = "volume".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, volume)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(MediaFile.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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

    # Creates a new empty media file.
    def initialize
      # gtk_media_file_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_media_file_new

      # Return value handling

      @pointer = _retval
    end

    # Creates a new media file to play @file.
    def self.new_for_file(file : Gio::File) : self
      # gtk_media_file_new_for_file: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_media_file_new_for_file(file)

      # Return value handling

      Gtk::MediaFile.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new media file for the given filename.
    #
    # This is a utility function that converts the given @filename
    # to a `GFile` and calls `Gtk::MediaFile#new_for_file`.
    def self.new_for_filename(filename : ::String) : self
      # gtk_media_file_new_for_filename: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_media_file_new_for_filename(filename)

      # Return value handling

      Gtk::MediaFile.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new media file to play @stream.
    #
    # If you want the resulting media to be seekable,
    # the stream should implement the `GSeekable` interface.
    def self.new_for_input_stream(stream : Gio::InputStream) : self
      # gtk_media_file_new_for_input_stream: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_media_file_new_for_input_stream(stream)

      # Return value handling

      Gtk::MediaFile.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new new media file for the given resource.
    #
    # This is a utility function that converts the given @resource
    # to a `GFile` and calls `Gtk::MediaFile#new_for_file`.
    def self.new_for_resource(resource_path : ::String) : self
      # gtk_media_file_new_for_resource: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_media_file_new_for_resource(resource_path)

      # Return value handling

      Gtk::MediaFile.new(_retval, GICrystal::Transfer::Full)
    end

    # Resets the media file to be empty.
    def clear : Nil
      # gtk_media_file_clear: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_file_clear(self)

      # Return value handling
    end

    # Returns the file that @self is currently playing from.
    #
    # When @self is not playing or not playing from a file,
    # %NULL is returned.
    def file : Gio::File?
      # gtk_media_file_get_file: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_media_file_get_file(self)

      # Return value handling

      Gio::File__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the stream that @self is currently playing from.
    #
    # When @self is not playing or not playing from a stream,
    # %NULL is returned.
    def input_stream : Gio::InputStream?
      # gtk_media_file_get_input_stream: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_media_file_get_input_stream(self)

      # Return value handling

      Gio::InputStream.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets the `GtkMediaFile` to play the given file.
    #
    # If any file is still playing, stop playing it.
    def file=(file : Gio::File?) : Nil
      # gtk_media_file_set_file: (Method | Setter)
      # @file: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      file = if file.nil?
               Pointer(Void).null
             else
               file.to_unsafe
             end

      # C call
      LibGtk.gtk_media_file_set_file(self, file)

      # Return value handling
    end

    # Sets the `GtkMediaFile to play the given file.
    #
    # This is a utility function that converts the given @filename
    # to a `GFile` and calls `Gtk::MediaFile#file=`.
    def filename=(filename : ::String?) : Nil
      # gtk_media_file_set_filename: (Method)
      # @filename: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      filename = if filename.nil?
                   Pointer(LibC::Char).null
                 else
                   filename.to_unsafe
                 end

      # C call
      LibGtk.gtk_media_file_set_filename(self, filename)

      # Return value handling
    end

    # Sets the `GtkMediaFile` to play the given stream.
    #
    # If anything is still playing, stop playing it.
    #
    # Full control about the @stream is assumed for the duration of
    # playback. The stream will not be closed.
    def input_stream=(stream : Gio::InputStream?) : Nil
      # gtk_media_file_set_input_stream: (Method | Setter)
      # @stream: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      stream = if stream.nil?
                 Pointer(Void).null
               else
                 stream.to_unsafe
               end

      # C call
      LibGtk.gtk_media_file_set_input_stream(self, stream)

      # Return value handling
    end

    # Sets the `GtkMediaFile to play the given resource.
    #
    # This is a utility function that converts the given @resource_path
    # to a `GFile` and calls `Gtk::MediaFile#file=`.
    def resource=(resource_path : ::String?) : Nil
      # gtk_media_file_set_resource: (Method)
      # @resource_path: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
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
