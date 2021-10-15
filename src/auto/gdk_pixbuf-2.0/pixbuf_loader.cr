require "../g_object-2.0/object"

module GdkPixbuf
  # Incremental image loader.
  #
  # `GdkPixbufLoader` provides a way for applications to drive the
  # process of loading an image, by letting them send the image data
  # directly to the loader instead of having the loader read the data
  # from a file. Applications can use this functionality instead of
  # `gdk_pixbuf_new_from_file()` or `gdk_pixbuf_animation_new_from_file()`
  # when they need to parse image data in small chunks. For example,
  # it should be used when reading an image from a (potentially) slow
  # network connection, or when loading an extremely large file.
  #
  # To use `GdkPixbufLoader` to load an image, create a new instance,
  # and call [method@GdkPixbuf.PixbufLoader.write] to send the data
  # to it. When done, [method@GdkPixbuf.PixbufLoader.close] should be
  # called to end the stream and finalize everything.
  #
  # The loader will emit three important signals throughout the process:
  #
  #  - [signal@GdkPixbuf.PixbufLoader::size-prepared] will be emitted as
  #    soon as the image has enough information to determine the size of
  #    the image to be used. If you want to scale the image while loading
  #    it, you can call [method@GdkPixbuf.PixbufLoader.set_size] in
  #    response to this signal.
  #  - [signal@GdkPixbuf.PixbufLoader::area-prepared] will be emitted as
  #    soon as the pixbuf of the desired has been allocated. You can obtain
  #    the `GdkPixbuf` instance by calling [method@GdkPixbuf.PixbufLoader.get_pixbuf].
  #    If you want to use it, simply acquire a reference to it. You can
  #    also call `gdk_pixbuf_loader_get_pixbuf()` later to get the same
  #    pixbuf.
  #  - [signal@GdkPixbuf.PixbufLoader::area-updated] will be emitted every
  #    time a region is updated. This way you can update a partially
  #    completed image. Note that you do not know anything about the
  #    completeness of an image from the updated area. For example, in an
  #    interlaced image you will need to make several passes before the
  #    image is done loading.
  #
  # ## Loading an animation
  #
  # Loading an animation is almost as easy as loading an image. Once the
  # first [signal@GdkPixbuf.PixbufLoader::area-prepared] signal has been
  # emitted, you can call [method@GdkPixbuf.PixbufLoader.get_animation] to
  # get the [class@GdkPixbuf.PixbufAnimation] instance, and then call
  # and [method@GdkPixbuf.PixbufAnimation.get_iter] to get a
  # [class@GdkPixbuf.PixbufAnimationIter] to retrieve the pixbuf for the
  # desired time stamp.
  class PixbufLoader < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdkPixbuf.gdk_pixbuf_loader_get_type
    end

    def initialize
      # gdk_pixbuf_loader_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_loader_new
      @pointer = _retval
    end

    def self.new_with_mime_type(mime_type : ::String) : GdkPixbuf::PixbufLoader
      # gdk_pixbuf_loader_new_with_mime_type: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_loader_new_with_mime_type(mime_type)
      GdkPixbuf::PixbufLoader.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_with_type(image_type : ::String) : GdkPixbuf::PixbufLoader
      # gdk_pixbuf_loader_new_with_type: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_loader_new_with_type(image_type)
      GdkPixbuf::PixbufLoader.new(_retval, GICrystal::Transfer::Full)
    end

    def close : Bool
      # gdk_pixbuf_loader_close: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_loader_close(self)
      GICrystal.to_bool(_retval)
    end

    def animation : GdkPixbuf::PixbufAnimation?
      # gdk_pixbuf_loader_get_animation: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_loader_get_animation(self)
      GdkPixbuf::PixbufAnimation.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def format : GdkPixbuf::PixbufFormat?
      # gdk_pixbuf_loader_get_format: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_loader_get_format(self)
      GdkPixbuf::PixbufFormat.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def pixbuf : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_loader_get_pixbuf: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_loader_get_pixbuf(self)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def set_size(width : Int32, height : Int32) : Nil
      # gdk_pixbuf_loader_set_size: (Method)
      # Returns: (transfer none)

      LibGdkPixbuf.gdk_pixbuf_loader_set_size(self, width, height)
    end

    def write(buf : Enumerable(UInt8)) : Bool
      # gdk_pixbuf_loader_write: (Method | Throws)
      # @buf: (array length=count element-type UInt8)
      # Returns: (transfer none)

      count = buf.size
      buf = buf.to_a.to_unsafe

      _retval = LibGdkPixbuf.gdk_pixbuf_loader_write(self, buf, count)
      GICrystal.to_bool(_retval)
    end

    def write(*buf : UInt8)
      write(buf)
    end

    def write_bytes(buffer : GLib::Bytes) : Bool
      # gdk_pixbuf_loader_write_bytes: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_loader_write_bytes(self, buffer)
      GICrystal.to_bool(_retval)
    end

    struct AreaPreparedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "area-prepared::#{@detail}" : "area-prepared"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(GdkPixbuf::PixbufLoader, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = GdkPixbuf::PixbufLoader.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(GdkPixbuf::PixbufLoader, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(GdkPixbuf::PixbufLoader, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = GdkPixbuf::PixbufLoader.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(GdkPixbuf::PixbufLoader, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "area-prepared")
      end
    end

    def area_prepared_signal
      AreaPreparedSignal.new(self)
    end

    struct AreaUpdatedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "area-updated::#{@detail}" : "area-updated"
      end

      def connect(&block : Proc(Int32, Int32, Int32, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Int32, Int32, Int32, Int32, Nil))
        connect(block)
      end

      def connect(block : Proc(Int32, Int32, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, lib_arg2 : Int32, lib_arg3 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          arg3 = lib_arg3
          ::Box(Proc(Int32, Int32, Int32, Int32, Nil)).unbox(box).call(arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Int32, Int32, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, lib_arg2 : Int32, lib_arg3 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          arg3 = lib_arg3
          ::Box(Proc(Int32, Int32, Int32, Int32, Nil)).unbox(box).call(arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, lib_arg2 : Int32, lib_arg3 : Int32, box : Pointer(Void)) {
          sender = GdkPixbuf::PixbufLoader.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          arg3 = lib_arg3
          ::Box(Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Int32, Int32, Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, lib_arg2 : Int32, lib_arg3 : Int32, box : Pointer(Void)) {
          sender = GdkPixbuf::PixbufLoader.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          arg3 = lib_arg3
          ::Box(Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Int32, Int32, Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(x : Int32, y : Int32, width : Int32, height : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "area-updated", x, y, width, height)
      end
    end

    def area_updated_signal
      AreaUpdatedSignal.new(self)
    end

    struct ClosedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "closed::#{@detail}" : "closed"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(GdkPixbuf::PixbufLoader, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = GdkPixbuf::PixbufLoader.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(GdkPixbuf::PixbufLoader, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(GdkPixbuf::PixbufLoader, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = GdkPixbuf::PixbufLoader.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(GdkPixbuf::PixbufLoader, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "closed")
      end
    end

    def closed_signal
      ClosedSignal.new(self)
    end

    struct SizePreparedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "size-prepared::#{@detail}" : "size-prepared"
      end

      def connect(&block : Proc(Int32, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Int32, Int32, Nil))
        connect(block)
      end

      def connect(block : Proc(Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Int32, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Int32, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = GdkPixbuf::PixbufLoader.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = GdkPixbuf::PixbufLoader.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(width : Int32, height : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "size-prepared", width, height)
      end
    end

    def size_prepared_signal
      SizePreparedSignal.new(self)
    end
  end
end
