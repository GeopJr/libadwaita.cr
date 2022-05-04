module Gdk
  # The `GdkContentFormats` structure is used to advertise and negotiate the
  # format of content.
  #
  # You will encounter `GdkContentFormats` when interacting with objects
  # controlling operations that pass data between different widgets, window
  # or application, like `Gdk#Drag`, `Gdk#Drop`,
  # `Gdk#Clipboard` or `Gdk#ContentProvider`.
  #
  # GDK supports content in 2 forms: `GType` and mime type.
  # Using `GTypes` is meant only for in-process content transfers. Mime types
  # are meant to be used for data passing both in-process and out-of-process.
  # The details of how data is passed is described in the documentation of
  # the actual implementations. To transform between the two forms,
  # `Gdk#ContentSerializer` and `Gdk#ContentDeserializer` are used.
  #
  # A `GdkContentFormats` describes a set of possible formats content can be
  # exchanged in. It is assumed that this set is ordered. `GTypes` are more
  # important than mime types. Order between different `GTypes` or mime types
  # is the order they were added in, most important first. Functions that
  # care about order, such as `Gdk::ContentFormats#union`, will describe
  # in their documentation how they interpret that order, though in general the
  # order of the first argument is considered the primary order of the result,
  # followed by the order of further arguments.
  #
  # For debugging purposes, the function `Gdk::ContentFormats#to_string`
  # exists. It will print a comma-separated list of formats from most important
  # to least important.
  #
  # `GdkContentFormats` is an immutable struct. After creation, you cannot change
  # the types it represents. Instead, new `GdkContentFormats` have to be created.
  # The `Gdk#ContentFormatsBuilder` structure is meant to help in this
  # endeavor.
  class ContentFormats
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(ContentFormats.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(ContentFormats.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGdk::ContentFormats)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_content_formats_get_type
    end

    def initialize(mime_types : Enumerable(::String)?)
      # gdk_content_formats_new: (Constructor)
      # @mime_types: (nullable) (array length=n_mime_types element-type Utf8)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_mime_types = mime_types.try(&.size) || 0 # Generator::NullableArrayPlan
      mime_types = if mime_types.nil?
                     Pointer(Pointer(LibC::Char)).null
                   else
                     mime_types.to_a.map(&.to_unsafe).to_unsafe
                   end

      # C call
      _retval = LibGdk.gdk_content_formats_new(mime_types, n_mime_types)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    def initialize(*mime_types : ::String)
      initialize(mime_types)
    end

    def self.new_for_gtype(type : UInt64) : self
      # gdk_content_formats_new_for_gtype: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_content_formats_new_for_gtype(type)

      # Return value handling

      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full)
    end

    def contain_gtype(type : UInt64) : Bool
      # gdk_content_formats_contain_gtype: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_formats_contain_gtype(self, type)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def contain_mime_type(mime_type : ::String) : Bool
      # gdk_content_formats_contain_mime_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_formats_contain_mime_type(self, mime_type)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def gtypes : Enumerable(UInt64)?
      # gdk_content_formats_get_gtypes: (Method)
      # @n_gtypes: (out) (transfer full) (optional)
      # Returns: (transfer none) (array length=n_gtypes zero-terminated=1 element-type Gtype)

      # Generator::OutArgUsedInReturnPlan
      n_gtypes = 0_u64
      # C call
      _retval = LibGdk.gdk_content_formats_get_gtypes(self, pointerof(n_gtypes))

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def mime_types : Enumerable(::String)?
      # gdk_content_formats_get_mime_types: (Method)
      # @n_mime_types: (out) (transfer full) (optional)
      # Returns: (transfer none) (array length=n_mime_types zero-terminated=1 element-type Utf8)

      # Generator::OutArgUsedInReturnPlan
      n_mime_types = 0_u64
      # C call
      _retval = LibGdk.gdk_content_formats_get_mime_types(self, pointerof(n_mime_types))

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def match(second : Gdk::ContentFormats) : Bool
      # gdk_content_formats_match: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_formats_match(self, second)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def match_gtype(second : Gdk::ContentFormats) : UInt64
      # gdk_content_formats_match_gtype: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_formats_match_gtype(self, second)

      # Return value handling

      _retval
    end

    def match_mime_type(second : Gdk::ContentFormats) : ::String?
      # gdk_content_formats_match_mime_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_formats_match_mime_type(self, second)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    def print(string : GLib::String) : Nil
      # gdk_content_formats_print: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_content_formats_print(self, string)

      # Return value handling
    end

    def ref : Gdk::ContentFormats
      # gdk_content_formats_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_content_formats_ref(self)

      # Return value handling

      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full)
    end

    def to_string : ::String
      # gdk_content_formats_to_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_content_formats_to_string(self)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def union(second : Gdk::ContentFormats) : Gdk::ContentFormats
      # gdk_content_formats_union: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_content_formats_union(self, second)

      # Return value handling

      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full)
    end

    def union_deserialize_gtypes : Gdk::ContentFormats
      # gdk_content_formats_union_deserialize_gtypes: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_content_formats_union_deserialize_gtypes(self)

      # Return value handling

      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full)
    end

    def union_deserialize_mime_types : Gdk::ContentFormats
      # gdk_content_formats_union_deserialize_mime_types: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_content_formats_union_deserialize_mime_types(self)

      # Return value handling

      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full)
    end

    def union_serialize_gtypes : Gdk::ContentFormats
      # gdk_content_formats_union_serialize_gtypes: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_content_formats_union_serialize_gtypes(self)

      # Return value handling

      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full)
    end

    def union_serialize_mime_types : Gdk::ContentFormats
      # gdk_content_formats_union_serialize_mime_types: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_content_formats_union_serialize_mime_types(self)

      # Return value handling

      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # gdk_content_formats_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_content_formats_unref(self)

      # Return value handling
    end

    def self.parse(string : ::String) : Gdk::ContentFormats?
      # gdk_content_formats_parse: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_content_formats_parse(string)

      # Return value handling

      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def to_unsafe
      @pointer
    end
  end
end
