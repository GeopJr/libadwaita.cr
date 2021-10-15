module Gdk
  # A `GdkContentFormatsBuilder` is an auxiliary struct used to create
  # new `GdkContentFormats`, and should not be kept around.
  class ContentFormatsBuilder
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(ContentFormatsBuilder.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(ContentFormatsBuilder.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_content_formats_builder_get_type
    end

    def initialize
      # gdk_content_formats_builder_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_content_formats_builder_new
      @pointer = _retval
    end

    def add_formats(formats : Gdk::ContentFormats) : Nil
      # gdk_content_formats_builder_add_formats: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_content_formats_builder_add_formats(self, formats)
    end

    def add_gtype(type : UInt64) : Nil
      # gdk_content_formats_builder_add_gtype: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_content_formats_builder_add_gtype(self, type)
    end

    def add_mime_type(mime_type : ::String) : Nil
      # gdk_content_formats_builder_add_mime_type: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_content_formats_builder_add_mime_type(self, mime_type)
    end

    def ref : Gdk::ContentFormatsBuilder
      # gdk_content_formats_builder_ref: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_content_formats_builder_ref(self)
      Gdk::ContentFormatsBuilder.new(_retval, GICrystal::Transfer::None)
    end

    def to_formats : Gdk::ContentFormats
      # gdk_content_formats_builder_to_formats: (Method)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_content_formats_builder_to_formats(self)
      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # gdk_content_formats_builder_unref: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_content_formats_builder_unref(self)
    end

    def to_unsafe
      @pointer
    end
  end
end
