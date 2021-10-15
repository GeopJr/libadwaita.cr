module Gdk
  # A `GdkFrameTimings` object holds timing information for a single frame
  # of the application’s displays.
  #
  # To retrieve `GdkFrameTimings` objects, use [method@Gdk.FrameClock.get_timings]
  # or [method@Gdk.FrameClock.get_current_timings]. The information in
  # `GdkFrameTimings` is useful for precise synchronization of video with
  # the event or audio streams, and for measuring quality metrics for the
  # application’s display, such as latency and jitter.
  class FrameTimings
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(FrameTimings.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(FrameTimings.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_frame_timings_get_type
    end

    def complete? : Bool
      # gdk_frame_timings_get_complete: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_frame_timings_get_complete(self)
      GICrystal.to_bool(_retval)
    end

    def frame_counter : Int64
      # gdk_frame_timings_get_frame_counter: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_frame_timings_get_frame_counter(self)
      _retval
    end

    def frame_time : Int64
      # gdk_frame_timings_get_frame_time: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_frame_timings_get_frame_time(self)
      _retval
    end

    def predicted_presentation_time : Int64
      # gdk_frame_timings_get_predicted_presentation_time: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_frame_timings_get_predicted_presentation_time(self)
      _retval
    end

    def presentation_time : Int64
      # gdk_frame_timings_get_presentation_time: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_frame_timings_get_presentation_time(self)
      _retval
    end

    def refresh_interval : Int64
      # gdk_frame_timings_get_refresh_interval: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_frame_timings_get_refresh_interval(self)
      _retval
    end

    def ref : Gdk::FrameTimings
      # gdk_frame_timings_ref: (Method)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_frame_timings_ref(self)
      Gdk::FrameTimings.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # gdk_frame_timings_unref: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_frame_timings_unref(self)
    end

    def to_unsafe
      @pointer
    end
  end
end
