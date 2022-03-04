require "../g_object-2.0/object"
require "../gdk-4.0/paintable"

module Gtk
  # `GtkMediaStream` is the integration point for media playback inside GTK.
  #
  # GTK provides an implementation of the `GtkMediaStream` interface that
  # is called [class@Gtk.MediaFile].
  #
  # Apart from application-facing API for stream playback, `GtkMediaStream`
  # has a number of APIs that are only useful for implementations and should
  # not be used in applications:
  # [method@Gtk.MediaStream.prepared],
  # [method@Gtk.MediaStream.unprepared],
  # [method@Gtk.MediaStream.update],
  # [method@Gtk.MediaStream.ended],
  # [method@Gtk.MediaStream.seek_success],
  # [method@Gtk.MediaStream.seek_failed],
  # [method@Gtk.MediaStream.gerror],
  # [method@Gtk.MediaStream.error],
  # [method@Gtk.MediaStream.error_valist].
  class MediaStream < GObject::Object
    include Gdk::Paintable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, duration : Int64? = nil, ended : Bool? = nil, error : GLib::Error? = nil, has_audio : Bool? = nil, has_video : Bool? = nil, loop : Bool? = nil, muted : Bool? = nil, playing : Bool? = nil, prepared : Bool? = nil, seekable : Bool? = nil, seeking : Bool? = nil, timestamp : Int64? = nil, volume : Float64? = nil)
      _names = uninitialized Pointer(LibC::Char)[13]
      _values = StaticArray(LibGObject::Value, 13).new(LibGObject::Value.new)
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

      @pointer = LibGObject.g_object_new_with_properties(MediaStream.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_media_stream_get_type
    end

    def duration : Int64
      # Returns: None

      value = uninitialized Int64
      LibGObject.g_object_get(self, "duration", pointerof(value), Pointer(Void).null)
      value
    end

    def ended? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "ended", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def error : GLib::Error
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "error", pointerof(value), Pointer(Void).null)
      GLib::Error.new(value, GICrystal::Transfer::None)
    end

    def has_audio? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-audio", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def has_video? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-video", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    def muted=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "muted", unsafe_value, Pointer(Void).null)
      value
    end

    def muted? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "muted", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def playing=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "playing", unsafe_value, Pointer(Void).null)
      value
    end

    def playing? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "playing", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def prepared=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "prepared", unsafe_value, Pointer(Void).null)
      value
    end

    def prepared? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "prepared", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def seekable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "seekable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def seeking? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "seeking", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def timestamp : Int64
      # Returns: None

      value = uninitialized Int64
      LibGObject.g_object_get(self, "timestamp", pointerof(value), Pointer(Void).null)
      value
    end

    def volume=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "volume", unsafe_value, Pointer(Void).null)
      value
    end

    def volume : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "volume", pointerof(value), Pointer(Void).null)
      value
    end

    def gerror(error : GLib::Error) : Nil
      # gtk_media_stream_gerror: (Method)
      # @error: (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_gerror(self, error)

      # Return value handling
    end

    def duration : Int64
      # gtk_media_stream_get_duration: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_stream_get_duration(self)

      # Return value handling
      _retval
    end

    def ended : Bool
      # gtk_media_stream_get_ended: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_stream_get_ended(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def error : GLib::Error?
      # gtk_media_stream_get_error: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_stream_get_error(self)

      # Return value handling
      GLib::Error.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def loop : Bool
      # gtk_media_stream_get_loop: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_stream_get_loop(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def muted : Bool
      # gtk_media_stream_get_muted: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_stream_get_muted(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def playing : Bool
      # gtk_media_stream_get_playing: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_stream_get_playing(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def timestamp : Int64
      # gtk_media_stream_get_timestamp: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_stream_get_timestamp(self)

      # Return value handling
      _retval
    end

    def volume : Float64
      # gtk_media_stream_get_volume: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_stream_get_volume(self)

      # Return value handling
      _retval
    end

    def has_audio : Bool
      # gtk_media_stream_has_audio: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_stream_has_audio(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def has_video : Bool
      # gtk_media_stream_has_video: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_stream_has_video(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_prepared : Bool
      # gtk_media_stream_is_prepared: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_stream_is_prepared(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_seekable : Bool
      # gtk_media_stream_is_seekable: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_stream_is_seekable(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_seeking : Bool
      # gtk_media_stream_is_seeking: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_media_stream_is_seeking(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def pause : Nil
      # gtk_media_stream_pause: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_pause(self)

      # Return value handling
    end

    def play : Nil
      # gtk_media_stream_play: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_play(self)

      # Return value handling
    end

    def realize(surface : Gdk::Surface) : Nil
      # gtk_media_stream_realize: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_realize(self, surface)

      # Return value handling
    end

    def seek(timestamp : Int64) : Nil
      # gtk_media_stream_seek: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_seek(self, timestamp)

      # Return value handling
    end

    def seek_failed : Nil
      # gtk_media_stream_seek_failed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_seek_failed(self)

      # Return value handling
    end

    def seek_success : Nil
      # gtk_media_stream_seek_success: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_seek_success(self)

      # Return value handling
    end

    def loop=(loop : Bool) : Nil
      # gtk_media_stream_set_loop: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_set_loop(self, loop)

      # Return value handling
    end

    def muted=(muted : Bool) : Nil
      # gtk_media_stream_set_muted: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_set_muted(self, muted)

      # Return value handling
    end

    def playing=(playing : Bool) : Nil
      # gtk_media_stream_set_playing: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_set_playing(self, playing)

      # Return value handling
    end

    def volume=(volume : Float64) : Nil
      # gtk_media_stream_set_volume: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_set_volume(self, volume)

      # Return value handling
    end

    def stream_ended : Nil
      # gtk_media_stream_stream_ended: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_stream_ended(self)

      # Return value handling
    end

    def stream_prepared(has_audio : Bool, has_video : Bool, seekable : Bool, duration : Int64) : Nil
      # gtk_media_stream_stream_prepared: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_stream_prepared(self, has_audio, has_video, seekable, duration)

      # Return value handling
    end

    def stream_unprepared : Nil
      # gtk_media_stream_stream_unprepared: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_stream_unprepared(self)

      # Return value handling
    end

    def unrealize(surface : Gdk::Surface) : Nil
      # gtk_media_stream_unrealize: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_unrealize(self, surface)

      # Return value handling
    end

    def update(timestamp : Int64) : Nil
      # gtk_media_stream_update: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_media_stream_update(self, timestamp)

      # Return value handling
    end
  end
end
