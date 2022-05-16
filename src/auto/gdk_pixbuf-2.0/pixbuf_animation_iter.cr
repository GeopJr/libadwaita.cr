require "../g_object-2.0/object"

module GdkPixbuf
  # An opaque object representing an iterator which points to a
  # certain position in an animation.
  @[GObject::GeneratedWrapper]
  class PixbufAnimationIter < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGdkPixbuf::PixbufAnimationIterClass), class_init,
        sizeof(LibGdkPixbuf::PixbufAnimationIter), instance_init, 0)
    end

    GICrystal.define_new_method(PixbufAnimationIter, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `PixbufAnimationIter`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdkPixbuf.gdk_pixbuf_animation_iter_get_type
    end

    # Possibly advances an animation to a new frame.
    #
    # Chooses the frame based on the start time passed to
    # gdk_pixbuf_animation_get_iter().
    #
    # @current_time would normally come from g_get_current_time(), and
    # must be greater than or equal to the time passed to
    # gdk_pixbuf_animation_get_iter(), and must increase or remain
    # unchanged each time gdk_pixbuf_animation_iter_get_pixbuf() is
    # called. That is, you can't go backward in time; animations only
    # play forward.
    #
    # As a shortcut, pass `NULL` for the current time and g_get_current_time()
    # will be invoked on your behalf. So you only need to explicitly pass
    # @current_time if you're doing something odd like playing the animation
    # at double speed.
    #
    # If this function returns `FALSE`, there's no need to update the animation
    # display, assuming the display had been rendered prior to advancing;
    # if `TRUE`, you need to call gdk_pixbuf_animation_iter_get_pixbuf()
    # and update the display with the new pixbuf.
    def advance(current_time : GLib::TimeVal?) : Bool
      # gdk_pixbuf_animation_iter_advance: (Method)
      # @current_time: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      current_time = if current_time.nil?
                       Pointer(Void).null
                     else
                       current_time.to_unsafe
                     end

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_iter_advance(@pointer, current_time)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the number of milliseconds the current pixbuf should be displayed,
    # or -1 if the current pixbuf should be displayed forever.
    #
    # The `g_timeout_add()` function conveniently takes a timeout in milliseconds,
    # so you can use a timeout to schedule the next update.
    #
    # Note that some formats, like GIF, might clamp the timeout values in the
    # image file to avoid updates that are just too quick. The minimum timeout
    # for GIF images is currently 20 milliseconds.
    def delay_time : Int32
      # gdk_pixbuf_animation_iter_get_delay_time: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_iter_get_delay_time(@pointer)

      # Return value handling

      _retval
    end

    # Gets the current pixbuf which should be displayed.
    #
    # The pixbuf might not be the same size as the animation itself
    # (gdk_pixbuf_animation_get_width(), gdk_pixbuf_animation_get_height()).
    #
    # This pixbuf should be displayed for gdk_pixbuf_animation_iter_get_delay_time()
    # milliseconds.
    #
    # The caller of this function does not own a reference to the returned
    # pixbuf; the returned pixbuf will become invalid when the iterator
    # advances to the next frame, which may happen anytime you call
    # gdk_pixbuf_animation_iter_advance().
    #
    # Copy the pixbuf to keep it (don't just add a reference), as it may get
    # recycled as you advance the iterator.
    def pixbuf : GdkPixbuf::Pixbuf
      # gdk_pixbuf_animation_iter_get_pixbuf: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_iter_get_pixbuf(@pointer)

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::None)
    end

    # Used to determine how to respond to the area_updated signal on
    # #GdkPixbufLoader when loading an animation.
    #
    # The `::area_updated` signal is emitted for an area of the frame currently
    # streaming in to the loader. So if you're on the currently loading frame,
    # you will need to redraw the screen for the updated area.
    def on_currently_loading_frame : Bool
      # gdk_pixbuf_animation_iter_on_currently_loading_frame: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_iter_on_currently_loading_frame(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
