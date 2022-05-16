require "../g_object-2.0/object"
require "../gdk-4.0/paintable"

module Gtk
  # `GtkMediaStream` is the integration point for media playback inside GTK.
  #
  # GTK provides an implementation of the `GtkMediaStream` interface that
  # is called `Gtk#MediaFile`.
  #
  # Apart from application-facing API for stream playback, `GtkMediaStream`
  # has a number of APIs that are only useful for implementations and should
  # not be used in applications:
  # `Gtk::MediaStream#prepared`,
  # `Gtk::MediaStream#unprepared`,
  # `Gtk::MediaStream#update`,
  # `Gtk::MediaStream#ended`,
  # `Gtk::MediaStream#seek_success`,
  # `Gtk::MediaStream#seek_failed`,
  # `Gtk::MediaStream#gerror`,
  # `Gtk::MediaStream#error`,
  # `Gtk::MediaStream#error_valist`.
  @[GObject::GeneratedWrapper]
  class MediaStream < GObject::Object
    include Gdk::Paintable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::MediaStreamClass), class_init,
        sizeof(LibGtk::MediaStream), instance_init, 0)
    end

    GICrystal.define_new_method(MediaStream, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `MediaStream`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, duration : Int64? = nil, ended : Bool? = nil, error : GLib::Error? = nil, has_audio : Bool? = nil, has_video : Bool? = nil, loop : Bool? = nil, muted : Bool? = nil, playing : Bool? = nil, prepared : Bool? = nil, seekable : Bool? = nil, seeking : Bool? = nil, timestamp : Int64? = nil, volume : Float64? = nil)
      _names = uninitialized Pointer(LibC::Char)[13]
      _values = StaticArray(LibGObject::Value, 13).new(LibGObject::Value.new)
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

      @pointer = LibGObject.g_object_new_with_properties(MediaStream.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Sets @self into an error state.
    #
    # This will pause the stream (you can check for an error
    # via `Gtk::MediaStream#error` in your
    # GtkMediaStream.pause() implementation), abort pending
    # seeks and mark the stream as prepared.
    #
    # if the stream is already in an error state, this call
    # will be ignored and the existing error will be retained.
    #
    # To unset an error, the stream must be reset via a call to
    # `Gtk::MediaStream#unprepared`.
    def gerror(error : GLib::Error) : Nil
      # gtk_media_stream_gerror: (Method)
      # @error: (transfer full)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_gerror(@pointer, error)

      # Return value handling
    end

    # Gets the duration of the stream.
    #
    # If the duration is not known, 0 will be returned.
    def duration : Int64
      # gtk_media_stream_get_duration: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_media_stream_get_duration(@pointer)

      # Return value handling

      _retval
    end

    # Returns whether the streams playback is finished.
    def ended : Bool
      # gtk_media_stream_get_ended: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_media_stream_get_ended(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # If the stream is in an error state, returns the `GError`
    # explaining that state.
    #
    # Any type of error can be reported here depending on the
    # implementation of the media stream.
    #
    # A media stream in an error cannot be operated on, calls
    # like `Gtk::MediaStream#play` or
    # `Gtk::MediaStream#seek` will not have any effect.
    #
    # `GtkMediaStream` itself does not provide a way to unset
    # an error, but implementations may provide options. For example,
    # a `Gtk#MediaFile` will unset errors when a new source is
    # set, e.g. with `Gtk::MediaFile#file=`.
    def error : GLib::Error?
      # gtk_media_stream_get_error: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_media_stream_get_error(@pointer)

      # Return value handling

      GLib::Error.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether the stream is set to loop.
    #
    # See `Gtk::MediaStream#loop=` for details.
    def loop : Bool
      # gtk_media_stream_get_loop: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_media_stream_get_loop(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the audio for the stream is muted.
    #
    # See `Gtk::MediaStream#muted=` for details.
    def muted : Bool
      # gtk_media_stream_get_muted: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_media_stream_get_muted(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Return whether the stream is currently playing.
    def playing : Bool
      # gtk_media_stream_get_playing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_media_stream_get_playing(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the current presentation timestamp in microseconds.
    def timestamp : Int64
      # gtk_media_stream_get_timestamp: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_media_stream_get_timestamp(@pointer)

      # Return value handling

      _retval
    end

    # Returns the volume of the audio for the stream.
    #
    # See `Gtk::MediaStream#volume=` for details.
    def volume : Float64
      # gtk_media_stream_get_volume: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_media_stream_get_volume(@pointer)

      # Return value handling

      _retval
    end

    # Returns whether the stream has audio.
    def has_audio : Bool
      # gtk_media_stream_has_audio: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_media_stream_has_audio(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the stream has video.
    def has_video : Bool
      # gtk_media_stream_has_video: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_media_stream_has_video(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the stream has finished initializing.
    #
    # At this point the existence of audio and video is known.
    def is_prepared : Bool
      # gtk_media_stream_is_prepared: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_media_stream_is_prepared(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if a stream may be seekable.
    #
    # This is meant to be a hint. Streams may not allow seeking even if
    # this function returns %TRUE. However, if this function returns
    # %FALSE, streams are guaranteed to not be seekable and user interfaces
    # may hide controls that allow seeking.
    #
    # It is allowed to call `Gtk::MediaStream#seek` on a non-seekable
    # stream, though it will not do anything.
    def is_seekable : Bool
      # gtk_media_stream_is_seekable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_media_stream_is_seekable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if there is currently a seek operation going on.
    def is_seeking : Bool
      # gtk_media_stream_is_seeking: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_media_stream_is_seeking(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Pauses playback of the stream.
    #
    # If the stream is not playing, do nothing.
    def pause : Nil
      # gtk_media_stream_pause: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_pause(@pointer)

      # Return value handling
    end

    # Starts playing the stream.
    #
    # If the stream is in error or already playing, do nothing.
    def play : Nil
      # gtk_media_stream_play: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_play(@pointer)

      # Return value handling
    end

    # Called by users to attach the media stream to a `GdkSurface` they manage.
    #
    # The stream can then access the resources of @surface for its
    # rendering purposes. In particular, media streams might want to
    # create a `GdkGLContext` or sync to the `GdkFrameClock`.
    #
    # Whoever calls this function is responsible for calling
    # `Gtk::MediaStream#unrealize` before either the stream
    # or @surface get destroyed.
    #
    # Multiple calls to this function may happen from different
    # users of the video, even with the same @surface. Each of these
    # calls must be followed by its own call to
    # `Gtk::MediaStream#unrealize`.
    #
    # It is not required to call this function to make a media stream work.
    def realize(surface : Gdk::Surface) : Nil
      # gtk_media_stream_realize: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_realize(@pointer, surface)

      # Return value handling
    end

    # Start a seek operation on @self to @timestamp.
    #
    # If @timestamp is out of range, it will be clamped.
    #
    # Seek operations may not finish instantly. While a
    # seek operation is in process, the `Gtk::MediaStream#seeking`
    # property will be set.
    #
    # When calling gtk_media_stream_seek() during an
    # ongoing seek operation, the new seek will override
    # any pending seek.
    def seek(timestamp : Int64) : Nil
      # gtk_media_stream_seek: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_seek(@pointer, timestamp)

      # Return value handling
    end

    # Ends a seek operation started via GtkMediaStream.seek() as a failure.
    #
    # This will not cause an error on the stream and will assume that
    # playback continues as if no seek had happened.
    #
    # See `Gtk::MediaStream#seek_success` for the other way of
    # ending a seek.
    def seek_failed : Nil
      # gtk_media_stream_seek_failed: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_seek_failed(@pointer)

      # Return value handling
    end

    # Ends a seek operation started via GtkMediaStream.seek() successfully.
    #
    # This function will unset the GtkMediaStream:ended property
    # if it was set.
    #
    # See `Gtk::MediaStream#seek_failed` for the other way of
    # ending a seek.
    def seek_success : Nil
      # gtk_media_stream_seek_success: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_seek_success(@pointer)

      # Return value handling
    end

    # Sets whether the stream should loop.
    #
    # In this case, it will attempt to restart playback
    # from the beginning instead of stopping at the end.
    #
    # Not all streams may support looping, in particular
    # non-seekable streams. Those streams will ignore the
    # loop setting and just end.
    def loop=(loop : Bool) : Nil
      # gtk_media_stream_set_loop: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_set_loop(@pointer, loop)

      # Return value handling
    end

    # Sets whether the audio stream should be muted.
    #
    # Muting a stream will cause no audio to be played, but it
    # does not modify the volume. This means that muting and
    # then unmuting the stream will restore the volume settings.
    #
    # If the stream has no audio, calling this function will
    # still work but it will not have an audible effect.
    def muted=(muted : Bool) : Nil
      # gtk_media_stream_set_muted: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_set_muted(@pointer, muted)

      # Return value handling
    end

    # Starts or pauses playback of the stream.
    def playing=(playing : Bool) : Nil
      # gtk_media_stream_set_playing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_set_playing(@pointer, playing)

      # Return value handling
    end

    # Sets the volume of the audio stream.
    #
    # This function call will work even if the stream is muted.
    #
    # The given @volume should range from 0.0 for silence to 1.0
    # for as loud as possible. Values outside of this range will
    # be clamped to the nearest value.
    #
    # If the stream has no audio or is muted, calling this function
    # will still work but it will not have an immediate audible effect.
    # When the stream is unmuted, the new volume setting will take effect.
    def volume=(volume : Float64) : Nil
      # gtk_media_stream_set_volume: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_set_volume(@pointer, volume)

      # Return value handling
    end

    # Pauses the media stream and marks it as ended.
    #
    # This is a hint only, calls to `Gtk::MediaStream#play`
    # may still happen.
    #
    # The media stream must be prepared when this function is called.
    def stream_ended : Nil
      # gtk_media_stream_stream_ended: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_stream_ended(@pointer)

      # Return value handling
    end

    # Called by `GtkMediaStream` implementations to advertise the stream
    # being ready to play and providing details about the stream.
    #
    # Note that the arguments are hints. If the stream implementation
    # cannot determine the correct values, it is better to err on the
    # side of caution and return %TRUE. User interfaces will use those
    # values to determine what controls to show.
    #
    # This function may not be called again until the stream has been
    # reset via `Gtk::MediaStream#stream_unprepared`.
    def stream_prepared(has_audio : Bool, has_video : Bool, seekable : Bool, duration : Int64) : Nil
      # gtk_media_stream_stream_prepared: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_stream_prepared(@pointer, has_audio, has_video, seekable, duration)

      # Return value handling
    end

    # Resets a given media stream implementation.
    #
    # `Gtk::MediaStream#stream_prepared` can then be called again.
    #
    # This function will also reset any error state the stream was in.
    def stream_unprepared : Nil
      # gtk_media_stream_stream_unprepared: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_stream_unprepared(@pointer)

      # Return value handling
    end

    # Undoes a previous call to gtk_media_stream_realize().
    #
    # This causes the stream to release all resources it had
    # allocated from @surface.
    def unrealize(surface : Gdk::Surface) : Nil
      # gtk_media_stream_unrealize: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_unrealize(@pointer, surface)

      # Return value handling
    end

    # Media stream implementations should regularly call this
    # function to update the timestamp reported by the stream.
    #
    # It is up to implementations to call this at the frequency
    # they deem appropriate.
    #
    # The media stream must be prepared when this function is called.
    def update(timestamp : Int64) : Nil
      # gtk_media_stream_update: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_media_stream_update(@pointer, timestamp)

      # Return value handling
    end
  end
end
