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

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_content_formats_builder_new

      # Return value handling
      @pointer = _retval
    end

    def add_formats(formats : Gdk::ContentFormats) : Nil
      # gdk_content_formats_builder_add_formats: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_content_formats_builder_add_formats(self, formats)

      # Return value handling
    end

    def add_gtype(type : UInt64) : Nil
      # gdk_content_formats_builder_add_gtype: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_content_formats_builder_add_gtype(self, type)

      # Return value handling
    end

    def add_mime_type(mime_type : ::String) : Nil
      # gdk_content_formats_builder_add_mime_type: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_content_formats_builder_add_mime_type(self, mime_type)

      # Return value handling
    end

    def ref : Gdk::ContentFormatsBuilder
      # gdk_content_formats_builder_ref: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_content_formats_builder_ref(self)

      # Return value handling
      Gdk::ContentFormatsBuilder.new(_retval, GICrystal::Transfer::None)
    end

    def to_formats : Gdk::ContentFormats
      # gdk_content_formats_builder_to_formats: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_content_formats_builder_to_formats(self)

      # Return value handling
      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # gdk_content_formats_builder_unref: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_content_formats_builder_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
